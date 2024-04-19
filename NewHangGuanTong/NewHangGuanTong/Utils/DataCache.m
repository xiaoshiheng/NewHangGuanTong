//
//  DataCache.m
//  NewCarProject
//
//  Created by 车呗 on 2017/11/24.
//  Copyright © 2017年 车呗新车. All rights reserved.
//

#import "DataCache.h"
#import <SDWebImage/SDImageCache.h>
#import <WebKit/WebKit.h>


@interface DataCache()
@property (nonatomic,strong,readwrite) NSCache * memoryCache;
@property (nonatomic,strong) dispatch_queue_t ioQueue;
@property (nonatomic,copy) NSString * filePath;

@end
#define FILE_PATH(key) [self.filePath stringByAppendingPathComponent:key]
#define DIR_NAME    @"CXD.PersianCat.cacheDir"
#define QUE_NAME    "CXD.PersianCat.queue"

@implementation DataCache

- (id)init {
    if (self = [super init]) {
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(clearMemory)
                                                     name:UIApplicationDidReceiveMemoryWarningNotification
                                                   object:nil];
    }
    
    return self;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

+ (instancetype)sharedInstance{
    static DataCache *cache = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        cache = [[[self class] alloc] init];
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
        cache.filePath = [paths[0] stringByAppendingPathComponent:DIR_NAME];
        if(![[NSFileManager defaultManager] fileExistsAtPath:cache.filePath]){
            NSError * error = nil;
            [[NSFileManager defaultManager] createDirectoryAtPath:cache.filePath
                                      withIntermediateDirectories:NO
                                                       attributes:nil
                                                            error:&error];
        }
        cache.ioQueue = dispatch_queue_create(QUE_NAME, DISPATCH_QUEUE_SERIAL);
        cache.memoryCache = [NSCache new];
        cache.memoryCache.name = DIR_NAME;
        
    });
    return cache;
}

-(void)setDataFilePath{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    self.filePath = [paths[0] stringByAppendingPathComponent:DIR_NAME];
    if(![[NSFileManager defaultManager] fileExistsAtPath:self.filePath]){
        NSError * error = nil;
        [[NSFileManager defaultManager] createDirectoryAtPath:self.filePath
                                  withIntermediateDirectories:NO
                                                   attributes:nil
                                                        error:&error];
    }
}

- (void)clearMemory {
    dispatch_async(self.ioQueue, ^{
        [self.memoryCache removeAllObjects];
    });
}


- (void)saveData:(id<NSCoding>)data key:(NSString *)key{
    [self setDataFilePath];
    if(!data){
        return;
    }else{
        dispatch_async(self.ioQueue, ^{
            [NSKeyedArchiver archiveRootObject:data toFile:FILE_PATH(key)];
            [self.memoryCache setObject:data forKey:key];
        });
    }
    
    NSLog(@"%@",FILE_PATH(key));
}

- (id)fetchDataWithKey:(NSString *)key{
    id obj = [self.memoryCache objectForKey:key];
    if(obj){
        return obj;
    }else{
        obj = [NSKeyedUnarchiver unarchiveObjectWithFile:FILE_PATH(key)];
        if(obj){
            [self.memoryCache setObject:obj forKey:key];
        }
        return obj;
    }
}

- (void)removeDataWithKey:(NSString *)key {
    id obj = [self.memoryCache objectForKey:key];
    if(obj){
        dispatch_async(self.ioQueue, ^{
            [self.memoryCache removeObjectForKey:key];
            [[NSFileManager defaultManager] removeItemAtPath:FILE_PATH(key) error:nil];
        });
    }
}

-(long long)fileSizeAtPath:(NSString*)filePath{
    NSFileManager* manager = [NSFileManager defaultManager];
    if ([manager fileExistsAtPath:filePath]){
        return [[manager attributesOfItemAtPath:filePath error:nil] fileSize];
    }
    return 0;
}
-(float)getCacheSizeAtPath{
    NSFileManager* manager = [NSFileManager defaultManager];
    if (![manager fileExistsAtPath:self.filePath]) return 0;
    NSEnumerator *childFilesEnumerator = [[manager subpathsAtPath:self.filePath] objectEnumerator];//从前向后枚举器
    NSString* fileName;
    long long folderSize = 0;
    while ((fileName = [childFilesEnumerator nextObject]) != nil){
        NSLog(@"fileName ==== %@",fileName);
        NSString* fileAbsolutePath = [self.filePath stringByAppendingPathComponent:fileName];
        NSLog(@"fileAbsolutePath ==== %@",fileAbsolutePath);
        folderSize += [self fileSizeAtPath:fileAbsolutePath];
    }
    NSLog(@"folderSize ==== %lld",folderSize);
   // return folderSize/(1024.0*1024.0);
    //加上sdwebimg缓存 (暂时不加)
    long long sdBytesCache = [[SDImageCache sharedImageCache] totalDiskSize];
    folderSize = folderSize + sdBytesCache;
    return folderSize;
}
-(void)clearAllCache{
    [[SDImageCache sharedImageCache] clearMemory];
    [[SDImageCache sharedImageCache] clearDiskOnCompletion:nil];
    
    
    NSMutableArray *types = [@[WKWebsiteDataTypeMemoryCache, WKWebsiteDataTypeDiskCache, WKWebsiteDataTypeOfflineWebApplicationCache, WKWebsiteDataTypeCookies, WKWebsiteDataTypeSessionStorage, WKWebsiteDataTypeLocalStorage, WKWebsiteDataTypeWebSQLDatabases, WKWebsiteDataTypeIndexedDBDatabases] mutableCopy];
    if (@available(iOS 11.3, *)) {
       [types addObject:WKWebsiteDataTypeFetchCache];
       [types addObject:WKWebsiteDataTypeServiceWorkerRegistrations];
    }
    // 9.0之后才有的
    NSSet *websiteDataTypes = [NSSet setWithArray:types];
    NSDate *dateFrom = [NSDate dateWithTimeIntervalSince1970:0];
    [[WKWebsiteDataStore defaultDataStore] removeDataOfTypes:websiteDataTypes modifiedSince:dateFrom completionHandler:^{
               
    }];
    
    [self clearMemory];
    [[NSFileManager defaultManager] removeItemAtPath:self.filePath error:nil];
    
}
@end

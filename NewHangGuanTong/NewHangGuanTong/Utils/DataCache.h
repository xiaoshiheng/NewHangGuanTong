//
//  DataCache.h
//  NewCarProject
//
//  Created by 车呗 on 2017/11/24.
//  Copyright © 2017年 车呗新车. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface DataCache : NSObject
+ (instancetype)sharedInstance;

- (void)saveData:(id<NSCoding>)data key:(NSString *)key;
- (id)fetchDataWithKey:(NSString *)key;
- (void)removeDataWithKey:(NSString *)key;
-(float)getCacheSizeAtPath;//粗略计算缓存大小
-(void)clearAllCache;//清除所有缓存
@end

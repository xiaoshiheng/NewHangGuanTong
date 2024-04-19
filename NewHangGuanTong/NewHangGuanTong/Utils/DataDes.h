//
//  DataDes.h
//  NewCarProject
//
//  Created by 车呗 on 2017/12/14.
//  Copyright © 2017年 车呗新车. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonCryptor.h>

@interface DataDes : NSObject
/**
 *  DES加密
 *
 *  @param str 加密字符串
 *  @param key key
 *
 *  @return NSString
 */
+ (NSString *) encode:(NSString *)str key:(NSString *)key;

/**
 *  DES解密
 *
 *  @param str 解密字符串
 *  @param key key
 *
 *  @return NSString
 */
+ (NSString *) decode:(NSString *)str key:(NSString *)key;
@end

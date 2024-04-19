//
//  NSObject+GetCurrentDate.h
//  NewEntertainment
//
//  Created by 车呗 on 2019/2/16.
//  Copyright © 2019 RACTest. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (GetCurrentDate)

/**
 获取年月日

 @return @"2019-01-04"
 */
-(NSString *)getCurrentYYMMDD;

/**
 获取年月日 时分秒
 
 @return @"2019-01-04 13:23:23"
 */
-(NSString *)getCurrentYYMMDDhhmmss;

/**
 获取年月日 时分
 
 @return @"2019-01-04 13:23:23"
 */
-(NSString *)getCurrentYYMMDDHHmm;

/**
 获取月日
 
 @return @"01-04"
 */
-(NSString *)getCurrentMMDD;

/**
 获取年月
 
 @return @"2019-04"
 */
-(NSString *)getCurrentYYMM;

@end

NS_ASSUME_NONNULL_END

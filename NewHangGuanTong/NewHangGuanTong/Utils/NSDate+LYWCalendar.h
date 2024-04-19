//
//  NSDate+LYWCalendar.h
//  test
//
//  Created by 车呗 on 2019/1/14.
//  Copyright © 2019 xiaoshiheng. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDate (LYWCalendar)
#pragma mark - 获取日
- (NSInteger)day:(NSDate *)date;
#pragma mark - 获取月
- (NSInteger)month:(NSDate *)date;
#pragma mark - 获取年
- (NSInteger)year:(NSDate *)date;
#pragma mark - 获取当月第一天周几
- (NSInteger)firstWeekdayInThisMonth:(NSDate *)date;
#pragma mark - 获取当前月有多少天
- (NSInteger)totaldaysInMonth:(NSDate *)date;

@end

NS_ASSUME_NONNULL_END

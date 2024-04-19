//
//  NSString+TimeInterval.h
//  NewCarProject
//
//  Created by 车呗 on 2018/6/19.
//  Copyright © 2018年 车呗新车. All rights reserved.
//

//时间间隔

#import <Foundation/Foundation.h>

@interface NSString (TimeInterval)

/**
 判断是否是下一天

 @param lastTimestamp 上一个时间戳
 @return bool(yes/no 是/不是)
 */
-(BOOL)isNextDay:(NSString *)lastTimestamp;

@end

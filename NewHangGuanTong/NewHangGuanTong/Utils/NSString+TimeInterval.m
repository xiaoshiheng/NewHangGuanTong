//
//  NSString+TimeInterval.m
//  NewCarProject
//
//  Created by 车呗 on 2018/6/19.
//  Copyright © 2018年 车呗新车. All rights reserved.
//

#import "NSString+TimeInterval.h"

@implementation NSString (TimeInterval)

-(BOOL)isNextDay:(NSString *)lastTimestamp{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *lastDate = [NSDate dateWithTimeIntervalSince1970:[lastTimestamp longLongValue]/1000];
    NSDate *currentDate = [NSDate dateWithTimeIntervalSince1970:[self longLongValue]/1000];
    
    NSString *lastDateStr = [formatter stringFromDate:lastDate];
    NSString *currentDateStr = [formatter stringFromDate:currentDate];
    
    
    
    
    if ([currentDateStr compare:lastDateStr] == NSOrderedDescending) {
        return YES;
    }
    
    return NO;
    
}

@end

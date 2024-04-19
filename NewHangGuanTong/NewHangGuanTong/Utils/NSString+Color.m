//
//  NSString+Color.m
//  NewCarProject
//
//  Created by wxy on 2018/7/25.
//  Copyright © 2018年 车呗新车. All rights reserved.
//

#import "NSString+Color.h"

@implementation NSString (Color)

- (UIColor *)convert2Color {
    if ([self isEqualToString:@"白色"]) {
        return kUIColorFromRGB(0xf0f0f0);
    } else if ([self isEqualToString:@"黑色"]) {
        return kUIColorFromRGB(0x000000);
    } else if ([self isEqualToString:@"蓝色"]) {
        return kUIColorFromRGB(0x1111c5);
    } else if ([self isEqualToString:@"棕色"]) {
        return kUIColorFromRGB(0x9e5d5d);
    } else if ([self isEqualToString:@"银灰色"]) {
        return kUIColorFromRGB(0xcccccc);
    } else if ([self isEqualToString:@"红色"]) {
        return kUIColorFromRGB(0xf40404);
    } else if ([self isEqualToString:@"香槟色"]) {
        return kUIColorFromRGB(0xbf9004);
    }
    
    return nil;
}

@end

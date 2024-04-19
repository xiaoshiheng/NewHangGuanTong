//
//  NSString+StringSize.m
//  NewCarProject
//
//  Created by 车呗 on 2017/11/28.
//  Copyright © 2017年 车呗新车. All rights reserved.
//

#import "NSString+StringSize.h"

@implementation NSString (StringSize)
- (CGFloat)StringWithWidth:(CGFloat)widtth Font:(UIFont *)font{
    NSDictionary *dic = @{NSFontAttributeName:font};//指定字号
    CGRect rect = [self boundingRectWithSize:CGSizeMake(widtth, 0)/*计算高度要先指定宽度*/ options:NSStringDrawingUsesLineFragmentOrigin |
                   NSStringDrawingUsesFontLeading attributes:dic context:nil];
    return rect.size.height;
}

-(CGFloat)StringWithHeight:(CGFloat)height Font:(UIFont *)font{
    NSDictionary *dic = @{NSFontAttributeName:font};  //指定字号
    CGRect rect = [self boundingRectWithSize:CGSizeMake(0, height)/*计算宽度时要确定高度*/ options:NSStringDrawingUsesLineFragmentOrigin |
                   NSStringDrawingUsesFontLeading attributes:dic context:nil];
    return rect.size.width;
}

@end

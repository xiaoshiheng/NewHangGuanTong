//
//  NSString+StringSize.h
//  NewCarProject
//
//  Created by 车呗 on 2017/11/28.
//  Copyright © 2017年 车呗新车. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (StringSize)

/**
 根据宽度计算高度

 @param widtth 固定的宽度
 @param font 要计算的字符串的Font
 @return 计算得到的高度
 */
- (CGFloat)StringWithWidth:(CGFloat)widtth Font:(UIFont *)font;


/**
 根据高度计算宽度
 
 @param height 固定的高度
 @param font 要计算的字符串的Font
 @return 计算得到的宽度
 */
-(CGFloat)StringWithHeight:(CGFloat)height Font:(UIFont *)font;
@end

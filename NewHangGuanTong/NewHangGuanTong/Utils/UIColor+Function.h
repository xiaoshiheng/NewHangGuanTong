//
//  UIColor+Function.h
//  NewCarProject
//
//  Created by 车呗 on 2017/11/20.
//  Copyright © 2017年 车呗新车. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Function)

/**
 * @brief 字符串中得到颜色值
 *
 * @param stringToConvert 字符串的值 e.g:@"#F74545"
 *
 * @return 返回颜色对象
 */
+ (UIColor *)colorFromString:(NSString *)stringToConvert;


/**
 * @brief RGBA风格获取颜色，
 * UIColor *solidColor = [UIColor colorWithRGBA:0xFF0000FF];
 *
 * @param hex 是16进止rgba值
 *
 * @return 颜色对象
 */
+ (UIColor *)colorWithRGBA:(uint)hex;


/**
 * @brief ARGB风格获取颜色
 * UIColor *alphaColor = [UIColor colorWithHex:0x99FF0000];
 *
 * @param hex argb的值
 *
 * @return 颜色对象
 */
+ (UIColor *)colorWithARGB:(uint)hex;


/**
 * @brief RGB风格获取颜色值
 *UIColor *solidColor = [UIColor colorWithHex:0xFF0000];
 *
 * @param hex rgb的值
 *
 * @return 颜色对象
 */
+ (UIColor *)colorWithRGB:(uint)hex;

/*usage
 safe to omit # sign as well
 UIColor *solidColor = [UIColor colorWithWeb:@"FF0000"];
 */

/**
 * @brief 根据字符串返回颜色值
 * UIColor *solidColor = [UIColor colorWithWeb:@"#FF0000"];
 * UIColor *solidColor = [UIColor colorWithWeb:@"FF0000"];
 *
 * @param hexString 字符串的值，e.g:@"#FF0000" @"FF0000"
 *
 * @return 颜色对象
 */
+ (UIColor *)colorWithHexString:(NSString *)hexString;

/**
 *  随机颜色值
 *
 */
+ (UIColor *)random;
+ (UIColor *)colorWithHex:(int)hex;
+ (UIColor *)colorWithHex:(int)hex alpha:(CGFloat)alpha;


/**
 * @brief 颜色对象返回字符串
 *
 * @return 颜色字符串
 */
- (NSString *)hexString;

@end

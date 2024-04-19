//
//  NSNumber+FlickerNumber.h
//  NewCarProject
//
//  Created by 车呗 on 2018/1/5.
//  Copyright © 2018年 车呗新车. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNumber (FlickerNumber)
// 最少两位小数
- (NSString *)formatNumberDecimalMiniTwo;
// 最多两位小数
- (NSString *)formatNumberDecimal;
// 最多四位小数
- (NSString *)formatNumberDecimalWithFour;
- (NSString *)getFormattingWithMoney:(NSString *)strMoney;
- (NSString*)strmethodComma:(NSString*)string ;

//保留小数点后scale位，不四舍五入
- (NSString *)formatNumberDecimalWithScale:(int)scale;

//始终向上进一位...
- (NSString *)formatNumberUpInDecimalWithScale:(int)scale;

@end

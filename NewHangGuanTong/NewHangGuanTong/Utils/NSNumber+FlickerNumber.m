//
//  NSNumber+FlickerNumber.m
//  NewCarProject
//
//  Created by 车呗 on 2018/1/5.
//  Copyright © 2018年 车呗新车. All rights reserved.
//

#import "NSNumber+FlickerNumber.h"

@implementation NSNumber (FlickerNumber)
- (NSString *)formatNumberDecimalMiniTwo{
    if(self){
        NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
        formatter.roundingMode = kCFNumberFormatterRoundFloor;
        formatter.numberStyle = NSNumberFormatterDecimalStyle;
        [formatter setMaximumFractionDigits:2];
        [formatter setMinimumFractionDigits:2];
        return [formatter stringFromNumber:self];
    }
    return @"0";
}

- (NSString*)strmethodComma:(NSString*)string {
    NSString *sign = nil;
    if ([string hasPrefix:@"-"] || [string hasPrefix:@"+"]) {
        sign = [string substringToIndex:1];
        string = [string substringFromIndex:1];
    }
    NSString *pointLast = [string substringFromIndex:[string length]-3];
    NSString *pointFront = [string substringToIndex:[string length]-3];
    
    NSInteger commaNum = ([pointFront length]-1)/3;
    NSMutableArray *arr = [NSMutableArray array];
    for (int i = 0; i < commaNum+1; i++) {
        NSInteger index = [pointFront length] - (i+1)*3;
        NSInteger leng = 3;
        if(index < 0) {
            leng = 3+index;
            index = 0;
        }
        NSRange range = {index,leng};
        NSString *stq = [pointFront substringWithRange:range];
        [arr addObject:stq];
    }
    NSMutableArray *arr2 = [NSMutableArray array];
    for (NSInteger i = arr.count-1; i>=0; i--) {
        [arr2 addObject:arr[i]];
    }
    NSString *commaString = [[arr2 componentsJoinedByString:@","] stringByAppendingString:pointLast];
    if (sign) {
        commaString = [sign stringByAppendingString:commaString];
    }
    
    return commaString;
}
- (NSString *)formatNumberDecimal{
    if(self){
        NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
        formatter.roundingMode = kCFNumberFormatterRoundFloor;
        formatter.numberStyle = NSNumberFormatterDecimalStyle;
        [formatter setMaximumFractionDigits:2];
        return [formatter stringFromNumber:self];
    }
    return @"0";
}

- (NSString *)formatNumberDecimalWithFour{
    if(self){
        NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
        formatter.roundingMode = kCFNumberFormatterRoundFloor;
        formatter.numberStyle = NSNumberFormatterDecimalStyle;
        [formatter setMaximumFractionDigits:4];
        return [formatter stringFromNumber:self];
    }
    return @"0";
}

//是否是整数
- (BOOL)multipleLongForNumber{
    NSString *str = [NSString stringWithFormat:@"%@",self];
    if([str rangeOfString:@"."].location == NSNotFound){
        return YES;
    }
    return NO;
}

//向下舍弃,,不进位
- (NSString *)formatNumberDecimalWithScale:(int)scale {
    //保留scale位小数(不四舍五入)
    NSDecimalNumberHandler *roundingBehavior = [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:NSRoundDown scale:scale raiseOnExactness:NO raiseOnOverflow:NO raiseOnUnderflow:NO raiseOnDivideByZero:NO];
    NSString *doubleString = [NSString stringWithFormat:@"%lf", self.doubleValue];
    NSDecimalNumber *deciNum = [NSDecimalNumber decimalNumberWithString:doubleString];
    double tempvalue = [[deciNum decimalNumberByRoundingAccordingToBehavior:roundingBehavior] doubleValue];
    NSString *format = [NSString stringWithFormat:@"%%.%df",scale];
    NSString *tempstr = [NSString stringWithFormat:format,tempvalue];
    return tempstr;
}


//始终向上进一位
- (NSString *)formatNumberUpInDecimalWithScale:(int)scale {
    //保留scale位小数(不四舍五入)
    NSDecimalNumberHandler *roundingBehavior = [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:NSRoundUp scale:scale raiseOnExactness:NO raiseOnOverflow:NO raiseOnUnderflow:NO raiseOnDivideByZero:NO];
    NSString *doubleString = [NSString stringWithFormat:@"%lf", self.doubleValue];
    NSDecimalNumber *deciNum = [NSDecimalNumber decimalNumberWithString:doubleString];
    double tempvalue = [[deciNum decimalNumberByRoundingAccordingToBehavior:roundingBehavior] doubleValue];
    NSString *format = [NSString stringWithFormat:@"%%.%df",scale];
    NSString *tempstr = [NSString stringWithFormat:format,tempvalue];
    return tempstr;
}

@end

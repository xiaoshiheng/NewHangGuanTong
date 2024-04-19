//
//  NSString+Name_IDCard_BankNum.m
//  NewCarProject
//
//  Created by 车呗 on 2018/7/9.
//  Copyright © 2018年 车呗新车. All rights reserved.
//

#import "NSString+Name_IDCard_BankNum.h"

@implementation NSString (Name_IDCard_BankNum)
-(NSString *)nameReplace{
    NSMutableString *originStr = [[NSMutableString alloc] initWithString:self];
    long strLenth = self.length > 2 ? originStr.length-2 : originStr.length - 1;
    NSString *replaceStr = @"";
    for (int i = 0; i< strLenth; i++) {
        replaceStr = [replaceStr stringByAppendingFormat:@"*"];
    }
    if (originStr.length>2) {
        [originStr replaceCharactersInRange:NSMakeRange(1, strLenth) withString:replaceStr];
    }else{
        [originStr replaceCharactersInRange:NSMakeRange(0, strLenth) withString:replaceStr];
    }
    
    return originStr;
}

-(NSString *)replaceString{
    NSString *originStr = self;
    if (originStr.length>0 && originStr.length<11) {
        long strLenth = self.length > 2 ? originStr.length-2 : originStr.length - 1;
        originStr = [originStr substringToIndex:1];
        for (int i = 0; i<strLenth; i++) {
            originStr = [originStr stringByAppendingString:@"*"];
        }
        if (self.length > 2) {
            originStr = [originStr stringByAppendingString: [self substringFromIndex:self.length - 1]];
        }
        
    }else if(originStr.length>11){
        long strLenth = originStr.length-8;
        NSString *repalceStr = @"";
        for (int i = 0; i<strLenth; i++) {
            repalceStr = [repalceStr stringByAppendingString:@"*"];
        }
        originStr = [originStr stringByReplacingCharactersInRange:NSMakeRange(4, strLenth) withString:repalceStr];
    }else if (originStr.length == 11){
        long strLenth = originStr.length-7;
        NSString *repalceStr = @"";
        for (int i = 0; i<strLenth; i++) {
            repalceStr = [repalceStr stringByAppendingString:@"*"];
        }
        originStr = [originStr stringByReplacingCharactersInRange:NSMakeRange(3, strLenth) withString:repalceStr];
    }
    return originStr;
}

@end

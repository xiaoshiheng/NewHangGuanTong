//
//  NSString+Regularization.m
//  NewCarProject
//
//  Created by 车呗 on 2018/2/26.
//  Copyright © 2018年 车呗新车. All rights reserved.
//

#import "NSString+Regularization.h"

@implementation NSString (Regularization)

- (BOOL) deptNameInputShouldChinese

{
    if (self.length == 0) return NO;
    
    NSString *regex = @"[\u4e00-\u9fa5]+";
    
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    
    return [pred evaluateWithObject:self];
}


- (BOOL) deptNumInputShouldNumber

{
    if (self.length == 0) return NO;
    NSString *regex =@"[0-9]*";
    
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    
    return [pred evaluateWithObject:self];
}

- (BOOL) deptPassInputShouldAlpha

{
    if (self.length == 0) return NO;
    NSString *regex =@"[a-zA-Z]*";
    
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    
    return [pred evaluateWithObject:self];
    
}

- (BOOL) deptIdInputShouldAlphaNum

{
    if (self.length == 0) return NO;
    NSString *regex =@"[a-zA-Z0-9]*";
    
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    
    return [pred evaluateWithObject:self];
    
}

//是否含有表情
- (BOOL)stringContainsEmoji
{
    __block BOOL returnValue = NO;
    
    [self enumerateSubstringsInRange:NSMakeRange(0, [self length])
                               options:NSStringEnumerationByComposedCharacterSequences
                            usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
                                const unichar hs = [substring characterAtIndex:0];
                                if (0xd800 <= hs && hs <= 0xdbff) {
                                    if (substring.length > 1) {
                                        const unichar ls = [substring characterAtIndex:1];
                                        const int uc = ((hs - 0xd800) * 0x400) + (ls - 0xdc00) + 0x10000;
                                        if (0x1d000 <= uc && uc <= 0x1f77f) {
                                            returnValue = YES;
                                        }
                                    }
                                } else if (substring.length > 1) {
                                    const unichar ls = [substring characterAtIndex:1];
                                    if (ls == 0x20e3) {
                                        returnValue = YES;
                                    }
                                } else {
                                    if (0x2100 <= hs && hs <= 0x27ff) {
                                        returnValue = YES;
                                    } else if (0x2B05 <= hs && hs <= 0x2b07) {
                                        returnValue = YES;
                                    } else if (0x2934 <= hs && hs <= 0x2935) {
                                        returnValue = YES;
                                    } else if (0x3297 <= hs && hs <= 0x3299) {
                                        returnValue = YES;
                                    } else if (hs == 0xa9 || hs == 0xae || hs == 0x303d || hs == 0x3030 || hs == 0x2b55 || hs == 0x2b1c || hs == 0x2b1b || hs == 0x2b50) {
                                        returnValue = YES;
                                    }
                                }
                            }];
    
    return returnValue;
}

-(long )YYMMDDToTimeStemp{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];// 创建一个时间格式化对象
    [dateFormatter setDateFormat:@"yyyy-MM-dd"]; //设定时间的格式
    NSDate *tempDate = [dateFormatter dateFromString:self];//将字符串转换为时间对象
   // NSString *timeStr = [NSString stringWithFormat:@"%ld", (long)[tempDate timeIntervalSince1970];//字符串转成时间戳,精确到毫秒*1000
    return (long)[tempDate timeIntervalSince1970];
}

-(long )YYMMDDHHmmToTimeStemp{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];// 创建一个时间格式化对象
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"]; //设定时间的格式
    NSDate *tempDate = [dateFormatter dateFromString:self];//将字符串转换为时间对象
    // NSString *timeStr = [NSString stringWithFormat:@"%ld", (long)[tempDate timeIntervalSince1970];//字符串转成时间戳,精确到毫秒*1000
    return (long)[tempDate timeIntervalSince1970];
}

-(long )YYMMDDHHmmssToTimeStemp{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];// 创建一个时间格式化对象
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"]; //设定时间的格式
    NSDate *tempDate = [dateFormatter dateFromString:self];//将字符串转换为时间对象
    // NSString *timeStr = [NSString stringWithFormat:@"%ld", (long)[tempDate timeIntervalSince1970];//字符串转成时间戳,精确到毫秒*1000
    return (long)[tempDate timeIntervalSince1970];
}

-(NSString *)timeStempToDate{
    NSDateFormatter *stampFormatter = [[NSDateFormatter alloc] init];
    [stampFormatter setDateFormat:@"yyyy-MM-dd"];
    NSTimeInterval interval  = self.length == 13 ? [self doubleValue] / 1000.0 : [self doubleValue];
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:interval];
    NSString *timeStr = [stampFormatter stringFromDate:date];
    return timeStr;
}

-(NSString *)timeStempToTime {
    NSTimeInterval interval  = self.length == 13 ? [self doubleValue] / 1000.0 : [self doubleValue];
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:interval];
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    NSDateComponents *dateComponent = [calendar components:unitFlags fromDate:date];
    return [NSString stringWithFormat:@"%02ld:%02ld",(long)[dateComponent hour],(long)[dateComponent minute]];
}

-(NSString *)timeStempToHHMMSS{
    NSDateFormatter *stampFormatter = [[NSDateFormatter alloc] init];
    [stampFormatter setDateFormat:@"HH:mm:ss"];
    NSTimeInterval interval  = self.length == 13 ? [self doubleValue] / 1000.0 : [self doubleValue];
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:interval];
    NSString *timeStr = [stampFormatter stringFromDate:date];
    return timeStr;
}

-(NSString *)timeStempToDatePoint{
    NSDateFormatter *stampFormatter = [[NSDateFormatter alloc] init];
    [stampFormatter setDateFormat:@"yyyy-MM-dd"];
    NSTimeInterval interval  = self.length == 13 ? [self doubleValue] / 1000.0 : [self doubleValue];
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:interval];
    NSString *timeStr = [stampFormatter stringFromDate:date];
    return timeStr;
}

-(NSString *)timeStempToDateAndHours{
    NSDateFormatter *stampFormatter = [[NSDateFormatter alloc] init];
    [stampFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    NSTimeInterval interval  = self.length == 13 ? [self doubleValue] / 1000.0 : [self doubleValue];
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:interval];
    NSString *timeStr = [stampFormatter stringFromDate:date];
    return timeStr;
}

-(NSString *)timeStempToDateAndHoursSS{
    NSDateFormatter *stampFormatter = [[NSDateFormatter alloc] init];
    [stampFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSTimeInterval interval  = self.length == 13 ? [self doubleValue] / 1000.0 : [self doubleValue];
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:interval];
    NSString *timeStr = [stampFormatter stringFromDate:date];
    return timeStr;
}

-(NSString *)timeStempToMMDDAndHours{
    NSDateFormatter *stampFormatter = [[NSDateFormatter alloc] init];
    [stampFormatter setDateFormat:@"MM-dd HH:mm"];
    NSTimeInterval interval  = self.length == 13 ? [self doubleValue] / 1000.0 : [self doubleValue];
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:interval];
    NSString *timeStr = [stampFormatter stringFromDate:date];
    return timeStr;
}

-(NSString *)timeStempToDatewWithFormat:(NSString *)dateFormat{
    NSDateFormatter *stampFormatter = [[NSDateFormatter alloc] init];
    [stampFormatter setDateFormat:dateFormat];
    NSTimeInterval interval  = self.length == 13 ? [self doubleValue] / 1000.0 : [self doubleValue];
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:interval];
    NSString *timeStr = [stampFormatter stringFromDate:date];
    return timeStr;
}


///**
// 手机号码 13[0-9],14[5|7|9],15[0-3],15[5-9],17[0|1|3|5|6|8],18[0-9]
// 移动：134[0-8],13[5-9],147,15[0-2],15[7-9],178,18[2-4],18[7-8]
// 联通：13[0-2],145,15[5-6],17[5-6],18[5-6]
// 电信：133,1349,149,153,173,177,180,181,189
// 虚拟运营商: 170[0-2]电信  170[3|5|6]移动 170[4|7|8|9],171 联通
// 上网卡又称数据卡，14号段为上网卡专属号段，中国联通上网卡号段为145，中国移动上网卡号段为147，中国电信上网卡号段为149
// */
//-(BOOL)isMobilePhone:(NSString *)phoneNum
//{
//   // NSString * MOBIL = @"^1(3[0-9]|4[579]|5[0-35-9]|7[01356]|8[0-9])\\d{8}$";
//    NSString * MOBIL = @"^1\\d{10}$";
//    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBIL];
//    if ([regextestmobile evaluateWithObject:phoneNum]) {
//        return YES;
//    }
//    return NO;
//}

/**
此处只校验1开头,,十一位手机号
 */
-(BOOL)isMobilePhone:(NSString *)phoneNum
{
    NSString * MOBIL = @"^1\\d{10}$";
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBIL];
    if ([regextestmobile evaluateWithObject:phoneNum]) {
        return YES;
    }
    return NO;
}


/**
 *  是否是移动号
 * 中国移动：China Mobile
 * 134[0-8],13[5-9],147,15[0-2],15[7-9],170[3|5|6],178,18[2-4],18[7-8]
 */
-(BOOL)isCMMobilePhone:(NSString *)phoneNum
{
    NSString * CM = @"^1(34[0-8]|70[356]|(3[5-9]|4[7]|5[0-27-9]|7[8]|8[2-47-8])\\d)\\d{7}$";
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    if ([regextestcm evaluateWithObject:phoneNum]) {
        return YES;
    }
    return NO;
}

/**
 *  是否是联通号
 * 中国联通：China Unicom
 * 13[0-2],145,15[5-6],17[5-6],18[5-6],170[4|7|8|9],171
 */
-(BOOL)isCUMobilePhone:(NSString *)phoneNum
{
    NSString * CU = @"^1(70[07-9]|(3[0-2]|4[5]|5[5-6]|7[15-6]|8[5-6])\\d)\\d{7}$";
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    if ([regextestcu evaluateWithObject:phoneNum]) {
        return YES;
    }
    return NO;
}

/**
 *  是否是电信号
 * 中国电信：China Telecom
 * 133,1349,149,153,173,177,180,181,189,170[0-2]
 */
-(BOOL)isCTMobilePhone:(NSString *)phoneNum
{
    NSString * CT = @"^1(34[9]|70[0-2]|(3[3]|4[9]|5[3]|7[37]|8[019])\\d)\\d{7}$";
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    if ([regextestct evaluateWithObject:phoneNum]) {
        return YES;
    }
    return NO;
}

//身份证校验
-(BOOL)checkUserID:(NSString *)userID
{
    //长度不为18的都排除掉
    if (userID.length!=18) {
        return NO;
    }
    
    //校验格式
    NSString *regex2 = @"^(^[1-9]\\d{7}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}$)|(^[1-9]\\d{5}[1-9]\\d{3}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])((\\d{4})|\\d{3}[Xx])$)$";
    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    BOOL flag = [identityCardPredicate evaluateWithObject:userID];
    
    if (!flag) {
        return flag;    //格式错误
    }else {
        //格式正确在判断是否合法
        
        //将前17位加权因子保存在数组里
        NSArray * idCardWiArray = @[@"7", @"9", @"10", @"5", @"8", @"4", @"2", @"1", @"6", @"3", @"7", @"9", @"10", @"5", @"8", @"4", @"2"];
        
        //这是除以11后，可能产生的11位余数、验证码，也保存成数组
        NSArray * idCardYArray = @[@"1", @"0", @"10", @"9", @"8", @"7", @"6", @"5", @"4", @"3", @"2"];
        
        //用来保存前17位各自乖以加权因子后的总和
        NSInteger idCardWiSum = 0;
        for(int i = 0;i < 17;i++)
        {
            NSInteger subStrIndex = [[userID substringWithRange:NSMakeRange(i, 1)] integerValue];
            NSInteger idCardWiIndex = [[idCardWiArray objectAtIndex:i] integerValue];
            
            idCardWiSum+= subStrIndex * idCardWiIndex;
            
        }
        
        //计算出校验码所在数组的位置
        NSInteger idCardMod=idCardWiSum%11;
        
        //得到最后一位身份证号码
        NSString * idCardLast= [userID substringWithRange:NSMakeRange(17, 1)];
        
        //如果等于2，则说明校验码是10，身份证号码最后一位应该是X
        if(idCardMod==2)
        {
            if([idCardLast isEqualToString:@"X"]||[idCardLast isEqualToString:@"x"])
            {
                return YES;
            }else
            {
                return NO;
            }
        }else{
            //用计算出的验证码与最后一位身份证号码匹配，如果一致，说明通过，否则是无效的身份证号码
            if([idCardLast isEqualToString: [idCardYArray objectAtIndex:idCardMod]])
            {
                return YES;
            }
            else
            {
                return NO;
            }
        }
    }
}
//车牌号格式校验(粤A8888澳)，18-05-21，增加新能源车牌校验
-(BOOL)checkCarID:(NSString *)carID
{
    if (carID.length==7) {
        //普通汽车，7位字符，不包含I和O，避免与数字1和0混淆
        NSString *carRegex = @"^[\u4e00-\u9fa5]{1}[a-hj-np-zA-HJ-NP-Z]{1}[a-hj-np-zA-HJ-NP-Z0-9]{4}[a-hj-np-zA-HJ-NP-Z0-9\u4e00-\u9fa5]$";
        NSPredicate *carTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",carRegex];
        return [carTest evaluateWithObject:carID];
    }else if(carID.length==8){
        //新能源车,8位字符，第一位：省份简称（1位汉字），第二位：发牌机关代号（1位字母）;
        //小型车，第三位：只能用字母D或字母F，第四位：字母或者数字，后四位：必须使用数字;([DF][A-HJ-NP-Z0-9][0-9]{4})
        //大型车3-7位：必须使用数字，后一位：只能用字母D或字母F。([0-9]{5}[DF])
        NSString *carRegex = @"^[\u4e00-\u9fa5]{1}[a-hj-np-zA-HJ-NP-Z]{1}([0-9]{5}[d|f|D|F]|[d|f|D|F][a-hj-np-zA-HJ-NP-Z0-9][0-9]{4})$";
        NSPredicate *carTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",carRegex];
        return [carTest evaluateWithObject:carID];
    }
    return NO;
}

//银行卡验证
-(BOOL)isBankCard:(NSString *)bankCard
{
    if (bankCard.length < 16) {
        return NO;
    }
    NSInteger oddsum = 0;     //奇数求和
    NSInteger evensum = 0;    //偶数求和
    NSInteger allsum = 0;
    NSInteger cardNoLength = (NSInteger)[bankCard length];
    // 取了最后一位数
    NSInteger lastNum = [[bankCard substringFromIndex:cardNoLength-1] intValue];
    //测试的是除了最后一位数外的其他数字
    bankCard = [bankCard substringToIndex:cardNoLength - 1];
    for (NSInteger i = cardNoLength -1 ; i>=1;i--) {
        NSString *tmpString = [bankCard substringWithRange:NSMakeRange(i-1, 1)];
        NSInteger tmpVal = [tmpString integerValue];
        if (cardNoLength % 2 ==1 ) {//卡号位数为奇数
            if((i % 2) == 0){//偶数位置
                tmpVal *= 2;
                if(tmpVal>=10)
                    tmpVal -= 9;
                evensum += tmpVal;
            }else{//奇数位置
                oddsum += tmpVal;
            }
        }else{
            if((i % 2) == 1){
                tmpVal *= 2;
                if(tmpVal>=10)
                    tmpVal -= 9;
                evensum += tmpVal;
            }else{
                oddsum += tmpVal;
            }
        }
    }
    
    allsum = oddsum + evensum;
    allsum += lastNum;
    if((allsum % 10) == 0)
        return YES;
    else
        return NO;
}

//8~16位数字/字母/下划线组成的密码格式校验
-(BOOL)checkPsw:(NSString *)pswStr
{
    NSString * pattern  =   @"^[A-Za-z0-9_]{8,16}$";
    //    NSString *condition =@"^(?![0-9]+$)(?![a-zA-Z]+$)[a-zA-Z0-9]{6,16}";
    NSPredicate * pred  =   [NSPredicate predicateWithFormat:@"SELF MATCHES %@",pattern];
    return [pred evaluateWithObject:pswStr];
}

//3~16位数字/字母组成的密码格式校验
-(BOOL)checkPsw1:(NSString *)pswStr
{
    NSString * pattern  =   @"^[A-Za-z0-9]{3,16}$";
    //    NSString *condition =@"^(?![0-9]+$)(?![a-zA-Z]+$)[a-zA-Z0-9]{6,16}";
    NSPredicate * pred  =   [NSPredicate predicateWithFormat:@"SELF MATCHES %@",pattern];
    return [pred evaluateWithObject:pswStr];
}


@end

//
//  NSString+Regularization.h
//  NewCarProject
//
//  Created by 车呗 on 2018/2/26.
//  Copyright © 2018年 车呗新车. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Regularization)


/**
 全汉字正则

 @return yes/no
 */
- (BOOL) deptNameInputShouldChinese;

/**
 全数字正则

 @return yes/no
 */
- (BOOL) deptNumInputShouldNumber;

/**
 全字母正则
 
 @return yes/no
 */
- (BOOL) deptPassInputShouldAlpha;


/**
 仅输入字母或数字正则

 @return yes/no
 */
- (BOOL) deptIdInputShouldAlphaNum;

//是否含有表情
- (BOOL)stringContainsEmoji;


//yymmdd
/**
 时间转化成时间戳
 
 @return yymmdd(2018/3/12)
 */
-(long )YYMMDDToTimeStemp;


//yymmdd
/**
 时间转化成时间戳
 
 @return yymmdd(2018/3/12 23:34)
 */
-(long )YYMMDDHHmmToTimeStemp;

-(long )YYMMDDHHmmssToTimeStemp;

//yymmdd
/**
 时间戳转化成日期格式

 @return yymmdd(2018/3/12)
 */
-(NSString *)timeStempToDate;

//hh:mm
/**
 时间戳转化成时分格式
 
 @return hh:mm(12:14)
 */
-(NSString *)timeStempToTime;

/**
 时间戳转化成时分格式
 
 @return hh:mm(12:14)
 */
-(NSString *)timeStempToHHMMSS;


//yymmdd
/**
 时间戳转化成日期格式
 
 @return yymmdd(2018.3.12)
 */
-(NSString *)timeStempToDatePoint;

/**
 时间戳转化日期格式

 @return yymmdd(2018.3.12 HH:MM)
 */
-(NSString *)timeStempToDateAndHours;


/**
 时间戳转化日期格式

 @return yymmdd(2018.3.12 HH:MM:SS)
 */
-(NSString *)timeStempToDateAndHoursSS;



/**
 时间戳转化日期格式

 @return mmdd hh:mm (07-28 13:40)
 */
-(NSString *)timeStempToMMDDAndHours;


-(NSString *)timeStempToDatewWithFormat:(NSString *)dateFormat;

//银行卡验证
-(BOOL)isBankCard:(NSString *)bankCard;


//车牌号格式校验(粤A8888澳)，18-05-21，增加新能源车牌校验
-(BOOL)checkCarID:(NSString *)carID;

//身份证校验
-(BOOL)checkUserID:(NSString *)userID;

//手机号码校验
-(BOOL)isMobilePhone:(NSString *)phoneNum;

//8~16位数字/字母/下划线组成的密码格式校验
-(BOOL)checkPsw:(NSString *)pswStr;

//8~16位数字/字母组成的密码格式校验
-(BOOL)checkPsw1:(NSString *)pswStr;
@end

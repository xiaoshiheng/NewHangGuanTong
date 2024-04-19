//
//  MessageToastLabel.h
//  NewCarProject
//
//  Created by 车呗 on 2017/11/24.
//  Copyright © 2017年 车呗新车. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface MessageToastLabel : UILabel

- (id)init;

/**
 顶部toast

 @param message message//提示信息
 @param time time//显示多长时间
 @param target target//要显示的target
 */
- (void)showBottomToastWithMessage:(NSString *)message showTime:(float)time withTarget:(id)target;


/**
 底部toast

 @param message message
 @param time time
  @param target target
 */
-(void)showTopToastWithMessage:(NSString *)message showTime:(float)time withTarget:(id)target;

/**
 中部toast
 
 @param message message
 @param time time
 @param target target
 */
-(void)showMidToastWithMessage:(NSString *)message showTime:(float)time withTarget:(id)target;

- (void)shiftUpTip;
@end

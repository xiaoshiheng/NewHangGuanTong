//
//  MessageToastLabel.m
//  NewCarProject
//
//  Created by 车呗 on 2017/11/24.
//  Copyright © 2017年 车呗新车. All rights reserved.
//

#import "MessageToastLabel.h"


#define TIP_LABEL_TAG 0x00ff

@implementation MessageToastLabel

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


- (id)init
{
    self = [super initWithFrame:CGRectMake(50, (kScreenHeight - 28)/2, kScreenWidth - 100 , 28)];
    if (self) {
        // Initialization code
        self.numberOfLines = 8;
    }
    return self;
}

- (CGSize)getSizeOfStr:(NSString *)str font:(UIFont *)font
{
    NSDictionary *attribute = @{NSFontAttributeName:font};
    CGRect rect = [str boundingRectWithSize:CGSizeMake(kScreenWidth - 100 , MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:attribute context:nil];
    
    //    CGSize size = [str sizeWithFont:font
    //                  constrainedToSize:CGSizeMake(280 , MAXFLOAT)];
    return rect.size;
}


- (void)showBottomToastWithMessage:(NSString *)message showTime:(float)time withTarget:(id)target
{
    UIView *view;
    if ([target isKindOfClass:[UIView class]]) {
        view = target;
    }else if([target isKindOfClass:[UIViewController class]]){
        UIViewController *vc = (UIViewController *)target;
        view = vc.view;
    }else{
        view = [[UIApplication sharedApplication] delegate].window;
    }
    
    UILabel * label = (UILabel *)[view viewWithTag:TIP_LABEL_TAG];
    [label removeFromSuperview];
    
    self.tag = TIP_LABEL_TAG;
    CGSize size = [self getSizeOfStr:message font:[UIFont systemFontOfSize:14]];
    
    self.font = [UIFont systemFontOfSize:14];
    self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5f];
    self.textAlignment = NSTextAlignmentCenter;
    self.textColor = [UIColor whiteColor];
    self.text = message;
    self.layer.cornerRadius = 3;
    self.layer.masksToBounds = YES;
    
    self.layer.shadowColor = [[UIColor lightGrayColor] CGColor];
    self.layer.shadowOpacity = 1.0;
    self.layer.shadowOffset = CGSizeMake(0.0f, 0.0f);
    
    float width = (size.width + 15) ;
    float height = size.height + 10;
    width = (width >kScreenHeight) ? (kScreenWidth - 40) : width;
    
    //self.frame = CGRectMake((kScreenWidth - width) / 2, kScreenHeight/2+PPMUIRealValue(160), width, height);
    [view addSubview:self];
    [self mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(height);
        make.width.mas_equalTo(width);
        make.bottom.equalTo(view).offset(-PPMUIRealValue(40));
        make.centerX.equalTo(view.mas_centerX);
    }];
    //    [APP_DELEGATE.window.rootViewController.view addSubview:self];
   // [[[UIApplication sharedApplication] delegate].window addSubview:self];
    [self performSelector:@selector(removeTipMessageLabel) withObject:nil afterDelay:time];
}

-(void)showTopToastWithMessage:(NSString *)message showTime:(float)time withTarget:(id)target
{
    UIView *view;
    if ([target isKindOfClass:[UIView class]]) {
        view = target;
    }else if([target isKindOfClass:[UIViewController class]]){
        UIViewController *vc = (UIViewController *)target;
        view = vc.view;
    }else{
        view = [[UIApplication sharedApplication] delegate].window;
    }
    
    UILabel * label = (UILabel *)[view viewWithTag:TIP_LABEL_TAG];
    [label removeFromSuperview];
    
    self.tag = TIP_LABEL_TAG;
    
    self.font = [UIFont systemFontOfSize:16];
    self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5f];
    self.textAlignment = NSTextAlignmentCenter;
    self.textColor = [UIColor whiteColor];
    self.text = message;
   // self.layer.cornerRadius = 3;
    self.layer.masksToBounds = YES;
    
    self.layer.shadowColor = [[UIColor lightGrayColor] CGColor];
    self.layer.shadowOpacity = 1.0;
    self.layer.shadowOffset = CGSizeMake(0.0f, 0.0f);
    
    float width = kScreenWidth ;
    float height = [message StringWithWidth:kScreenWidth-20 Font:[UIFont systemFontOfSize:14]];
    height = height>44?height:44;
    width = (width > kScreenHeight) ? (kScreenWidth - 40) : width;
    
    self.frame = CGRectMake(0,0, width, height);
    [view addSubview:self];
//    if(kIphoneX){
//        self.frame = CGRectMake(0,84, width, height);
//    }
    
    
    //    [APP_DELEGATE.window.rootViewController.view addSubview:self];
   // [[[UIApplication sharedApplication] delegate].window addSubview:self];
    [self performSelector:@selector(removeTipMessageLabel) withObject:nil afterDelay:time];
}


-(void)showMidToastWithMessage:(NSString *)message showTime:(float)time withTarget:(id)target{
    UIView *view;
    if ([target isKindOfClass:[UIView class]]) {
        view = target;
    }else if([target isKindOfClass:[UIViewController class]]){
        UIViewController *vc = (UIViewController *)target;
        view = vc.view;
    }else{
        view = [[UIApplication sharedApplication] delegate].window;
    }
    
    UILabel * label = (UILabel *)[view viewWithTag:TIP_LABEL_TAG];
    [label removeFromSuperview];
    
    self.tag = TIP_LABEL_TAG;
    
    self.font = [UIFont systemFontOfSize:16];
    self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5f];
    self.textAlignment = NSTextAlignmentCenter;
    self.textColor = [UIColor whiteColor];
    self.text = message;
    // self.layer.cornerRadius = 3;
    self.layer.masksToBounds = YES;
    
    self.layer.shadowColor = [[UIColor lightGrayColor] CGColor];
    self.layer.shadowOpacity = 1.0;
    self.layer.shadowOffset = CGSizeMake(0.0f, 0.0f);
    
    //CGSize size = [self getSizeOfStr:message font:[UIFont systemFontOfSize:14]];
    float width = PPMUIRealValue(240);
    float height = [message StringWithWidth:kScreenWidth-20 Font:[UIFont systemFontOfSize:16]];
    height = height>50?height:50;
    width = (width > kScreenWidth) ? (kScreenWidth - 40) : width;
    
    self.frame = CGRectMake(0,0, width, height);
    self.centerY = kScreenHeight/2;
    self.centerX = kScreenWidth/2;
    [view addSubview:self];
    //    if(kIphoneX){
    //        self.frame = CGRectMake(0,84, width, height);
    //    }
    
    
    //    [APP_DELEGATE.window.rootViewController.view addSubview:self];
    // [[[UIApplication sharedApplication] delegate].window addSubview:self];
    self.layer.cornerRadius = self.height/2;
    [self performSelector:@selector(removeTipMessageLabel) withObject:nil afterDelay:time];
}


- (void)shiftUpTip{
    [self setFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y - 20, self.frame.size.width, self.frame.size.height)];
}

- (void)removeTipMessageLabel
{
    
    __weak typeof(self)weakSelf = self;
    [UIView animateWithDuration:0.3f
                     animations:^{
                         self.alpha = 0;
                     } completion:^(BOOL finished) {
                         [weakSelf removeFromSuperview];
                         weakSelf.alpha = 1;
                     }];
}

@end

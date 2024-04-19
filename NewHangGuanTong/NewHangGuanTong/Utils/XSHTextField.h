//
//  XSHTextField.h
//  NewCarProject
//
//  Created by 车呗 on 2018/7/26.
//  Copyright © 2018年 车呗新车. All rights reserved.
//

#import <UIKit/UIKit.h>
@class XSHTextField;
@protocol XSHTextFieldDelegate <NSObject>
- (void)ynTextFieldDeleteBackward:(XSHTextField *)textField;
@end

@interface XSHTextField : UITextField
@property (nonatomic, assign) id <XSHTextFieldDelegate> yn_delegate;
@end

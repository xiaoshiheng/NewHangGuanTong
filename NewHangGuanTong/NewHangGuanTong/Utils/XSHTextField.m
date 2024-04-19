//
//  XSHTextField.m
//  NewCarProject
//
//  Created by 车呗 on 2018/7/26.
//  Copyright © 2018年 车呗新车. All rights reserved.
//

#import "XSHTextField.h"

@implementation XSHTextField


- (void)deleteBackward {
    //！！！这里要调用super方法，要不然删不了东西
    [super deleteBackward];
    if ([self.yn_delegate respondsToSelector:@selector(ynTextFieldDeleteBackward:)]) {
        [self.yn_delegate ynTextFieldDeleteBackward:self];
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

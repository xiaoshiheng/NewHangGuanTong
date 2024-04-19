//
//  NoPasteTextField.m
//  NewEntertainment
//
//  Created by 车呗 on 2019/3/19.
//  Copyright © 2019 RACTest. All rights reserved.
//

#import "NoPasteTextField.h"

@implementation NoPasteTextField

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


- (BOOL)canPerformAction:(SEL)action withSender:(id)sender{
    if(action == @selector(paste:))//禁止粘贴
        return NO;
    if(action == @selector(select:))// 禁止选择
        return NO;
    if(action == @selector(selectAll:))// 禁止全选
        return NO;
    return[super canPerformAction:action withSender:sender];
}
    

@end

//
//  XSHPWDView.m
//  NewEntertainment
//
//  Created by 车呗 on 2019/1/17.
//  Copyright © 2019 RACTest. All rights reserved.
//

#import "XSHPWDView.h"

@implementation XSHPWDView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.layer.borderColor = kUIColorFromRGB(0xdddddd).CGColor;
        self.layer.borderWidth = PPMUIRealValue(1);
        self.strArry = [[NSMutableArray alloc]initWithCapacity:0];
        [self creatVercodeView];
    }
    return self;
}

-(void)creatVercodeView{
    _firstsTxt = [[XSHTextField alloc]initWithFrame:CGRectMake(0, 0, self.width/6, self.height)];
    //设置成白色,,达到隐藏光标的效果
    _firstsTxt.tintColor = kUIColorFromRGB(0x000000);
    _firstsTxt.font = [UIFont systemFontOfSize:20];
    _firstsTxt.textAlignment = NSTextAlignmentCenter;
    _firstsTxt.keyboardType = UIKeyboardTypeNumberPad;
    _firstsTxt.textColor = kUIColorFromRGB(0x000000);
    _firstsTxt.secureTextEntry = YES;
    [_firstsTxt becomeFirstResponder];
    _firstsTxt.yn_delegate = self;
    [_firstsTxt addTarget:self action:@selector(textChangeAction:) forControlEvents:UIControlEventEditingChanged];
    [self addSubview:_firstsTxt];
    
    _secondTxt = [[XSHTextField alloc]initWithFrame:CGRectMake(_firstsTxt.right, _firstsTxt.top, _firstsTxt.width, _firstsTxt.height)];
    _secondTxt.tintColor = kUIColorFromRGB(0x000000);
    _secondTxt.font = [UIFont systemFontOfSize:20];
    _secondTxt.textAlignment = NSTextAlignmentCenter;
    _secondTxt.keyboardType = UIKeyboardTypeNumberPad;
    _secondTxt.textColor = kUIColorFromRGB(0x000000);
    _secondTxt.secureTextEntry = YES;
    _secondTxt.userInteractionEnabled = NO;
    _secondTxt.yn_delegate = self;
    [_secondTxt addTarget:self action:@selector(textChangeAction:) forControlEvents:UIControlEventEditingChanged];
    [self addSubview:_secondTxt];
    
    _thirdTxt = [[XSHTextField alloc]initWithFrame:CGRectMake(_secondTxt.right, _firstsTxt.top, _firstsTxt.width, _firstsTxt.height)];
    _thirdTxt.tintColor = kUIColorFromRGB(0x000000);
    _thirdTxt.font = [UIFont systemFontOfSize:20];
    _thirdTxt.textAlignment = NSTextAlignmentCenter;
    _thirdTxt.keyboardType = UIKeyboardTypeNumberPad;
    _thirdTxt.textColor = kUIColorFromRGB(0x000000);
    _thirdTxt.secureTextEntry = YES;
    _thirdTxt.userInteractionEnabled = NO;
    _thirdTxt.yn_delegate = self;
    [_thirdTxt addTarget:self action:@selector(textChangeAction:) forControlEvents:UIControlEventEditingChanged];
    [self addSubview:_thirdTxt];
    
    _fourthTxt = [[XSHTextField alloc]initWithFrame:CGRectMake(_thirdTxt.right, _firstsTxt.top, _firstsTxt.width, _firstsTxt.height)];
    _fourthTxt.tintColor = kUIColorFromRGB(0x000000);
    _fourthTxt.font = [UIFont systemFontOfSize:20];
    _fourthTxt.textAlignment = NSTextAlignmentCenter;
    _fourthTxt.keyboardType = UIKeyboardTypeNumberPad;
    _fourthTxt.textColor = kUIColorFromRGB(0x000000);
    _fourthTxt.secureTextEntry = YES;
    _fourthTxt.userInteractionEnabled = NO;
    _fourthTxt.yn_delegate = self;
    [_fourthTxt addTarget:self action:@selector(textChangeAction:) forControlEvents:UIControlEventEditingChanged];
    [self addSubview:_fourthTxt];
    
    _fifthTxt = [[XSHTextField alloc]initWithFrame:CGRectMake(_fourthTxt.right, _firstsTxt.top, _firstsTxt.width, _firstsTxt.height)];
    _fifthTxt.tintColor = kUIColorFromRGB(0x000000);
    _fifthTxt.font = [UIFont systemFontOfSize:20];
    _fifthTxt.textAlignment = NSTextAlignmentCenter;
    _fifthTxt.keyboardType = UIKeyboardTypeNumberPad;
    _fifthTxt.textColor = kUIColorFromRGB(0x000000);
    _fifthTxt.secureTextEntry = YES;
    _fifthTxt.userInteractionEnabled = NO;
    _fifthTxt.yn_delegate = self;
    [_fifthTxt addTarget:self action:@selector(textChangeAction:) forControlEvents:UIControlEventEditingChanged];
    [self addSubview:_fifthTxt];
    
    _sixthTxt = [[XSHTextField alloc]initWithFrame:CGRectMake(_fifthTxt.right, _firstsTxt.top, _firstsTxt.width, _firstsTxt.height)];
    _sixthTxt.tintColor = kUIColorFromRGB(0x000000);
    _sixthTxt.font = [UIFont systemFontOfSize:20];
    _sixthTxt.textAlignment = NSTextAlignmentCenter;
    _sixthTxt.keyboardType = UIKeyboardTypeNumberPad;
    _sixthTxt.textColor = kUIColorFromRGB(0x000000);
    _sixthTxt.secureTextEntry = YES;
    _sixthTxt.userInteractionEnabled = NO;
    _sixthTxt.yn_delegate = self;
    [_sixthTxt addTarget:self action:@selector(textChangeAction:) forControlEvents:UIControlEventEditingChanged];
    [self addSubview:_sixthTxt];
    
    //画方格
        for (int i = 0; i<5; i++) {
            UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(self.width/6+ i*self.width/6, 0, PPMUIRealValue(1), self.height)];
            lineView.backgroundColor = kUIColorFromRGB(0xdddddd);
            [self addSubview:lineView];
        }
    
//    for (int i = 0; i<6; i++) {
//        UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(PPMUIRealValue(22)+i*(self.width-PPMUIRealValue(44))/6, _firstsTxt.bottom, (self.width-PPMUIRealValue(44))/6-10, 1)];
//        lineView.backgroundColor = kUIColorFromRGB(kLineSpaceColor);
//        [self addSubview:lineView];
//    }
}

#pragma mark ------- 文字输入逻辑处理-------------
- (void)textChangeAction:(UITextField *)textField{
    NSString *textStr = textField.text;
    if (textStr.length>0) {
        textField.text = [textStr substringWithRange:NSMakeRange(0, 1)];
        textStr = textField.text;
    }
    if (textField == _firstsTxt) {
        if (textField.text.length>0) {
            _secondTxt.userInteractionEnabled = YES;
            [_secondTxt becomeFirstResponder];
            [_firstsTxt resignFirstResponder];
            _firstsTxt.userInteractionEnabled = NO;
            [_strArry addObject:textStr];
        }
        
    }else if (textField == _secondTxt){
        if (textField.text.length>0) {
            _thirdTxt.userInteractionEnabled = YES;
            [_thirdTxt becomeFirstResponder];
            [_secondTxt resignFirstResponder];
            _secondTxt.userInteractionEnabled = NO;
            if (_strArry.count<2) {
                [_strArry addObject:textStr];
            }
        }
    }else if (textField == _thirdTxt){
        if (textField.text.length>0) {
            _fourthTxt.userInteractionEnabled = YES;
            [_fourthTxt becomeFirstResponder];
            [_thirdTxt resignFirstResponder];
            _thirdTxt.userInteractionEnabled = NO;
            if (_strArry.count<3) {
                [_strArry addObject:textStr];
            }
        }
    }else if (textField == _fourthTxt){
        if (textField.text.length>0) {
            _fifthTxt.userInteractionEnabled = YES;
            [_fifthTxt becomeFirstResponder];
            [_fourthTxt resignFirstResponder];
            _fourthTxt.userInteractionEnabled = NO;
            if (_strArry.count<4) {
                [_strArry addObject:textStr];
            }
        }
    }else if (textField == _fifthTxt){
        if (textField.text.length>0) {
            _sixthTxt.userInteractionEnabled = YES;
            [_sixthTxt becomeFirstResponder];
            [_fifthTxt resignFirstResponder];
            _fifthTxt.userInteractionEnabled = NO;
            if (_strArry.count<5) {
                [_strArry addObject:textStr];
            }
            
        }
    }else if (textField == _sixthTxt){
        if (textField.text.length>0) {
            if (_strArry.count<6) {
                [_strArry addObject:textStr];
            }
            [_firstsTxt resignFirstResponder];
            [_secondTxt resignFirstResponder];
            [_thirdTxt resignFirstResponder];
            [_fourthTxt resignFirstResponder];
            [_fifthTxt resignFirstResponder];
            [_sixthTxt resignFirstResponder];
           // _sixthTxt.userInteractionEnabled = NO;
        }
    }
    
    if (self.block) {
        self.block(self.strArry);
    }
    
}

#pragma mark ------文字删除逻辑处理------------
-(void)ynTextFieldDeleteBackward:(XSHTextField *)textField{
    if (textField == _firstsTxt) {
    }else if (textField == _secondTxt){
        _firstsTxt.userInteractionEnabled = YES;
        [_firstsTxt becomeFirstResponder];
        [_secondTxt resignFirstResponder];
        _secondTxt.userInteractionEnabled = NO;
        _firstsTxt.text = @"";
        if (_strArry.count>=1) {
            [_strArry removeObjectAtIndex:0];
        }
    }else if (textField == _thirdTxt){
        _secondTxt.userInteractionEnabled = YES;
        [_secondTxt becomeFirstResponder];
        [_thirdTxt resignFirstResponder];
        _thirdTxt.userInteractionEnabled = NO;
        _secondTxt.text = @"";
        if (_strArry.count>=2) {
            [_strArry removeObjectAtIndex:1];
        }
        
        
    }else if (textField == _fourthTxt){
        _thirdTxt.userInteractionEnabled = YES;
        [_thirdTxt becomeFirstResponder];
        [_fourthTxt resignFirstResponder];
        _fourthTxt.userInteractionEnabled = NO;
        _thirdTxt.text = @"";
        if (_strArry.count>=3) {
            [_strArry removeObjectAtIndex:2];
        }
        
        
    }else if (textField == _fifthTxt){
        _fourthTxt.userInteractionEnabled = YES;
        [_fourthTxt becomeFirstResponder];
        [_fifthTxt resignFirstResponder];
        _fifthTxt.userInteractionEnabled = NO;
        _fourthTxt.text = @"";
        if (_strArry.count>=4) {
            [_strArry removeObjectAtIndex:3];
        }
        
        
    }else if (textField == _sixthTxt){
        _fifthTxt.userInteractionEnabled = YES;
        [_fifthTxt becomeFirstResponder];
        [_sixthTxt resignFirstResponder];
        _sixthTxt.userInteractionEnabled = NO;
        _fifthTxt.text = @"";
        if (_strArry.count>=6) {
            [_strArry removeObjectAtIndex:5];
        }
        if (_strArry.count>=5) {
            [_strArry removeObjectAtIndex:4];
        }
        
        
    }
    NSLog(@"%@",_strArry);
    if (self.block) {
        self.block(self.strArry);
    }
}

@end

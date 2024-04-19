//
//  XSHCustomeAltView.m
//  NewEntertainment
//
//  Created by 车呗 on 2019/4/17.
//  Copyright © 2019 RACTest. All rights reserved.
//

#import "XSHCustomeAltView.h"
#import "MessageToastLabel.h"

static NSString *TicketsRulesCollectionCellIdentify = @"TicketsRulesCollectionCell";

@interface TicketsRulesCollectionCell : UICollectionViewCell
@property (nonatomic, strong) UIImageView *leftImg;
@property (nonatomic, strong) UILabel *ruleLab;

-(void)setTicketRulesCellData:(id)data;

@end

@implementation TicketsRulesCollectionCell

-(instancetype)init{
    self = [super init];
    if (self) {
        [self creatUI];
    }
    return self;
}
-(void)creatUI{
    _leftImg = [[UIImageView alloc]initWithFrame:CGRectMake(PPMUIRealValue(45), PPMUIRealValue(11), PPMUIRealValue(14), PPMUIRealValue(14))];
    //staff-rulesSelect
    _leftImg.image = [UIImage imageNamed:@"staff-rulesUnSelect"];
    _leftImg.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:_leftImg];
    
    _ruleLab = [[UILabel alloc]initWithFrame:CGRectMake(_leftImg.right+PPMUIRealValue(10), PPMUIRealValue(8), self.width-_leftImg.right-PPMUIRealValue(10), PPMUIRealValue(20))];
    _ruleLab.textColor = kUIColorFromRGB(kTextBlackColor);
    _ruleLab.font = [UIFont systemFontOfSize:PPMUIRealValue(14)];
    [self addSubview:_ruleLab];
    
}

-(void)setTicketRulesCellData:(id)data{
    
    if (_leftImg) {
        [_leftImg removeFromSuperview];
        [_ruleLab removeFromSuperview];
        _leftImg = nil;
        _ruleLab = nil;
    }
    
//    _leftImg = [[UIImageView alloc]initWithFrame:CGRectMake(PPMUIRealValue(45), 0, PPMUIRealValue(14), PPMUIRealValue(14))];
    _leftImg = [[UIImageView alloc]initWithFrame:CGRectMake(PPMUIRealValue(30), PPMUIRealValue(11), PPMUIRealValue(14), PPMUIRealValue(14))];
    //staff-rulesSelect
    _leftImg.image = [UIImage imageNamed:@"staff-rulesUnSelect"];
    _leftImg.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:_leftImg];
    
    _ruleLab = [[UILabel alloc]initWithFrame:CGRectMake(_leftImg.right+PPMUIRealValue(10), PPMUIRealValue(8), self.width-_leftImg.right-PPMUIRealValue(10), PPMUIRealValue(20))];
    _ruleLab.textColor = kUIColorFromRGB(kTextBlackColor);
    _ruleLab.font = [UIFont systemFontOfSize:PPMUIRealValue(14)];
    [self addSubview:_ruleLab];
    
    _ruleLab.text = [NSString stringWithFormat:@"%@",data];
}

@end



@interface XSHCustomeAltView ()<UITableViewDelegate, UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, copy) NSString *allMoney;
@property (nonatomic, copy) NSString *ticketMoney;
@property (nonatomic, copy) NSString *finesMoney;
@property (nonatomic, copy) NSString *serviceMoney;

@end

@implementation XSHCustomeAltView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

#pragma mark ---------初始化首行缩进弹窗-----

-(instancetype)initWithFrame:(CGRect)frame Title:(NSString *)title Message:(NSString *)message Complation:(ComplationBlock)complation{
    self = [super initWithFrame:frame];
       if (self) {
           self.backgroundColor = kUIColorFromRGBWithAlpha(0x000000, 0.2);
           _block = complation;
           _titleStr = title;
           _infoStr = message;
           [self creatIndentUI];
       }
       return self;
}

-(void)creatIndentUI{
    CGFloat totalH = PPMUIRealValue(90);
    
    _backView = [[UIView alloc]init];
    _backView.backgroundColor = kUIColorFromRGBWithAlpha(0xffffff, 1);
    _backView.layer.cornerRadius = PPMUIRealValue(12);
    _backView.clipsToBounds = YES;
    [self addSubview:_backView];
    [_backView mas_makeConstraints:^(MASConstraintMaker *make) {
        // make.top.equalTo(self).offset(PPMUIRealValue(251));
        make.centerX.equalTo(self.mas_centerX);
        make.centerY.equalTo(self.mas_centerY);
        make.width.mas_equalTo(PPMUIRealValue(325));
        make.height.mas_greaterThanOrEqualTo(totalH);
    }];
    
    _titleLab = [[UILabel alloc]init];
    _titleLab.textColor = kUIColorFromRGB(kTextBlackColor);
    _titleLab.font = [UIFont systemFontOfSize:PPMUIRealValue(18)];
    _titleLab.textAlignment = NSTextAlignmentCenter;
    _titleLab.text = _titleStr;
    [_backView addSubview:_titleLab];
    [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.backView).offset(PPMUIRealValue(0));
        make.top.equalTo(self.backView).offset(PPMUIRealValue(17));
        make.width.equalTo(self.backView);
        make.height.mas_equalTo(PPMUIRealValue(25));
    }];
    
    _messageLab = [[UILabel alloc]init];
    _messageLab.textColor = kUIColorFromRGB(kTextBlackColor);
    _messageLab.font = [UIFont systemFontOfSize:PPMUIRealValue(14)];
    _messageLab.textAlignment = NSTextAlignmentLeft;
    //_messageLab.text = _infoStr;
    _messageLab.numberOfLines = 0;
    [_backView addSubview:_messageLab];
    [_messageLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.backView).offset(PPMUIRealValue(20));
        make.top.equalTo(self.titleLab.mas_bottom).offset(PPMUIRealValue(13));
        make.right.equalTo(self.backView).offset(-PPMUIRealValue(20));
        make.height.mas_greaterThanOrEqualTo(PPMUIRealValue(25));
        make.bottom.equalTo(self.backView).offset(-PPMUIRealValue(57));
    }];
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    paraStyle.alignment = NSTextAlignmentLeft;//对齐
//    paraStyle.headIndent = 0.0f;//行首缩进
//    //字体大小号字乘以2 即首行空出两个字符
//    CGFloat emptylen = 15 * 2;
//    paraStyle.firstLineHeadIndent = emptylen;//首行缩进
//    paraStyle.tailIndent = 0.0f;//行尾缩进
    paraStyle.lineSpacing = 2.0f;//行间距
    NSAttributedString *attrText = [[NSAttributedString alloc] initWithString:_infoStr attributes:@{NSParagraphStyleAttributeName:paraStyle}];
    _messageLab.attributedText = attrText;
    
    
    
    _cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_cancelBtn setTitleColor:kUIColorFromRGB(kTextGrayColor) forState:UIControlStateNormal];
    [_cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    [_backView addSubview:_cancelBtn];
    [_cancelBtn addTarget:self action:@selector(cancelIndentBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [_cancelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.backView);
        make.bottom.equalTo(self.backView);
        make.width.mas_equalTo(PPMUIRealValue(135));
        make.height.mas_equalTo(PPMUIRealValue(43));
    }];
    
    _sureBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_sureBtn setTitleColor:kUIColorFromRGB(kTextPurpleColor) forState:UIControlStateNormal];
    [_sureBtn setTitle:@"确定" forState:UIControlStateNormal];
    [_backView addSubview:_sureBtn];
    [_sureBtn addTarget:self action:@selector(sureIndentBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [_sureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.backView);
        make.bottom.equalTo(self.backView);
        make.width.mas_equalTo(PPMUIRealValue(135));
        make.height.mas_equalTo(PPMUIRealValue(43));
    }];
    
    _hLineView = [[UIView alloc]init];
    _hLineView.backgroundColor = kUIColorFromRGBWithAlpha(0xdddddd, 1);
    [_backView addSubview:_hLineView];
    [_hLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.backView);
        make.bottom.equalTo(self.backView).offset(-PPMUIRealValue(44));
        make.width.mas_equalTo(self.backView);
        make.height.mas_equalTo(PPMUIRealValue(1));
    }];
    
    _vLineView = [[UIView alloc]init];
    _vLineView.backgroundColor = kUIColorFromRGBWithAlpha(0xdddddd, 1);
    [_backView addSubview:_vLineView];
    [_vLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.backView);
        make.bottom.equalTo(self.backView).offset(0);
        make.width.mas_equalTo(PPMUIRealValue(1));
        make.height.mas_equalTo(PPMUIRealValue(43));
    }];
    
}

-(void)cancelIndentBtnClick{
    [self removeFromSuperview];
}

-(void)sureIndentBtnClick{
    if (self.block) {
        self.block(@"");
    }
    [self removeFromSuperview];
}


#pragma mark----专用申请初始化逻辑处理-----------

-(instancetype)initWithFrame:(CGRect)frame Type:(int)type Titl:(NSString *)title Message:(NSString *)message Complation:(nonnull ComplationBlock)complation{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = kUIColorFromRGBWithAlpha(0x000000, 0.2);
        _block = complation;
        _titleStr = title;
        _infoStr = message;
        _type = type;
        [self creatUI];
    }
    return self;
}
-(void)creatUI{
    
    //增加监听，当键盘出现或改变时收出消息
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];

    //增加监听，当键退出时收出消息
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
    
    
    
    
    _backView = [[UIView alloc]init];
    _backView.backgroundColor = kUIColorFromRGBWithAlpha(0xf1f1f1, 1);
    _backView.layer.cornerRadius = PPMUIRealValue(12);
    _backView.clipsToBounds = YES;
    [self addSubview:_backView];
    [_backView mas_makeConstraints:^(MASConstraintMaker *make) {
       // make.top.equalTo(self).offset(PPMUIRealValue(251));
        make.top.mas_greaterThanOrEqualTo(PPMUIRealValue(0));
        make.bottom.mas_equalTo(-(kScreenHeight-PPMUIRealValue(416)));
        make.centerX.equalTo(self.mas_centerX);
        make.width.mas_equalTo(PPMUIRealValue(270));
        make.height.mas_greaterThanOrEqualTo(PPMUIRealValue(165));
        
    }];
    
    _titleLab = [[UILabel alloc]init];
    _titleLab.textColor = kUIColorFromRGB(kTextBlackColor);
    _titleLab.font = [UIFont systemFontOfSize:PPMUIRealValue(18)];
    _titleLab.textAlignment = NSTextAlignmentCenter;
    _titleLab.text = _titleStr;
    if (_type==1) {
        _titleLab.text = @"通过";
    }else if (_type==2) {
        _titleLab.text = @"拒绝";
    }
    [_backView addSubview:_titleLab];
    if (_type==3) {
        [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.backView).offset(PPMUIRealValue(0));
            make.top.equalTo(self.backView).offset(PPMUIRealValue(29));
            make.width.equalTo(self.backView);
            make.height.mas_equalTo(PPMUIRealValue(25));
        }];
    }else{
        [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.backView).offset(PPMUIRealValue(0));
            make.top.equalTo(self.backView).offset(PPMUIRealValue(17));
            make.width.equalTo(self.backView);
            make.height.mas_equalTo(PPMUIRealValue(25));
        }];
    }
    
    _messageLab = [[UILabel alloc]init];
    _messageLab.textColor = kUIColorFromRGB(kTextBlackColor);
    _messageLab.font = [UIFont systemFontOfSize:PPMUIRealValue(14)];
    _messageLab.textAlignment = NSTextAlignmentCenter;
    _messageLab.text = _infoStr;
    if (_type==1) {
        _messageLab.text = @"审批通过";
    }else if (_type==2) {
        _messageLab.text = @"拒绝后,该单据将会关闭";
    }
    [_backView addSubview:_messageLab];
    [_messageLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.backView).offset(PPMUIRealValue(0));
        make.top.equalTo(self.titleLab.mas_bottom).offset(PPMUIRealValue(13));
        make.width.equalTo(self.backView);
        make.height.mas_equalTo(PPMUIRealValue(16));
    }];
    
    _textView = [[UITextView alloc]init];
    _textView.layer.borderColor = [UIColor redColor].CGColor;
    _textView.scrollEnabled = NO;
    _textView.delegate = self;
    if (_type==1) {
        _textView.text = @"同意";
    }else if (_type==2){
        
    }
    [_backView addSubview:_textView];
    if (_type==3 || _type==4) {
        if (_type==4) {
            _textView.keyboardType = UIKeyboardTypeNumberPad;
        }
        [_textView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.backView).offset(PPMUIRealValue(73));
            make.bottom.equalTo(self.backView).offset(-PPMUIRealValue(64));
            make.left.equalTo(self.backView).offset(PPMUIRealValue(16));
            make.right.equalTo(self.backView).offset(-PPMUIRealValue(16));
        }];
    }else{
        [_textView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.backView).offset(PPMUIRealValue(85));
            make.bottom.equalTo(self.backView).offset(-PPMUIRealValue(56));
            make.left.equalTo(self.backView).offset(PPMUIRealValue(16));
            make.right.equalTo(self.backView).offset(-PPMUIRealValue(16));
        }];
    }
    
    
    _placeLab = [[UILabel alloc]init];
    _placeLab.textColor = kUIColorFromRGB(kTextGrayColor);
    _placeLab.font = [UIFont systemFontOfSize:12];
    _placeLab.text = @"请输入拒绝原因";
    if (_type==1) {
         _placeLab.hidden = YES;
    }else{
        _placeLab.hidden = NO;
    }
    [_backView addSubview:_placeLab];
    if (_type==3|| _type==4) {
        [_placeLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.backView).offset(PPMUIRealValue(73));
            make.bottom.equalTo(self.backView).offset(-PPMUIRealValue(64));
            make.left.equalTo(self.backView).offset(PPMUIRealValue(19));
            make.right.equalTo(self.backView).offset(-PPMUIRealValue(16));
        }];
    }else{
        [_placeLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.backView).offset(PPMUIRealValue(85));
            make.bottom.equalTo(self.backView).offset(-PPMUIRealValue(56));
            make.left.equalTo(self.backView).offset(PPMUIRealValue(19));
            make.right.equalTo(self.backView).offset(-PPMUIRealValue(16));
        }];
    }
    
    
    _cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_cancelBtn setTitleColor:kUIColorFromRGB(kTextGrayColor) forState:UIControlStateNormal];
    [_cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    [_backView addSubview:_cancelBtn];
    [_cancelBtn addTarget:self action:@selector(cancelBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [_cancelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.backView);
        make.bottom.equalTo(self.backView);
        make.width.mas_equalTo(PPMUIRealValue(135));
        make.height.mas_equalTo(PPMUIRealValue(43));
    }];
    
    _sureBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_sureBtn setTitleColor:kUIColorFromRGB(kTextPurpleColor) forState:UIControlStateNormal];
    [_sureBtn setTitle:@"确定" forState:UIControlStateNormal];
    [_backView addSubview:_sureBtn];
    [_sureBtn addTarget:self action:@selector(sureBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [_sureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.backView);
        make.bottom.equalTo(self.backView);
        make.width.mas_equalTo(PPMUIRealValue(135));
        make.height.mas_equalTo(PPMUIRealValue(43));
    }];
    
    _hLineView = [[UIView alloc]init];
    _hLineView.backgroundColor = kUIColorFromRGBWithAlpha(0xdddddd, 1);
    [_backView addSubview:_hLineView];
    [_hLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.backView);
        make.bottom.equalTo(self.backView).offset(-PPMUIRealValue(44));
        make.width.mas_equalTo(self.backView);
        make.height.mas_equalTo(PPMUIRealValue(1));
    }];
    
    _vLineView = [[UIView alloc]init];
    _vLineView.backgroundColor = kUIColorFromRGBWithAlpha(0xdddddd, 1);
    [_backView addSubview:_vLineView];
    [_vLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.backView);
        make.bottom.equalTo(self.backView).offset(0);
        make.width.mas_equalTo(PPMUIRealValue(1));
        make.height.mas_equalTo(PPMUIRealValue(43));
    }];

    
}

//当键盘出现或改变时调用
- (void)keyboardWillShow:(NSNotification *)aNotification
{
    //获取键盘的高度
    NSDictionary *userInfo = [aNotification userInfo];
    NSValue *aValue = [userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect keyboardRect = [aValue CGRectValue];
    int height = keyboardRect.size.height;
    __weak typeof(self)weakSelf = self;
    if (kScreenHeight - height > kScreenHeight-PPMUIRealValue(416)) {
        [UIView animateWithDuration:0 animations:^{
            [weakSelf.backView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.bottom.mas_equalTo(-PPMUIRealValue(height));
               // make.top.equalTo(weakSelf).offset(PPMUIRealValue(framY));
            }];
            [weakSelf layoutIfNeeded];
        }];
        
    }
    
}

//当键退出时调用
- (void)keyboardWillHide:(NSNotification *)aNotification{
    __weak typeof(self)weakSelf = self;
    [UIView animateWithDuration:0 animations:^{
        [weakSelf.backView mas_updateConstraints:^(MASConstraintMaker *make) {
           make.bottom.mas_equalTo(-(kScreenHeight-PPMUIRealValue(416)));
        }];
        [weakSelf layoutIfNeeded];
    }];
    
    
}

-(void)cancelBtnClick{
    [self removeFromSuperview];
}

-(void)sureBtnClick{
    [_textView resignFirstResponder];
    if(_type == 2 && _textView.text.length<=0){
        MessageToastLabel *toastLab = [[MessageToastLabel alloc]init];
        [toastLab showMidToastWithMessage:@"请输入拒绝原因" showTime:2 withTarget:self];
        return ;
    }else if (_type == 3&& _textView.text.length<=0){
        MessageToastLabel *toastLab = [[MessageToastLabel alloc]init];
        [toastLab showMidToastWithMessage:@"请输入艺名" showTime:2 withTarget:self];
        return ;
    }
    if (self.block) {
        self.block(_textView.text);
    }
    [self removeFromSuperview];
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    NSString *str = [NSString stringWithFormat:@"%@%@", textView.text, text];
    if (_maxStrNum>0&&str.length>_maxStrNum) {
        NSRange rangeIndex = [str rangeOfComposedCharacterSequenceAtIndex:_maxStrNum];
        
        if (rangeIndex.length == 1)//字数超限
        {
            textView.text = [str substringToIndex:_maxStrNum];
            //这里重新统计下字数，字数超限，我发现就不走textViewDidChange方法了，你若不统计字数，忽略这行
            // self.wordLable.text = [NSString stringWithFormat:@"%lu/%d", (unsigned long)textView.text.length, 200];
        }else{
            NSRange rangeRange = [str rangeOfComposedCharacterSequencesForRange:NSMakeRange(0, _maxStrNum)];
            textView.text = [str substringWithRange:rangeRange];
        }
        return NO;
    }else if (str.length > 100)
    {
        NSRange rangeIndex = [str rangeOfComposedCharacterSequenceAtIndex:100];
        
        if (rangeIndex.length == 1)//字数超限
        {
            textView.text = [str substringToIndex:100];
            //这里重新统计下字数，字数超限，我发现就不走textViewDidChange方法了，你若不统计字数，忽略这行
           // self.wordLable.text = [NSString stringWithFormat:@"%lu/%d", (unsigned long)textView.text.length, 200];
        }else{
            NSRange rangeRange = [str rangeOfComposedCharacterSequencesForRange:NSMakeRange(0, 100)];
            textView.text = [str substringWithRange:rangeRange];
        }
        return NO;
    }
    
    if (_type == 1 && str.length<=2) {
        return NO;
    }
    
    if (str.length<=0) {
        _placeLab.hidden = NO;
    }else{
        _placeLab.hidden = YES;
    }
    
    return YES;
}


#pragma mark ---------员工管理入场券规则设置弹窗-----


-(instancetype)initWithFrame:(CGRect)frame TicketRules:(NSArray *)rules SelectTicketRule:(NSArray *)selectArry{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = kUIColorFromRGBWithAlpha(0x000000, 0.2);
        self.ticketsRulesArry = rules;
        self.rulesSelectedArry = [selectArry mutableCopy];
        [self creatTicketRulesUI];
    }
    return self;
}

-(void)creatTicketRulesUI{
    
    //CGFloat backViewH = _ticketsRulesArry.count*PPMUIRealValue(36)+PPMUIRealValue(120);
    CGFloat collectionH = _ticketsRulesArry.count%2>0? (_ticketsRulesArry.count/2+1)*PPMUIRealValue(36):_ticketsRulesArry.count/2*PPMUIRealValue(36);
    CGFloat backViewH = collectionH+PPMUIRealValue(120);
    _backView = [[UIView alloc]init];
    _backView.backgroundColor = kUIColorFromRGBWithAlpha(0xffffff, 1);
    _backView.layer.cornerRadius = PPMUIRealValue(12);
    _backView.clipsToBounds = YES;
    [self addSubview:_backView];
    [_backView mas_makeConstraints:^(MASConstraintMaker *make) {
        // make.top.equalTo(self).offset(PPMUIRealValue(251));
        make.centerX.equalTo(self.mas_centerX);
        make.centerY.equalTo(self.mas_centerY);
        make.width.mas_equalTo(PPMUIRealValue(295));
        make.height.mas_equalTo(backViewH);
    }];
    
    _titleLab = [[UILabel alloc]init];
    _titleLab.textColor = kUIColorFromRGB(kTextBlackColor);
    _titleLab.font = [UIFont systemFontOfSize:PPMUIRealValue(18)];
    _titleLab.textAlignment = NSTextAlignmentCenter;
    _titleLab.text = @"入场券规则";
    [_backView addSubview:_titleLab];
    [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.backView).offset(PPMUIRealValue(0));
        make.top.equalTo(self.backView).offset(PPMUIRealValue(29));
        make.width.equalTo(self.backView);
        make.height.mas_equalTo(PPMUIRealValue(25));
    }];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    
    _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, PPMUIRealValue(70), PPMUIRealValue(295), collectionH) collectionViewLayout:flowLayout];
    _collectionView.collectionViewLayout = flowLayout;
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.backgroundColor = [UIColor whiteColor];
    _collectionView.scrollEnabled = NO;
    // _collectionView.showsHorizontalScrollIndicator = NO;
    [_collectionView registerClass:[TicketsRulesCollectionCell class] forCellWithReuseIdentifier:TicketsRulesCollectionCellIdentify];
    [_backView addSubview:_collectionView];
    
    
    _cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_cancelBtn setTitleColor:kUIColorFromRGB(kTextGrayColor) forState:UIControlStateNormal];
    [_cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    [_backView addSubview:_cancelBtn];
    [_cancelBtn addTarget:self action:@selector(cancelTicketRulesBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [_cancelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.backView);
        make.bottom.equalTo(self.backView);
        make.width.mas_equalTo(PPMUIRealValue(135));
        make.height.mas_equalTo(PPMUIRealValue(43));
    }];
    
    _sureBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_sureBtn setTitleColor:kUIColorFromRGB(kTextPurpleColor) forState:UIControlStateNormal];
    [_sureBtn setTitle:@"确定" forState:UIControlStateNormal];
    [_backView addSubview:_sureBtn];
    [_sureBtn addTarget:self action:@selector(sureTicketRulesBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [_sureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.backView);
        make.bottom.equalTo(self.backView);
        make.width.mas_equalTo(PPMUIRealValue(135));
        make.height.mas_equalTo(PPMUIRealValue(43));
    }];
    
    _hLineView = [[UIView alloc]init];
    _hLineView.backgroundColor = kUIColorFromRGBWithAlpha(0xdddddd, 1);
    [_backView addSubview:_hLineView];
    [_hLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.backView);
        make.bottom.equalTo(self.backView).offset(-PPMUIRealValue(44));
        make.width.mas_equalTo(self.backView);
        make.height.mas_equalTo(PPMUIRealValue(1));
    }];
    
    _vLineView = [[UIView alloc]init];
    _vLineView.backgroundColor = kUIColorFromRGBWithAlpha(0xdddddd, 1);
    [_backView addSubview:_vLineView];
    [_vLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.backView);
        make.bottom.equalTo(self.backView).offset(0);
        make.width.mas_equalTo(PPMUIRealValue(1));
        make.height.mas_equalTo(PPMUIRealValue(43));
    }];
    
}

-(void)cancelTicketRulesBtnClick{
    [self removeFromSuperview];
}

-(void)sureTicketRulesBtnClick{
    NSString *selcetStrArry = @"";
//    for (NSString *selectStr2 in _rulesSelectedArry) {
//        selcetStrArry = [selcetStrArry stringByAppendingString:[NSString stringWithFormat:@"%@,",selectStr2]];
//    }
    for (int i = 0; i<_rulesSelectedArry.count; i++) {
        if (i==0) {
            selcetStrArry = [_rulesSelectedArry objectAtIndex:i];
        }else{
            selcetStrArry = [selcetStrArry stringByAppendingString:[NSString stringWithFormat:@",%@",[_rulesSelectedArry objectAtIndex:i]]];
        }
        

    }
    if (self.block) {
        self.block(selcetStrArry);
    }
    
    if (self.sureBlock) {
        self.sureBlock();
    }
    [self removeFromSuperview];
}

#pragma mark  设置CollectionView的组数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

#pragma mark  设置CollectionView每组所包含的个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.ticketsRulesArry.count;
    
}

#pragma mark------------------员工管理拒绝弹窗------------------------
-(instancetype)initWithFrame:(CGRect)frame Titl:(NSString *)title Message:(NSString *)message  MaxStringNum:(int)strNum Complation:(ComplationBlock)complation{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = kUIColorFromRGBWithAlpha(0x000000, 0.2);
        _block = complation;
        _titleStr = title;
        _infoStr = message;
        _maxStrNum = strNum;
        [self creatStaffRefuseUI];
    }
    return self;
}

-(void)creatStaffRefuseUI{
    //增加监听，当键盘出现或改变时收出消息
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    
    //增加监听，当键退出时收出消息
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
    
    
    
    
    _backView = [[UIView alloc]init];
    _backView.backgroundColor = kUIColorFromRGBWithAlpha(0xf1f1f1, 1);
    _backView.layer.cornerRadius = PPMUIRealValue(12);
    _backView.clipsToBounds = YES;
    [self addSubview:_backView];
    [_backView mas_makeConstraints:^(MASConstraintMaker *make) {
        // make.top.equalTo(self).offset(PPMUIRealValue(251));
        make.top.mas_greaterThanOrEqualTo(PPMUIRealValue(0));
        make.bottom.mas_equalTo(-(kScreenHeight-PPMUIRealValue(416)));
        make.centerX.equalTo(self.mas_centerX);
        make.width.mas_equalTo(PPMUIRealValue(270));
        make.height.mas_greaterThanOrEqualTo(PPMUIRealValue(179));
        
    }];
    
    _titleLab = [[UILabel alloc]init];
    _titleLab.textColor = kUIColorFromRGB(kTextBlackColor);
    _titleLab.font = [UIFont systemFontOfSize:PPMUIRealValue(18)];
    _titleLab.textAlignment = NSTextAlignmentCenter;
    _titleLab.text = _titleStr;
    [_backView addSubview:_titleLab];
    [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.backView).offset(PPMUIRealValue(0));
        make.top.equalTo(self.backView).offset(PPMUIRealValue(29));
        make.width.equalTo(self.backView);
        make.height.mas_equalTo(PPMUIRealValue(25));
    }];
    
    
    _textView = [[UITextView alloc]init];
    _textView.layer.borderColor = [UIColor redColor].CGColor;
    _textView.scrollEnabled = NO;
    _textView.delegate = self;
    [_backView addSubview:_textView];
    [_textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.backView).offset(PPMUIRealValue(65));
        make.bottom.equalTo(self.backView).offset(-PPMUIRealValue(86));
        make.left.equalTo(self.backView).offset(PPMUIRealValue(16));
        make.right.equalTo(self.backView).offset(-PPMUIRealValue(16));
    }];
    
    _placeLab = [[UILabel alloc]init];
    _placeLab.textColor = kUIColorFromRGB(kTextGrayColor);
    _placeLab.font = [UIFont systemFontOfSize:12];
    _placeLab.text = @"请输入拒绝原因";
    [_backView addSubview:_placeLab];
    [_placeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.backView).offset(PPMUIRealValue(65));
        make.bottom.equalTo(self.backView).offset(-PPMUIRealValue(86));
        make.left.equalTo(self.backView).offset(PPMUIRealValue(19));
        make.right.equalTo(self.backView).offset(-PPMUIRealValue(16));
    }];

    _messageLab = [[UILabel alloc]init];
    _messageLab.textColor = kUIColorFromRGB(kTextBlackColor);
    _messageLab.font = [UIFont systemFontOfSize:PPMUIRealValue(12)];
    _messageLab.textAlignment = NSTextAlignmentCenter;
    _messageLab.text = _infoStr;
    [_backView addSubview:_messageLab];
    [_messageLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.backView).offset(PPMUIRealValue(0));
        make.top.equalTo(self.textView.mas_bottom).offset(PPMUIRealValue(13));
        make.width.equalTo(self.backView);
        make.height.mas_equalTo(PPMUIRealValue(13));
    }];


    


    _cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_cancelBtn setTitleColor:kUIColorFromRGB(kTextGrayColor) forState:UIControlStateNormal];
    [_cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    [_backView addSubview:_cancelBtn];
    [_cancelBtn addTarget:self action:@selector(staffRefuseCancelBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [_cancelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.backView);
        make.bottom.equalTo(self.backView);
        make.width.mas_equalTo(PPMUIRealValue(135));
        make.height.mas_equalTo(PPMUIRealValue(43));
    }];

    _sureBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_sureBtn setTitleColor:kUIColorFromRGB(kTextPurpleColor) forState:UIControlStateNormal];
    [_sureBtn setTitle:@"确定" forState:UIControlStateNormal];
    [_backView addSubview:_sureBtn];
    [_sureBtn addTarget:self action:@selector(staffRefuseClick) forControlEvents:UIControlEventTouchUpInside];
    [_sureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.backView);
        make.bottom.equalTo(self.backView);
        make.width.mas_equalTo(PPMUIRealValue(135));
        make.height.mas_equalTo(PPMUIRealValue(43));
    }];

    _hLineView = [[UIView alloc]init];
    _hLineView.backgroundColor = kUIColorFromRGBWithAlpha(0xdddddd, 1);
    [_backView addSubview:_hLineView];
    [_hLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.backView);
        make.bottom.equalTo(self.backView).offset(-PPMUIRealValue(44));
        make.width.mas_equalTo(self.backView);
        make.height.mas_equalTo(PPMUIRealValue(1));
    }];

    _vLineView = [[UIView alloc]init];
    _vLineView.backgroundColor = kUIColorFromRGBWithAlpha(0xdddddd, 1);
    [_backView addSubview:_vLineView];
    [_vLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.backView);
        make.bottom.equalTo(self.backView).offset(0);
        make.width.mas_equalTo(PPMUIRealValue(1));
        make.height.mas_equalTo(PPMUIRealValue(43));
    }];
}

-(void)staffRefuseCancelBtnClick{
    [self removeFromSuperview];
}

-(void)staffRefuseClick{
    [_textView resignFirstResponder];
    if( _textView.text.length<=0 && !_isRefuse){
        MessageToastLabel *toastLab = [[MessageToastLabel alloc]init];
        [toastLab showMidToastWithMessage:_placeLab.text showTime:2 withTarget:self];
        return ;
    }
    if (self.block) {
        self.block(_textView.text);
    }
    [self removeFromSuperview];
}


#pragma mark========首页实人认证右上角有关闭按钮和取消按钮倒计时=====
-(instancetype)initWithTitle:(NSString *)title MessageContent:(NSString *)message CountDonwTime:(int)time CancelButton:(NSString *)cancelBtn SureButtone:(NSString *)sureBtn IsShowCloseBtn:(BOOL)isShow{
    self = [super initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    if (self) {
        self.cancelBtnStr = cancelBtn;
        self.sureBtnStr = sureBtn;
        self.titleStr = title;
        self.infoStr = message;
        self.countDownTime = time;
        self.isShowCloseBtn = isShow;
        [self creatCountDownTimeUI];
    }
    return self;
}

-(void)creatCountDownTimeUI{
    self.backgroundColor = kUIColorFromRGBWithAlpha(0x000000, 0.2);
    
    _backView = [[UIView alloc]init];
    _backView.backgroundColor = kUIColorFromRGB(0xffffff);
    [self addSubview:_backView];
    [_backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(PPMUIRealValue(40));
        make.right.equalTo(self).offset(-PPMUIRealValue(40));
        make.centerY.equalTo(self.mas_centerY);
        make.height.mas_greaterThanOrEqualTo(150);
    }];
    _backView.layer.cornerRadius = PPMUIRealValue(10);
    _backView.clipsToBounds = YES;
    
    _closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_backView addSubview:_closeBtn];
    [_closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.backView);
        make.top.equalTo(self.backView);
        make.height.mas_equalTo(PPMUIRealValue(40));
        make.width.mas_equalTo(PPMUIRealValue(40));
    }];
    _closeBtn.hidden = !_isShowCloseBtn;
    [_closeBtn setImage:[UIImage imageNamed:@"departFitClose"] forState:UIControlStateNormal];
    [_closeBtn addTarget:self action:@selector(closeBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    _titleLab = [[UILabel alloc]init];
    _titleLab.tintColor = kUIColorFromRGB(kTextBlackColor);
    if (@available(iOS 8.2, *)) {
        _titleLab.font = [UIFont systemFontOfSize:PPMUIRealValue(16) weight:UIFontWeightBold];
    } else {
        // Fallback on earlier versions
         _titleLab.font = [UIFont systemFontOfSize:PPMUIRealValue(16)];
    }
    _titleLab.textAlignment = NSTextAlignmentCenter;
    [_backView addSubview:_titleLab];
    [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.backView).offset(PPMUIRealValue(15));
        make.right.equalTo(self.backView).offset(-PPMUIRealValue(15));
        make.top.equalTo(self.backView).offset(PPMUIRealValue(21));
        make.height.mas_equalTo(PPMUIRealValue(22));
    }];
    _titleLab.text = _titleStr;
    
    _messageLab = [[UILabel alloc]init];
    _messageLab.tintColor = kUIColorFromRGB(kTextBlackColor);
    _messageLab.font = [UIFont systemFontOfSize:PPMUIRealValue(14)];
    _messageLab.textAlignment = NSTextAlignmentCenter;
    _messageLab.numberOfLines = 0;
    [_backView addSubview:_messageLab];
    [_messageLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.backView).offset(PPMUIRealValue(15));
        make.right.equalTo(self.backView).offset(-PPMUIRealValue(15));
        make.top.equalTo(self.backView).offset(PPMUIRealValue(59));
        make.bottom.mas_equalTo(-PPMUIRealValue(75));
    }];
    _messageLab.text=  _infoStr;
    
    _cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _cancelBtn.titleLabel.font = [UIFont systemFontOfSize:PPMUIRealValue(16)];
    [_cancelBtn setTitleColor:kUIColorFromRGB(kTextLightGrayColor) forState:UIControlStateNormal];
    [_backView addSubview:_cancelBtn];
    [_cancelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.backView);
        make.bottom.equalTo(self.backView);
        make.width.mas_equalTo((kScreenWidth-PPMUIRealValue(80))/2);
        make.height.mas_equalTo(PPMUIRealValue(48));
    }];
    [_cancelBtn setTitle:_cancelBtnStr forState:UIControlStateNormal];
    [_cancelBtn addTarget:self action:@selector(TrainingBtnCancelClick) forControlEvents:UIControlEventTouchUpInside];
    
    _sureBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _sureBtn.titleLabel.font = [UIFont systemFontOfSize:PPMUIRealValue(16)];
    [_sureBtn setTitleColor:kUIColorFromRGB(kTextPurpleColor) forState:UIControlStateNormal];
    [_backView addSubview:_sureBtn];
    [_sureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.cancelBtn.mas_right);
        make.bottom.equalTo(self.backView);
        make.width.mas_equalTo((kScreenWidth-PPMUIRealValue(80))/2);
        make.height.mas_equalTo(PPMUIRealValue(48));
    }];
     [_sureBtn setTitle:_sureBtnStr forState:UIControlStateNormal];
    [_sureBtn addTarget:self action:@selector(TrainingBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    _hLineView = [[UIView alloc]init];
    _hLineView.backgroundColor = kUIColorFromRGB(kBaseLineColor);
    [_backView addSubview:_hLineView];
    [_hLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.backView);
        make.right.equalTo(self.backView);
        make.bottom.equalTo(self.backView).offset(-PPMUIRealValue(48));
        make.height.mas_equalTo(PPMUIRealValue(1));
    }];
    
    _vLineView = [[UIView alloc]init];
    _vLineView.backgroundColor = kUIColorFromRGB(kBaseLineColor);
    [_backView addSubview:_vLineView];
    [_vLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.backView.mas_centerX);
        make.bottom.equalTo(self.backView);
        make.width.mas_equalTo(PPMUIRealValue(1));
        make.height.mas_equalTo(PPMUIRealValue(48));
    }];
    
    if (self.countDownTime>0) {
        self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0
                                                      target:self
                                                    selector:@selector(handlerTimer)
                                                    userInfo:nil
                                                     repeats:YES];
        NSString *str = [NSString stringWithFormat:@"%@(%ds)",self.cancelBtnStr,self.countDownTime];
        [_cancelBtn setTitle:str forState:UIControlStateNormal];
        _cancelBtn.userInteractionEnabled = NO;
    }
    
}

-(void)closeBtnClick{
    if (self.closeBlock) {
        self.closeBlock();
    }
    if (self.timer) {
        [self.timer invalidate];
        self.timer = nil;
    }
    [self removeFromSuperview];
}
-(void)TrainingBtnCancelClick{
    if ([_cancelBtnStr isEqualToString:@"去实名"]) {
        if (self.realBlock) {
            self.realBlock();
        }
    }
    [self closeBtnClick];
}

-(void)TrainingBtnClick{
    if (self.sureBlock) {
        self.sureBlock();
    }
    [self closeBtnClick];
}

-(void)handlerTimer{
    self.countDownTime--;
    if (self.countDownTime>0) {
        NSString *str = [NSString stringWithFormat:@"%@(%ds)",self.cancelBtnStr,self.countDownTime];
        [_cancelBtn setTitle:str forState:UIControlStateNormal];
    }else{
        [_cancelBtn setTitleColor:kUIColorFromRGB(kTextGrayColor) forState:UIControlStateNormal];
        self.cancelBtn.userInteractionEnabled = YES;
        [_cancelBtn setTitle:_cancelBtnStr forState:UIControlStateNormal];
    }
}


#pragma mark====打卡弹窗======

-(instancetype)initWithTime:(NSString *)date Status:(int)status Score:(int)score{
    self = [super initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    if (self) {
        self.backgroundColor = kUIColorFromRGBWithAlpha(0x000000, 0.2);
        self.titleStr = date;
        self.maxStrNum = status;
        self.countDownTime = score;
        [self creatPunchView];
    }
    return self;
}
-(void)creatPunchView{
    
    _backView = [[UIView alloc]init];
    _backView.backgroundColor = kUIColorFromRGB(0xffffff);
    [self addSubview:_backView];
    [_backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(PPMUIRealValue(44));
        make.right.equalTo(self).offset(-PPMUIRealValue(44));
        make.centerY.equalTo(self.mas_centerY);
        make.height.mas_greaterThanOrEqualTo(350);
    }];
    _backView.layer.cornerRadius = PPMUIRealValue(10);
    _backView.clipsToBounds = YES;
    
    
    _bgImg = [[UIImageView alloc]init];
    _bgImg.contentMode = UIViewContentModeScaleAspectFit;
    _bgImg.image = [UIImage imageNamed:@"punchBgImg"];
    [_backView addSubview:_bgImg];
    [_bgImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.backView);
        make.right.equalTo(self.backView);
        make.top.equalTo(self.backView).offset(PPMUIRealValue(49));
        make.height.mas_equalTo(PPMUIRealValue(118));
    }];
    
    _titleLab = [[UILabel alloc]init];
    _titleLab.textColor = kUIColorFromRGB(kTextBlackColor);
    _titleLab.font = [UIFont systemFontOfSize:PPMUIRealValue(36) weight:UIFontWeightBold];
    _titleLab.textAlignment = NSTextAlignmentCenter;
    [_backView addSubview:_titleLab];
    [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.backView);
        make.right.equalTo(self.backView);
        make.top.equalTo(self.bgImg.mas_bottom).offset(PPMUIRealValue(10));
        make.height.mas_equalTo(PPMUIRealValue(50));
    }];
    _titleLab.text = self.titleStr;
    
    _messageLab = [[UILabel alloc]init];
    _messageLab.textColor = kUIColorFromRGB(kTextBlackColor);
    _messageLab.font = [UIFont systemFontOfSize:PPMUIRealValue(18)];
    _messageLab.textAlignment = NSTextAlignmentCenter;
    [_backView addSubview:_messageLab];
    [_messageLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.backView);
        make.right.equalTo(self.backView);
        make.top.equalTo(self.titleLab.mas_bottom).offset(PPMUIRealValue(13));
        make.height.mas_equalTo(PPMUIRealValue(25));
    }];
    if (self.maxStrNum==0) {
        _messageLab.text = @"打卡成功-正常";
    }else if (self.maxStrNum==1){
        _messageLab.text = @"打卡成功-迟到";
    }else if (self.maxStrNum==2){
        _messageLab.text = @"打卡成功-早退";
    }
    
    _scoreImg = [[UIImageView alloc]init];
    _scoreImg.contentMode = UIViewContentModeScaleAspectFit;
    _scoreImg.image = [UIImage imageNamed:@"socreAnimation"];
    [_backView addSubview:_scoreImg];
    [_scoreImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.backView.mas_centerX).offset(-PPMUIRealValue(32));
        make.top.equalTo(self.messageLab.mas_bottom).offset(PPMUIRealValue(2));
        make.height.mas_equalTo(PPMUIRealValue(32));
        make.width.mas_equalTo(PPMUIRealValue(32));
    }];
    
    _placeLab = [[UILabel alloc]init];
    _placeLab.textColor = kUIColorFromRGB(kTextYellowColor);
    _placeLab.font = [UIFont systemFontOfSize:PPMUIRealValue(18)];
    _placeLab.textAlignment = NSTextAlignmentLeft;
    [_backView addSubview:_placeLab];
    [_placeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.scoreImg.mas_right).offset(PPMUIRealValue(5));
        make.right.equalTo(self.backView);
        make.top.equalTo(self.messageLab.mas_bottom).offset(PPMUIRealValue(2));
        make.height.mas_equalTo(PPMUIRealValue(32));
    }];
    if (_countDownTime>0) {
        _scoreImg.hidden = NO;
        _placeLab.hidden = NO;
        _placeLab.text = [NSString stringWithFormat:@"+%d",_countDownTime];
    }else{
        _scoreImg.hidden = YES;
        _placeLab.hidden = YES;
    }
    
    _hLineView = [[UIView alloc]init];
    _hLineView.backgroundColor = kUIColorFromRGBWithAlpha(0xdddddd, 1);
    [_backView addSubview:_hLineView];
    [_hLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.messageLab.mas_bottom).offset(PPMUIRealValue(34));
        make.left.equalTo(self.backView);
        make.bottom.equalTo(self.backView).offset(-PPMUIRealValue(44));
        make.width.mas_equalTo(self.backView);
        make.height.mas_equalTo(PPMUIRealValue(1));
    }];
    
    _closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _closeBtn.titleLabel.font = [UIFont systemFontOfSize:PPMUIRealValue(16)];
    [_closeBtn setTitleColor:kUIColorFromRGB(kTextPurpleColor) forState:UIControlStateNormal];
    [_closeBtn setTitle:@"好的" forState:UIControlStateNormal];
    [_backView addSubview:_closeBtn];
    [_closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.backView);
        make.right.equalTo(self.backView);
        make.top.equalTo(self.hLineView.mas_bottom);
        make.bottom.equalTo(self.backView);
    }];
    [_closeBtn addTarget:self action:@selector(punchStatusViewCloseBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    
}

-(void)punchStatusViewCloseBtnClick{
    [self removeFromSuperview];
}

#pragma mark=======入职黑名单提醒=====
-(instancetype)initWithTitle:(NSString *)title BlackNameInfo:(NSString *)info Company:(NSString *)company{
    self = [super initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    if (self) {
        self.backgroundColor = kUIColorFromRGBWithAlpha(0x000000, 0.2);
        self.titleStr = title;
        self.infoStr = info;
        self.reasonStr = company;
        [self creatBlackNameUI];
    }
    return self;
}

-(void)creatBlackNameUI{
    _backView = [[UIView alloc]init];
    _backView.backgroundColor = kUIColorFromRGB(0xffffff);
    [self addSubview:_backView];
    [_backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(PPMUIRealValue(44));
        make.right.equalTo(self).offset(-PPMUIRealValue(44));
        make.centerY.equalTo(self.mas_centerY);
        make.height.mas_greaterThanOrEqualTo(200);
    }];
    _backView.layer.cornerRadius = PPMUIRealValue(10);
    _backView.clipsToBounds = YES;
    
    _titleLab = [[UILabel alloc]init];
    _titleLab.textColor = kUIColorFromRGB(kTextBlackColor);
    _titleLab.font = [UIFont systemFontOfSize:PPMUIRealValue(16) weight:UIFontWeightBold];
    _titleLab.textAlignment = NSTextAlignmentCenter;
    [_backView addSubview:_titleLab];
    [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.backView);
        make.right.equalTo(self.backView);
        make.top.equalTo(self.backView).offset(PPMUIRealValue(26));
        make.height.mas_equalTo(PPMUIRealValue(22));
    }];
    _titleLab.text = self.titleStr;
    
    
    _messageLab = [[UILabel alloc]init];
    _messageLab.tintColor = kUIColorFromRGB(kTextBlackColor);
    _messageLab.font = [UIFont systemFontOfSize:PPMUIRealValue(14)];
    _messageLab.textAlignment = NSTextAlignmentLeft;
    _messageLab.numberOfLines = 0;
    [_backView addSubview:_messageLab];
    [_messageLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.backView).offset(PPMUIRealValue(35));
        make.right.equalTo(self.backView).offset(-PPMUIRealValue(35));
        make.top.equalTo(self.backView).offset(PPMUIRealValue(59));
        //make.bottom.mas_equalTo(-PPMUIRealValue(75));
        make.height.mas_greaterThanOrEqualTo(PPMUIRealValue(40));
    }];
    _messageLab.text=  _infoStr;
    
    _placeLab = [[UILabel alloc]init];
    _placeLab.textColor = kUIColorFromRGB(kTextGrayColor);
    _placeLab.font = [UIFont systemFontOfSize:14];
    _placeLab.textAlignment = NSTextAlignmentRight;
    [_backView addSubview:_placeLab];
    [_placeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.backView).offset(PPMUIRealValue(35));
        make.right.equalTo(self.backView).offset(-PPMUIRealValue(35));
        make.top.equalTo(self.messageLab.mas_bottom).offset(PPMUIRealValue(19));
        make.height.mas_greaterThanOrEqualTo(PPMUIRealValue(0));
        make.bottom.mas_equalTo(self.backView).offset(-PPMUIRealValue(75));
    }];
    _placeLab.text = _reasonStr;
    
    _hLineView = [[UIView alloc]init];
    _hLineView.backgroundColor = kUIColorFromRGBWithAlpha(0xdddddd, 1);
    [_backView addSubview:_hLineView];
    [_hLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.backView);
        make.left.equalTo(self.backView);
        make.bottom.equalTo(self.backView).offset(-PPMUIRealValue(48));
        make.height.mas_equalTo(PPMUIRealValue(1));
    }];
    
    _closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _closeBtn.titleLabel.font = [UIFont systemFontOfSize:PPMUIRealValue(16)];
    [_closeBtn setTitleColor:kUIColorFromRGB(kTextPurpleColor) forState:UIControlStateNormal];
    [_closeBtn setTitle:@"我知道了" forState:UIControlStateNormal];
    [_backView addSubview:_closeBtn];
    [_closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.backView);
        make.right.equalTo(self.backView);
        make.top.equalTo(self.hLineView.mas_bottom);
        make.bottom.equalTo(self.backView);
    }];
    [_closeBtn addTarget:self action:@selector(closeBlackNameView) forControlEvents:UIControlEventTouchUpInside];
    
}
-(void)closeBlackNameView{
    [self removeFromSuperview];
}


#pragma mark========广安授权=======

-(instancetype)initGuangAnAuth{
    self = [super initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    if (self) {
        self.backgroundColor = kUIColorFromRGBWithAlpha(0x000000, 0.2);
        [self creatGuanAnUI];
    }
    return self;
}

-(void)creatGuanAnUI{
    _backView = [[UIView alloc]init];
    _backView.backgroundColor = kUIColorFromRGB(0xffffff);
    [self addSubview:_backView];
    [_backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(PPMUIRealValue(295));
        make.height.mas_equalTo(PPMUIRealValue(349));
        make.centerX.equalTo(self);
        make.centerY.equalTo(self);
    }];
    _backView.layer.cornerRadius = PPMUIRealValue(10);
    _backView.clipsToBounds = YES;
    
    UIView *topBackView = UIView.alloc.init;
    topBackView.backgroundColor = kUIColorFromRGB(kButtonColor);
    [_backView addSubview:topBackView];
    [topBackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(_backView);
        make.height.mas_equalTo(PPMUIRealValue(99));
    }];
    
    _titleLab = UILabel.alloc.init;
    _titleLab.textColor = kUIColorFromRGB(0xffffff);
    _titleLab.font = [UIFont systemFontOfSize:PPMUIRealValue(16) weight:UIFontWeightBold];
    _titleLab.text = @"服务授权";
    _titleLab.textAlignment = NSTextAlignmentCenter;
    [_backView addSubview:_titleLab];
    [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.backView).offset(PPMUIRealValue(14));
        make.left.right.equalTo(self.backView);
        make.height.mas_equalTo(PPMUIRealValue(22));
    }];
    
    UIImageView *imgView = UIImageView.alloc.init;
    imgView.contentMode = UIViewContentModeScaleAspectFit;
    imgView.image = [UIImage imageNamed:@"guagnanimg"];
    [_backView addSubview:imgView];
    [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.backView);
        make.top.equalTo(self.titleLab.mas_bottom).offset(PPMUIRealValue(8));
        make.height.mas_equalTo(PPMUIRealValue(43));
        make.width.mas_equalTo(PPMUIRealValue(37));
    }];
    
    UIButton *closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [closeBtn setImage:[UIImage imageNamed:@"guanbi"] forState:UIControlStateNormal];
    [closeBtn addTarget:self action:@selector(closeGuangAn) forControlEvents:UIControlEventTouchUpInside];
    [_backView addSubview:closeBtn];
    [closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.backView).offset(PPMUIRealValue(6));
        make.right.equalTo(self.backView).offset(-PPMUIRealValue(6));
        make.height.width.mas_equalTo(PPMUIRealValue(24));
    }];
    
    UILabel *tipsLab = UILabel.alloc.init;
    tipsLab.textColor = kUIColorFromRGB(kTextBlackColor);
    tipsLab.font = [UIFont systemFontOfSize:PPMUIRealValue(14) weight:UIFontWeightBold];
    tipsLab.numberOfLines = 0;
    tipsLab.text = @"为保障数据安全，请您先进行数据授权认证";
    [_backView addSubview:tipsLab];
    [tipsLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.backView).offset(PPMUIRealValue(29));
        make.top.equalTo(topBackView.mas_bottom).offset(PPMUIRealValue(15));
        make.right.equalTo(self.backView).offset(-PPMUIRealValue(29));
        make.height.mas_equalTo(PPMUIRealValue(40));
    }];
    
    UIView *topLine = UIView.alloc.init;
    topLine.backgroundColor = kUIColorFromRGB(kBaseLineColor);
    [_backView addSubview:topLine];
    [topLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.backView).offset(PPMUIRealValue(29));
        make.right.equalTo(self.backView).offset(-PPMUIRealValue(29));
        make.top.equalTo(tipsLab.mas_bottom).offset(PPMUIRealValue(9));
        make.height.mas_equalTo(PPMUIRealValue(1));
    }];
    
    UIView *downLine = UIView.alloc.init;
    downLine.backgroundColor = kUIColorFromRGB(kBaseLineColor);
    [_backView addSubview:downLine];
    [downLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.backView).offset(PPMUIRealValue(29));
        make.right.equalTo(self.backView).offset(-PPMUIRealValue(29));
        make.top.equalTo(topLine.mas_bottom).offset(PPMUIRealValue(77));
        make.height.mas_equalTo(PPMUIRealValue(1));
    }];
    
    UILabel *infoLab = UILabel.alloc.init;
    infoLab.textColor = kUIColorFromRGB(kTextGrayColor);
    infoLab.font = [UIFont systemFontOfSize:PPMUIRealValue(14) weight:UIFontWeightBold];
    infoLab.numberOfLines = 0;
    infoLab.text = @"• 获得你的公开信息 \n• 获得你的身份信息";
    [_backView addSubview:infoLab];
    [infoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.backView).offset(PPMUIRealValue(29));
        make.top.equalTo(topLine.mas_bottom);
        make.right.equalTo(self.backView).offset(-PPMUIRealValue(29));
        make.bottom.equalTo(downLine.mas_top);
    }];
    [infoLab changeSpaceForLabelwithLineSpace:10 WordSpace:1];
    
    UIButton *sureBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [sureBtn setBackgroundColor:kUIColorFromRGB(kButtonColor)];
    [sureBtn setTitle:@"确认授权" forState:UIControlStateNormal];
    [sureBtn addTarget:self action:@selector(guanganSureBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [_backView addSubview:sureBtn];
    [sureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.backView).offset(PPMUIRealValue(29));
        make.right.equalTo(self.backView).offset(-PPMUIRealValue(29));
        make.height.mas_equalTo(PPMUIRealValue(40));
        make.bottom.equalTo(self.backView).offset(-PPMUIRealValue(19));
    }];
    sureBtn.layer.cornerRadius = PPMUIRealValue(6);
    sureBtn.clipsToBounds = YES;
    
    
    NSMutableAttributedString *mString = [[NSMutableAttributedString alloc]initWithString:@"同意《用户授权协议》"];
    [mString addAttribute:NSForegroundColorAttributeName value:kUIColorFromRGB(kTextPurpleColor) range:NSMakeRange(2, 8)];
    UIButton *protocolBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    protocolBtn.titleLabel.font = [UIFont systemFontOfSize:PPMUIRealValue(12)];
    [protocolBtn setTitleColor:kUIColorFromRGB(kTextGrayColor) forState:UIControlStateNormal];
    [protocolBtn setAttributedTitle:mString forState:UIControlStateNormal];
    [protocolBtn addTarget:self action:@selector(protocolBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [_backView addSubview:protocolBtn];
    [protocolBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.backView).offset(PPMUIRealValue(29));
        make.height.mas_equalTo(PPMUIRealValue(40));
        make.top.equalTo(downLine.mas_bottom);
        make.width.mas_greaterThanOrEqualTo(PPMUIRealValue(120));
    }];
    
}

-(void)guanganSureBtnClick{
    if (self.sureBlock) {
        self.sureBlock();
    }
    [self closeGuangAn];
}

-(void)protocolBtnClick{
    if (self.block) {
        self.block(@"https://announcement.hzxinyule.com/20210607/");
    }
    [self closeGuangAn];
}

-(void)closeGuangAn{
    //[self removeFromSuperview];
    if (self.closeBlock) {
        self.closeBlock();
    }
}


-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end

@implementation XSHCustomeChangePhone

#pragma mark====身份确认弹框====
-(instancetype)initWithTime:(NSString *)time Phone:(NSString *)phone TipsStr:(NSString *)tips{
    self = [super initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    if (self) {
        self.backgroundColor = kUIColorFromRGBWithAlpha(0x000000, 0.2);
        [self creatSureUITime:time Phone:phone TipsStr:tips];
    }
    return self;
}
-(void)creatSureUITime:(NSString *)time Phone:(NSString *)phone TipsStr:(NSString *)tips{
    _backView = [[UIView alloc]init];
    _backView.backgroundColor = kUIColorFromRGB(0xffffff);
    [self addSubview:_backView];
    [_backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.mas_centerY);
        make.centerX.equalTo(self.mas_centerX);
        make.width.mas_equalTo(PPMUIRealValue(271));
        make.height.mas_greaterThanOrEqualTo(0);
    }];
    _backView.layer.cornerRadius = PPMUIRealValue(10);
    
    _titleLab = [[UILabel alloc]init];
    _titleLab.textColor = kUIColorFromRGB(0x000000);
    _titleLab.font = [UIFont systemFontOfSize:PPMUIRealValue(16) weight:UIFontWeightBold];
    _titleLab.textAlignment = NSTextAlignmentCenter;
    _titleLab.text = @"身份确认";
    [_backView addSubview:_titleLab];
    [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.backView);
        make.top.equalTo(self.backView).offset(PPMUIRealValue(22));
        make.height.mas_equalTo(PPMUIRealValue(22));
    }];
    
    _timeLab = [[UILabel alloc]init];
    _timeLab.textColor = kUIColorFromRGB(kTextGrayColor);
    _timeLab.font = [UIFont systemFontOfSize:PPMUIRealValue(14)];
    _timeLab.text = time;
    [_backView addSubview:_timeLab];
    [_timeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.backView).offset(PPMUIRealValue(24));
        make.right.equalTo(self.backView).offset(-PPMUIRealValue(24));
        make.top.equalTo(self.titleLab.mas_bottom).offset(PPMUIRealValue(19));
        make.height.mas_equalTo(PPMUIRealValue(20));
    }];
    
    _phoneLab = [[UILabel alloc]init];
    _phoneLab.textColor = kUIColorFromRGB(kTextGrayColor);
    _phoneLab.font = [UIFont systemFontOfSize:PPMUIRealValue(14)];
    _phoneLab.text = phone;
    [_backView addSubview:_phoneLab];
    [_phoneLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.backView).offset(PPMUIRealValue(24));
        make.right.equalTo(self.backView).offset(-PPMUIRealValue(24));
        make.top.equalTo(self.timeLab.mas_bottom).offset(PPMUIRealValue(10));
        make.height.mas_equalTo(PPMUIRealValue(20));
    }];
    
    _tipsLab = [[UILabel alloc]init];
    _tipsLab.textColor = kUIColorFromRGB(kTextBlackColor);
    _tipsLab.font = [UIFont systemFontOfSize:PPMUIRealValue(14)];
    _tipsLab.numberOfLines = 0;
    _tipsLab.text = tips;
    [_backView addSubview:_tipsLab];
    [_tipsLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.backView).offset(PPMUIRealValue(24));
        make.right.equalTo(self.backView).offset(-PPMUIRealValue(24));
        make.top.equalTo(self.phoneLab.mas_bottom).offset(PPMUIRealValue(10));
        make.height.mas_greaterThanOrEqualTo(PPMUIRealValue(20));
    }];
    
    _cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_cancelBtn setTitle:@"还在使用" forState:UIControlStateNormal];
    [_cancelBtn setTitleColor:kUIColorFromRGB(0xADADAD) forState:UIControlStateNormal];
    [_backView addSubview:_cancelBtn];
    [_cancelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.equalTo(self.backView);
        make.right.equalTo(self.backView.mas_centerX);
        make.height.mas_equalTo(PPMUIRealValue(43));
    }];
    [_cancelBtn addTarget:self action:@selector(cancelBtnClick) forControlEvents:UIControlEventTouchUpInside];
    _sureBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_sureBtn setTitle:@"换绑手机号" forState:UIControlStateNormal];
    [_sureBtn setTitleColor:kUIColorFromRGB(kTextPurpleColor) forState:UIControlStateNormal];
    [_backView addSubview:_sureBtn];
    [_sureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.cancelBtn.mas_right);
        make.right.bottom.equalTo(self.backView);
        make.height.mas_equalTo(PPMUIRealValue(43));
    }];
    [_sureBtn addTarget:self action:@selector(sureBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    UIView *hLine = [[UIView alloc]init];
    hLine.backgroundColor = kUIColorFromRGB(kBaseLineColor);
    [_backView addSubview:hLine];
    [hLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.backView);
        make.height.mas_equalTo(PPMUIRealValue(1));
        make.top.equalTo(self.tipsLab.mas_bottom).offset(PPMUIRealValue(19));
        make.bottom.equalTo(self.backView).offset(-PPMUIRealValue(43));
    }];
    
    UIView *vLine = [[UIView alloc]init];
    vLine.backgroundColor = kUIColorFromRGB(kBaseLineColor);
    [_backView addSubview:vLine];
    [vLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.backView.mas_centerX);
        make.height.mas_equalTo(PPMUIRealValue(43));
        make.width.mas_equalTo(PPMUIRealValue(1));
        make.bottom.equalTo(self.backView);
    }];
    
}

#pragma mark====授权换绑=======
-(instancetype)initWtihTips:(NSString *)tips{
    self = [super initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    if (self) {
        self.backgroundColor = kUIColorFromRGBWithAlpha(0x000000, 0.2);
        [self creatAuthUI:tips];
    }
    return self;
}
-(void)creatAuthUI:(NSString *)tips{
    _backView = [[UIView alloc]init];
    _backView.backgroundColor = kUIColorFromRGB(0xffffff);
    [self addSubview:_backView];
    [_backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.mas_centerY);
        make.centerX.equalTo(self.mas_centerX);
        make.width.mas_equalTo(PPMUIRealValue(271));
        make.height.mas_greaterThanOrEqualTo(0);
    }];
    _backView.layer.cornerRadius = PPMUIRealValue(10);
    
    _titleLab = [[UILabel alloc]init];
    _titleLab.textColor = kUIColorFromRGB(0x000000);
    _titleLab.font = [UIFont systemFontOfSize:PPMUIRealValue(16) weight:UIFontWeightBold];
    _titleLab.textAlignment = NSTextAlignmentCenter;
    _titleLab.text = @"换绑授权";
    [_backView addSubview:_titleLab];
    [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.backView);
        make.top.equalTo(self.backView).offset(PPMUIRealValue(22));
        make.height.mas_equalTo(PPMUIRealValue(22));
    }];
    
    _closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_closeBtn setImage:[UIImage imageNamed:@"departFitClose"] forState:UIControlStateNormal];
    [_backView addSubview:_closeBtn];
    [_closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.top.equalTo(self.backView);
        make.height.width.mas_equalTo(PPMUIRealValue(43));
    }];
    [_closeBtn addTarget:self action:@selector(cancelBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    _tipsLab = [[UILabel alloc]init];
    _tipsLab.textColor = kUIColorFromRGB(kTextGrayColor);
    _tipsLab.font = [UIFont systemFontOfSize:PPMUIRealValue(14)];
    _tipsLab.numberOfLines = 0;
    _tipsLab.text = tips;
    [_backView addSubview:_tipsLab];
    [_tipsLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.backView).offset(PPMUIRealValue(24));
        make.right.equalTo(self.backView).offset(-PPMUIRealValue(24));
        make.top.equalTo(self.titleLab.mas_bottom).offset(PPMUIRealValue(19));
        make.height.mas_greaterThanOrEqualTo(PPMUIRealValue(20));
    }];
    
    _sureBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_sureBtn setTitle:@"我同意并换绑" forState:UIControlStateNormal];
    [_sureBtn setTitleColor:kUIColorFromRGB(kTextPurpleColor) forState:UIControlStateNormal];
    [_backView addSubview:_sureBtn];
    [_sureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.left.bottom.equalTo(self.backView);
        make.height.mas_equalTo(PPMUIRealValue(43));
    }];
    [_sureBtn addTarget:self action:@selector(sureBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    UIView *hLine = [[UIView alloc]init];
    hLine.backgroundColor = kUIColorFromRGB(kBaseLineColor);
    [_backView addSubview:hLine];
    [hLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.backView);
        make.height.mas_equalTo(PPMUIRealValue(1));
        make.top.equalTo(self.tipsLab.mas_bottom).offset(PPMUIRealValue(19));
        make.bottom.equalTo(self.backView).offset(-PPMUIRealValue(43));
    }];
    
    
}

-(void)cancelBtnClick{
    [self removeFromSuperview];
}
-(void)sureBtnClick{
    if (self.sureBlock) {
        self.sureBlock();
    }
    [self removeFromSuperview];
}
@end

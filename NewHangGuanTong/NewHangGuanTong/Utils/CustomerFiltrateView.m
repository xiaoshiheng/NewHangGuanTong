//
//  CustomerFiltrateView.m
//  NewEntertainment
//
//  Created by 车呗 on 2021/9/24.
//  Copyright © 2021 RACTest. All rights reserved.
//

#import "CustomerFiltrateView.h"

static NSString *CustomerFiltrateCollectionCellIdentify = @"CustomerFiltrateCollectionCell";
@interface CustomerFiltrateCollectionCell:UICollectionViewCell
@property (nonatomic,strong)UILabel *titleLab;
-(void)createUI:(id)data;
@end

@implementation CustomerFiltrateCollectionCell
-(void)createUI:(NSString *)data{
    if (!_titleLab) {
        _titleLab = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.width, self.height)];
        _titleLab.layer.cornerRadius = 4.0;
        _titleLab.numberOfLines = 2;
        _titleLab.clipsToBounds = YES;
        _titleLab.font = [UIFont systemFontOfSize:PPMUIRealValue(14)];
        _titleLab.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_titleLab];
    }
    _titleLab.text= data;
}
@end

@interface CustomerFiltrateView ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic, strong) NSArray *dataArry;
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) CustomerFiltrateCollectionCell *cell;
@property (nonatomic, strong) UIView *backView;
@property (nonatomic, assign)int currentSelect;
@property (nonatomic, assign) CGFloat totalH;

@end

@implementation CustomerFiltrateView
-(instancetype)initWithData:(NSArray *)dataArry CurrentSelect:(int )select{
    self = [super init];
    if (self) {
        self.backgroundColor = kUIColorFromRGBWithAlpha(0x000000, 0.2);
        self.dataArry = dataArry;
        self.currentSelect = select;
        self.clipsToBounds = YES;
        [self creatUI];
    }
    return self;
}
-(void)creatUI{
    
    UIButton *hiddenBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:hiddenBtn];
    [hiddenBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.left.right.equalTo(self);
    }];
    @weakify(self);
    [[hiddenBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        @strongify(self);
        [self hidenView];
    }];
    
    //计算当前View的高度
    if (self.dataArry.count%4==0) {
        long allLine = self.dataArry.count/4;
        _totalH = allLine*PPMUIRealValue(34)+PPMUIRealValue(45)+(allLine-1)*PPMUIRealValue(15);
       
    }else{
        long allLine = self.dataArry.count/4+1;
        _totalH = allLine*PPMUIRealValue(34)+PPMUIRealValue(45)+ (allLine-1)*PPMUIRealValue(15);
    }
    _backView = [[UIView alloc]init];
    _backView.backgroundColor = kUIColorFromRGB(0xffffff);
    [self addSubview:_backView];
    [_backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.top.equalTo(self).offset(-self.totalH);
        make.bottom.mas_lessThanOrEqualTo(0);
        make.height.mas_equalTo(self.totalH);
    }];
    _backView.layer.cornerRadius = PPMUIRealValue(10);
    
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    
    _collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    _collectionView.collectionViewLayout = flowLayout;
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.backgroundColor = [UIColor whiteColor];
    //_collectionView.showsHorizontalScrollIndicator = NO;
    [_collectionView registerClass:[CustomerFiltrateCollectionCell class] forCellWithReuseIdentifier:CustomerFiltrateCollectionCellIdentify];
    [_backView addSubview:_collectionView];
    [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.backView).offset(PPMUIRealValue(30));
        make.left.equalTo(self.backView).offset(PPMUIRealValue(15));
        make.right.equalTo(self.backView).offset(-PPMUIRealValue(15));
        make.bottom.equalTo(self.backView).offset(-PPMUIRealValue(15));
    }];

    
    
}

-(void)animationShow{
    [self layoutIfNeeded];
    [UIView animateWithDuration:0.2 animations:^{
        [self.backView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self).offset(-PPMUIRealValue(15));
        }];
        [self layoutIfNeeded];
    } completion:nil];
}

-(void)hidenView{
    [self layoutIfNeeded];
    [UIView animateWithDuration:0.2 animations:^{
        self.backgroundColor = kUIColorFromRGBWithAlpha(0x000000, 0);
        [self.backView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self).offset(-self.totalH);
        }];
        [self layoutIfNeeded];
    } completion:^(BOOL finished) {
        if (self.hiddenBlock) {
            self.hiddenBlock();
        }
        [self removeFromSuperview];
    }];
}

#pragma mark  设置CollectionView的组数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

#pragma mark  设置CollectionView每组所包含的个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataArry.count;
    
}

#pragma mark  设置CollectionCell的内容
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    _cell = [collectionView dequeueReusableCellWithReuseIdentifier:CustomerFiltrateCollectionCellIdentify forIndexPath:indexPath];
    [_cell createUI:[_dataArry objectAtIndex:indexPath.row]];
    if (indexPath.row == self.currentSelect) {
        _cell.titleLab.layer.borderWidth = PPMUIRealValue(0.5);
        _cell.titleLab.backgroundColor = kUIColorFromRGB(kBaseViewColor);
        _cell.titleLab.layer.borderColor = kUIColorFromRGB(kTextPurpleColor).CGColor;
        _cell.titleLab.textColor = kUIColorFromRGB(kTextPurpleColor);
    }else{
        _cell.titleLab.layer.borderWidth = 0;
        _cell.titleLab.backgroundColor = kUIColorFromRGB(0xF7F7F7);
        _cell.titleLab.layer.borderColor = kUIColorFromRGB(0xF7F7F7).CGColor;
        _cell.titleLab.textColor = kUIColorFromRGB(0x827E7C);
    }
    return _cell;
}



#pragma mark  定义每个UICollectionView的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return  CGSizeMake((kScreenWidth-PPMUIRealValue(75))/4,PPMUIRealValue(34));
}

#pragma mark  定义每个UICollectionView的横向间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return PPMUIRealValue(15);
}

#pragma mark  定义每个UICollectionView的纵向间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return PPMUIRealValue(15);
}

#pragma mark  点击CollectionView触发事件
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    self.currentSelect = (int)indexPath.row;
    [self.collectionView reloadData];
    if (self.block) {
        self.block((int)indexPath.row);
    }
    [self hidenView];
}
-(void)reSetSelectStatus{
    [self.collectionView reloadData];
}


-(void)dealloc{
    
}
@end

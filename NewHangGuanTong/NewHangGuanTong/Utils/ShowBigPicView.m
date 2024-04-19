//
//  ShowBigPicView.m
//  NewEntertainment
//
//  Created by 车呗 on 2019/2/18.
//  Copyright © 2019 RACTest. All rights reserved.
//

#import "ShowBigPicView.h"

@interface ShowBigPicView ()
@property (nonatomic,strong)UIImageView *selectImgView;

@property (nonatomic,strong)UILabel *numberLabel;

@property (nonatomic,assign)NSInteger imgCount;

@property (nonatomic,assign)int pageIndex;

@property (nonatomic,strong)NSArray *reImageArr;

@end

@implementation ShowBigPicView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)init
{
    self = [super init];
    if (self) {
       // self = [[[NSBundle mainBundle] loadNibNamed:@"ShowBigPictureView" owner:nil options:nil] lastObject];
        self.backgroundColor = [UIColor blackColor];
        UITapGestureRecognizer *singleRecognizer;
        singleRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(SingleTap:)];
        singleRecognizer.numberOfTapsRequired = 1;
        [self addGestureRecognizer:singleRecognizer];
        
        _numberLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, kScreenHeight - 30, kScreenWidth, 15)];
        _numberLabel.textColor = [UIColor whiteColor];
        _numberLabel.font = [UIFont systemFontOfSize:14];
        _numberLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_numberLabel];
        _allImgArry = [[NSMutableArray alloc]initWithCapacity:0];
        _pageIndex = 0;
        
    }
    return self;
}

-(void)createUI:(NSArray *)imgarry Index:(NSInteger)index
{
    _reImageArr = imgarry;
//    if (_isShowSaveBtn) {
//        _saveAlbumBtn.hidden = NO;
//    }else{
//        _saveAlbumBtn.hidden = YES;
//    }
    
    for (UIScrollView *scrollview  in _allImgArry) {
        [scrollview removeFromSuperview];
    }
    _imgScrollow = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    //_imgScrollow.frame = CGRectMake(self.center.x, self.center.y, 0, 0);
    _imgScrollow.contentSize = CGSizeMake(imgarry.count*kScreenWidth, kScreenHeight);
    
    _imgCount = imgarry.count;
    
    _numberLabel.text = [NSString stringWithFormat:@"%ld/%ld",(long)index + 1,(long)_imgCount];
    
    
    
    _imgScrollow.pagingEnabled = YES;
    _imgScrollow.delegate = self;
    _imgScrollow.contentOffset = CGPointMake(index*kScreenWidth, 0);
    _imgScrollow.backgroundColor  =[UIColor clearColor];
    
    //    _imgScrollow.scrollEnabled = YES;
    //    _imgScrollow.bounces = NO;
    _imgScrollow.delaysContentTouches = NO;
    _imgScrollow.canCancelContentTouches = NO;
    //    UIPinchGestureRecognizer *pinchGestureRecognizer = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinchView:)];
    //    [_imgScrollow addGestureRecognizer:pinchGestureRecognizer];
    _imgScrollow.indicatorStyle = UIScrollViewIndicatorStyleBlack;
    [self addSubview:_imgScrollow];
    
    for (int i = 0; i<[imgarry count]; i++) {
        
        UIScrollView *midImgScroll = [[UIScrollView alloc]initWithFrame:CGRectMake(i*kScreenWidth, 0, kScreenWidth,kScreenHeight)];
        midImgScroll.contentSize = CGSizeMake(kScreenWidth, kScreenHeight);
        //midImgScroll.autoresizingMask = UIViewAutoresizingFlexibleHeight;
        midImgScroll.contentMode = UIViewContentModeCenter;
        midImgScroll.autoresizesSubviews = YES;
        midImgScroll.minimumZoomScale = 1;
        midImgScroll.maximumZoomScale = 2;
        midImgScroll.delegate = self;
        midImgScroll.zoomScale = 1;
        midImgScroll.tag = 0;
        
        _imgView = [[UIImageView alloc]init];
        _imgView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleTopMargin;
        _imgView.backgroundColor = [UIColor clearColor];
        _imgView.contentMode = UIViewContentModeScaleAspectFit;
//        if (self.isLocalImg) {
//            UIImage *localImg = [UIImage imageNamed:imgarry[i]];
//            _imgView.image = localImg;
//            _imgView.frame = CGRectMake(0, [DeviceInfo screenHeight]/2-[DeviceInfo screenWidth]*localImg.size.height/localImg.size.width/2, [DeviceInfo screenWidth], [DeviceInfo screenWidth]*localImg.size.height/localImg.size.width);
//        }else {
//            [_imgView sd_setImageWithURL:[imgarry objectAtIndex:i] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
//                if (image) {
//                    _imgView.frame = CGRectMake(0, [DeviceInfo screenHeight]/2-[DeviceInfo screenWidth]*image.size.height/image.size.width/2, [DeviceInfo screenWidth], [DeviceInfo screenWidth]*image.size.height/image.size.width);
//                }
//
//            }];
//        }
        WS(weakSelf);
        [_imgView sd_setImageWithURL:[imgarry objectAtIndex:i] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            if (image) {
               weakSelf.imgView.frame = CGRectMake(0, kScreenHeight/2-kScreenWidth*image.size.height/image.size.width/2, kScreenWidth, kScreenWidth*image.size.height/image.size.width);
            }
            
        }];
        [midImgScroll addSubview:_imgView];
        [_imgScrollow addSubview:midImgScroll];
        [_allImgArry addObject:midImgScroll];
//        if (self.isCanSave) {
//            UILongPressGestureRecognizer * longPressGr = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressToDo:)];
//            longPressGr.minimumPressDuration = 1.0;
//            _imgView.userInteractionEnabled = YES;
//            [_imgView addGestureRecognizer:longPressGr];
//        }
    }
    self.alpha = 0.5;
    [UIView animateWithDuration:0.5 animations:^{
        self.alpha = 1;
    }];
    
//    if (!self.isHiddenPC) {
//        _pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(0, [DeviceInfo screenHeight] - 40, [DeviceInfo screenWidth], 20)];
//        _pageControl.numberOfPages = [imgarry count];
//        _pageControl.currentPage = index;
//        _pageControl.pageIndicatorTintColor = [UIColor grayColor];
//        _pageControl.currentPageIndicatorTintColor = [UIColor redColor];
//        [self addSubview:_pageControl];
//        _numberLabel.hidden = YES;
//    }
    
    _pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(0, kScreenHeight - 40, kScreenWidth, 20)];
    _pageControl.numberOfPages = [imgarry count];
    _pageControl.currentPage = index;
    _pageControl.pageIndicatorTintColor = [UIColor grayColor];
    _pageControl.currentPageIndicatorTintColor = kUIColorFromRGB(kButtonColor);
    [self addSubview:_pageControl];
    _numberLabel.hidden = YES;
}
-(void)creatWithImage:(UIImage *)img{
    UIScrollView *midImgScroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth,kScreenHeight)];
    midImgScroll.contentSize = CGSizeMake(kScreenWidth, kScreenHeight);
    //midImgScroll.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    midImgScroll.contentMode = UIViewContentModeCenter;
    midImgScroll.autoresizesSubviews = YES;
    midImgScroll.minimumZoomScale = 1;
    midImgScroll.maximumZoomScale = 2;
    midImgScroll.delegate = self;
    midImgScroll.zoomScale = 1;
    midImgScroll.tag = 0;
    [self addSubview:midImgScroll];
    
    _imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, kScreenHeight/2-kScreenWidth*img.size.height/img.size.width/2, kScreenWidth, kScreenWidth*img.size.height/img.size.width)];
    _imgView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleTopMargin;
    _imgView.backgroundColor = [UIColor clearColor];
    _imgView.contentMode = UIViewContentModeScaleAspectFit;
    _imgView.image = img;
    [midImgScroll addSubview:_imgView];
    
    self.alpha = 0.5;
    [UIView animateWithDuration:0.5 animations:^{
        self.alpha = 1;
    }];
}

-(void)SingleTap:(UITapGestureRecognizer *)recognizer
{
    
    [self removeFromSuperview];
    
    NSLog(@"dan ji le");
    self.selectImgView = nil;
    if (self.delegate && [self.delegate respondsToSelector:@selector(SingleRecongnizerClick)]) {
        [self.delegate SingleRecongnizerClick];
    }
}

- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(nullable UIView *)view atScale:(CGFloat)scale
{
    if (scrollView.contentSize.height>kScreenHeight) {
        view.center = CGPointMake(scrollView.contentSize.width/2, scrollView.contentSize.height/2);
    }else
    {
        view.center = CGPointMake(scrollView.contentSize.width/2, kScreenHeight/2);
    }
    
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)tmpScrollView
{
    if (tmpScrollView != _imgScrollow) {
        
        for (UIView *view in tmpScrollView.subviews) {
            if ([view isKindOfClass:[UIImageView class]]) {
                return view;
            }
        }
        
    }
    return nil;
}


- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if (scrollView == _imgScrollow) {
        int page = scrollView.contentOffset.x/kScreenWidth;
        _pageIndex = page;
        if (_pageControl.currentPage != _pageIndex) {
            for (UIScrollView *scroo in _allImgArry) {
                scroo.contentSize = CGSizeMake(kScreenWidth, kScreenHeight);
                NSArray *transarry = scroo.subviews;
                for (UIImageView *transimgview in transarry) {
                    transimgview.transform = CGAffineTransformIdentity;
                    transimgview.center =  CGPointMake(kScreenWidth/2, kScreenHeight/2);
                }
            }
        }
        _pageControl.currentPage = page;
        _numberLabel.text = [NSString stringWithFormat:@"%d/%ld",page + 1,(long)_imgCount];
        
        
    }
}


@end

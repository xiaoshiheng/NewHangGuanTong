//
//  ShowBigPicView.h
//  NewEntertainment
//
//  Created by 车呗 on 2019/2/18.
//  Copyright © 2019 RACTest. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SingleRecongnizerDelegate <NSObject>

- (void)SingleRecongnizerClick;

@end


NS_ASSUME_NONNULL_BEGIN

@interface ShowBigPicView : UIView<UIScrollViewDelegate>
@property (nonatomic, strong) UIScrollView *imgScrollow;
@property (nonatomic,strong) UIImageView *imgView;
@property (nonatomic, strong) NSMutableArray *allImgArry;
@property (nonatomic, strong) UIPageControl *pageControl;
@property (weak, nonatomic) id<SingleRecongnizerDelegate> delegate;


-(void)createUI:(NSArray *)imgarry Index:(NSInteger)index;
-(void)createStrUI:(NSString *)imgStr;

-(void)creatWithImage:(UIImage *)img;

@end

NS_ASSUME_NONNULL_END

//
//  CustomerFiltrateView.h
//  NewEntertainment
//
//  Created by 车呗 on 2021/9/24.
//  Copyright © 2021 RACTest. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^CustomerFiltrateViewHiddenBlock)(void);

typedef void(^CustomerFiltrateViewBlock)(int select);

@interface CustomerFiltrateView : UIView
@property (nonatomic, copy) CustomerFiltrateViewBlock block;
@property (nonatomic, copy) CustomerFiltrateViewHiddenBlock hiddenBlock;

-(instancetype)initWithData:(NSArray *)dataArry CurrentSelect:(int )select;
-(void)animationShow;
-(void)hidenView;
@end

NS_ASSUME_NONNULL_END

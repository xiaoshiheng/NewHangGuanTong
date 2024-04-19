//
//  UILabel+AlignmentLeftAndRight.h
//  NewEntertainment
//
//  Created by 车呗 on 2020/5/12.
//  Copyright © 2020 RACTest. All rights reserved.
//
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (AlignmentLeftAndRight)
//两端对齐

- (void)textAlignmentLeftAndRight;

//指定Label以最后的冒号对齐的width两端对齐

- (void)textAlignmentLeftAndRightWith:(CGFloat)labelWidth;
@end

NS_ASSUME_NONNULL_END

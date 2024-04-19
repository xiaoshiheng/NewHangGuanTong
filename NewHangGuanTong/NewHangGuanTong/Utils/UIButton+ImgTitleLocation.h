//
//  UIButton+ImgTitleLocation.h
//  NewCarProject
//
//  Created by 车呗 on 2017/11/21.
//  Copyright © 2017年 车呗新车. All rights reserved.
//

#import <UIKit/UIKit.h>

// 定义一个枚举（包含了四种类型的button）

typedef NS_ENUM(NSUInteger, GLButtonEdgeInsetsStyle) {

    GLButtonEdgeInsetsStyleTop, // image在上，label在下

    GLButtonEdgeInsetsStyleLeft, // image在左，label在右

    GLButtonEdgeInsetsStyleBottom, // image在下，label在上

    GLButtonEdgeInsetsStyleRight // image在右，label在左

};


@interface UIButton (ImgTitleLocation)

//图片在右,文字在左
-(void)imgRightAndLeftTitle;

//图片在上,文字在下
-(void)imgUpAndDownTitle;

//图片左对齐 文字居中
-(void)imgLeft;

//图片左对齐,文字右对齐
-(void)ingLeftAndTitleRight;

//文字左对齐，图片右对齐
-(void)titleLeftAndImgRight;

//图片在右,文字在左居中对齐
-(void)midTitleLeftAndImgRight;

/**

 *  设置button的titleLabel和imageView的布局样式，及间距

 *

 *  @param style titleLabel和imageView的布局样式

 *  @param space titleLabel和imageView的间距

 */

- (void)layoutButtonWithEdgeInsetsStyle:(GLButtonEdgeInsetsStyle)style

                        imageTitleSpace:(CGFloat)space;

@end

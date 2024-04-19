//
//  UIButton+ImgTitleLocation.m
//  NewCarProject
//
//  Created by 车呗 on 2017/11/21.
//  Copyright © 2017年 车呗新车. All rights reserved.
//

#import "UIButton+ImgTitleLocation.h"

@implementation UIButton (ImgTitleLocation)

-(void)imgRightAndLeftTitle{
    // button标题的偏移量
    self.titleEdgeInsets = UIEdgeInsetsMake(0, -self.imageView.bounds.size.width-3, 0, self.imageView.bounds.size.width);
    //self.titleLabel.textAlignment = NSTextAlignmentLeft;
    // button图片的偏移量
    self.imageEdgeInsets = UIEdgeInsetsMake(0, self.titleLabel.bounds.size.width+5, 0, -self.titleLabel.bounds.size.width);
}

-(void)imgUpAndDownTitle{
    // button标题的偏移量
    self.titleEdgeInsets = UIEdgeInsetsMake(self.imageView.frame.size.height+5, -self.imageView.bounds.size.width, 0,0);
    // button图片的偏移量
    self.imageEdgeInsets = UIEdgeInsetsMake(0, self.titleLabel.frame.size.width/2, self.titleLabel.frame.size.height+5, -self.titleLabel.frame.size.width/2);
}

-(void)imgLeft{
    //button文字的偏移量
    self.titleEdgeInsets = UIEdgeInsetsMake(0,  -(self.imageView.frame.origin.x+self.imageView.frame.size.width-20), 0, 0);
    //button图片的偏移量
    self.imageEdgeInsets = UIEdgeInsetsMake(0, -(self.imageView.frame.origin.x-20 ), 0, self.imageView.frame.origin.x);
}

-(void)ingLeftAndTitleRight{
    //button文字的偏移量
    self.titleEdgeInsets = UIEdgeInsetsMake(0,  0, 0, -(self.frame.size.width - self.titleLabel.frame.origin.x -self.titleLabel.frame.size.width));
    //button图片的偏移量
    self.imageEdgeInsets = UIEdgeInsetsMake(0, -(self.imageView.frame.origin.x ), 0, self.imageView.frame.origin.x);

}

-(void)titleLeftAndImgRight{
    self.titleEdgeInsets = UIEdgeInsetsMake(0,  -(self.titleLabel.frame.origin.x+20), 0, 0);
    
    self.imageEdgeInsets = UIEdgeInsetsMake(0, (self.frame.size.width - self.imageView.frame.origin.x - self.imageView.frame.size.width), 0, -(self.frame.size.width - self.imageView.frame.origin.x - self.imageView.frame.size.width));
}

-(void)midTitleLeftAndImgRight{
    //此方法是系统提供的调整文字和图片位置的API
    //[self setSemanticContentAttribute:UISemanticContentAttributeForceRightToLeft];
    //2.5是图片与title的讲个距离和,,即间隔为5
    [self setTitleEdgeInsets:UIEdgeInsetsMake(0,  -self.imageView.size.width-2.5, 0,self.imageView.size.width+2.5)];
    [self setImageEdgeInsets:UIEdgeInsetsMake(0, self.titleLabel.size.width+2.5, 0, -(self.titleLabel.size.width+2.5))];
}


- (void)layoutButtonWithEdgeInsetsStyle:(GLButtonEdgeInsetsStyle)style

                        imageTitleSpace:(CGFloat)space {

    /**

     *  知识点：titleEdgeInsets是title相对于其上下左右的inset，跟tableView的contentInset是类似的，

     *  如果只有title，那它上下左右都是相对于button的，image也是一样；

     *  如果同时有image和label，那这时候image的上左下是相对于button，右边是相对于label的；title的上右下是相对于button，左边是相对于image的。

     */

    // 1. 得到imageView和titleLabel的宽、高

    CGFloat imageWith = self.imageView.image.size.width;

    CGFloat imageHeight = self.imageView.image.size.height;

    CGFloat labelWidth = 0.0;

    CGFloat labelHeight = 0.0;

    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0) {

    // 由于iOS8中titleLabel的size为0，用下面的这种设置

        labelWidth = self.titleLabel.intrinsicContentSize.width;

        labelHeight = self.titleLabel.intrinsicContentSize.height;

    } else {

        labelWidth = self.titleLabel.frame.size.width;

        labelHeight = self.titleLabel.frame.size.height;

    }

    // 2. 声明全局的imageEdgeInsets和labelEdgeInsets

    UIEdgeInsets imageEdgeInsets = UIEdgeInsetsZero;

    UIEdgeInsets labelEdgeInsets = UIEdgeInsetsZero;

    // 3. 根据style和space得到imageEdgeInsets和labelEdgeInsets的值

    switch (style) {

        case GLButtonEdgeInsetsStyleTop:

        {

            imageEdgeInsets = UIEdgeInsetsMake(-labelHeight-space/2.0, 0, 0, -labelWidth);

            labelEdgeInsets = UIEdgeInsetsMake(0, -imageWith, -imageHeight-space/2.0, 0);

        }

            break;

        case GLButtonEdgeInsetsStyleLeft:

        {

            imageEdgeInsets = UIEdgeInsetsMake(0, -space/2.0, 0, space/2.0);

            labelEdgeInsets = UIEdgeInsetsMake(0, space/2.0, 0, -space/2.0);

        }

            break;

        case GLButtonEdgeInsetsStyleBottom:

        {

            imageEdgeInsets = UIEdgeInsetsMake(0, 0, -labelHeight-space/2.0, -labelWidth);

            labelEdgeInsets = UIEdgeInsetsMake(-imageHeight-space/2.0, -imageWith, 0, 0);

        }

            break;

        case GLButtonEdgeInsetsStyleRight:

        {

            imageEdgeInsets = UIEdgeInsetsMake(0, labelWidth+space/2.0, 0, -labelWidth-space/2.0);

            labelEdgeInsets = UIEdgeInsetsMake(0, -imageWith-space/2.0, 0, imageWith+space/2.0);

        }

            break;

        default:

            break;

    }

    // 4. 赋值

    self.titleEdgeInsets = labelEdgeInsets;

    self.imageEdgeInsets = imageEdgeInsets;

}

@end

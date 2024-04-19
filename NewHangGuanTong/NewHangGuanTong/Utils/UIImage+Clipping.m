//
//  UIImage+Clipping.m
//  NewCarProject
//
//  Created by 车呗 on 2018/8/8.
//  Copyright © 2018年 车呗新车. All rights reserved.
//

#import "UIImage+Clipping.h"

@implementation UIImage (Clipping)
-(UIImage *)ClipWithRect:(CGRect)rect{
    //把像 素rect 转化为 点rect（如无转化则按原图像素取部分图片）
    CGFloat scale = [UIScreen mainScreen].scale;
    CGFloat x= rect.origin.x*scale,y=rect.origin.y*scale,w=rect.size.width*scale,h=rect.size.height*scale;
    CGRect dianRect = CGRectMake(x, y, w, h);
    
    //截取部分图片并生成新图片
    CGImageRef sourceImageRef = [self CGImage];
    CGImageRef newImageRef = CGImageCreateWithImageInRect(sourceImageRef, dianRect);
    UIImage *newImage = [UIImage imageWithCGImage:newImageRef scale:[UIScreen mainScreen].scale orientation:UIImageOrientationUp];
    CFRelease(newImageRef);
    return newImage;
}
@end

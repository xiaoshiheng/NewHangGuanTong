//
//  UIImage+FixOrientation.m
//  NewEntertainment
//
//  Created by 车呗 on 2019/8/30.
//  Copyright © 2019 RACTest. All rights reserved.
//

#import "UIImage+FixOrientation.h"

@implementation UIImage (FixOrientation)

+ (UIImage*)fixOrientation:(UIImage*)image

{
    
    if (image.imageOrientation == UIImageOrientationUp)
        
        return image;
    
    CGAffineTransform transform = CGAffineTransformIdentity;
    
    
    
    switch (image.imageOrientation) {
            
        case UIImageOrientationDown:
            
        case UIImageOrientationDownMirrored:
            
            transform =CGAffineTransformTranslate(transform, image.size.width, image.size.height);
            
            transform =CGAffineTransformRotate(transform,M_PI);
            
            break;
            
            
            
        case UIImageOrientationLeft:
            
        case UIImageOrientationLeftMirrored:
            
            transform =CGAffineTransformTranslate(transform, image.size.width,0);
            
            transform =CGAffineTransformRotate(transform,M_PI_2);
            
            break;
            
            
            
        case UIImageOrientationRight:
            
        case UIImageOrientationRightMirrored:
            
            transform =CGAffineTransformTranslate(transform,0, image.size.height);
            
            transform =CGAffineTransformRotate(transform, -M_PI_2);
            
            break;
            
        default:
            
            break;
            
    }
    
    
    
    switch (image.imageOrientation) {
            
        case UIImageOrientationUpMirrored:
            
        case UIImageOrientationDownMirrored:
            
            transform =CGAffineTransformTranslate(transform, image.size.width,0);
            
            transform =CGAffineTransformScale(transform, -1,1);
            
            break;
            
            
            
        case UIImageOrientationLeftMirrored:
            
        case UIImageOrientationRightMirrored:
            
            transform =CGAffineTransformTranslate(transform, image.size.height,0);
            
            transform =CGAffineTransformScale(transform, -1,1);
            
            break;
            
        default:
            
            break;
            
    }
    
    
    
    
    
    CGContextRef ctx = CGBitmapContextCreate(NULL, image.size.width, image.size.height,
                                             
                                             CGImageGetBitsPerComponent(image.CGImage),0,
                                             
                                             CGImageGetColorSpace(image.CGImage),
                                             
                                             CGImageGetBitmapInfo(image.CGImage));
    
    CGContextConcatCTM(ctx, transform);
    
    switch (image.imageOrientation) {
            
        case UIImageOrientationLeft:
            
        case UIImageOrientationLeftMirrored:
            
        case UIImageOrientationRight:
            
        case UIImageOrientationRightMirrored:
            
            // Grr...
            
            CGContextDrawImage(ctx,CGRectMake(0,0,image.size.height,image.size.width), image.CGImage);
            
            break;
            
            
            
        default:
            
            CGContextDrawImage(ctx,CGRectMake(0,0,image.size.width,image.size.height), image.CGImage);
            
            break;
            
    }
    
    
    
    CGImageRef cgimg = CGBitmapContextCreateImage(ctx);
    
    UIImage*img = [UIImage imageWithCGImage:cgimg];
    
    CGContextRelease(ctx);
    
    CGImageRelease(cgimg);
    
    return img;
    
}

+(UIImage *)image:(UIImage *)image rotation:(UIImageOrientation)orientation

{
    
    long double rotate = 0.0;
    
    CGRect rect;
    
    float translateX = 0;
    
    float translateY = 0;
    
    float scaleX = 1.0;
    
    float scaleY = 1.0;
    
    
    
    switch (orientation) {
            
        case UIImageOrientationLeft:
            
            rotate =M_PI_2;
            
            rect =CGRectMake(0,0,image.size.height, image.size.width);
            
            translateX=0;
            
            translateY= -rect.size.width;
            
            scaleY =rect.size.width/rect.size.height;
            
            scaleX =rect.size.height/rect.size.width;
            
            break;
            
        case UIImageOrientationRight:
            
            rotate =3 *M_PI_2;
            
            rect =CGRectMake(0,0,image.size.height, image.size.width);
            
            translateX= -rect.size.height;
            
            translateY=0;
            
            scaleY =rect.size.width/rect.size.height;
            
            scaleX =rect.size.height/rect.size.width;
            
            break;
            
        case UIImageOrientationDown:
            
            rotate =M_PI;
            
            rect =CGRectMake(0,0,image.size.width, image.size.height);
            
            translateX= -rect.size.width;
            
            translateY= -rect.size.height;
            
            break;
            
        default:
            
            rotate =0.0;
            
            rect =CGRectMake(0,0,image.size.width, image.size.height);
            
            translateX=0;
            
            translateY=0;
            
            break;
            
    }
    
    
    
    UIGraphicsBeginImageContext(rect.size);
    
    CGContextRef context =UIGraphicsGetCurrentContext();
    
    //做CTM变换
    
    CGContextTranslateCTM(context, 0.0, rect.size.height);
    
    CGContextScaleCTM(context, 1.0, -1.0);
    
    CGContextRotateCTM(context, rotate);
    
    CGContextTranslateCTM(context, translateX,translateY);
    
    
    
    CGContextScaleCTM(context, scaleX,scaleY);
    
    //绘制图片
    
    CGContextDrawImage(context, CGRectMake(0,0,rect.size.width, rect.size.height), image.CGImage);
    
    
    
    UIImage *newPic =UIGraphicsGetImageFromCurrentImageContext();
    
    CGContextRelease(context);
    
  //  CGImageRelease(cgimg);
    
    return newPic;
    
}

@end

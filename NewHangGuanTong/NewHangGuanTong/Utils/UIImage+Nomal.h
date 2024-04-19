//
//  UIImage+Nomal.h
//  NewCarProject
//
//  Created by 车呗 on 2017/11/20.
//  Copyright © 2017年 车呗新车. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Nomal)

//UIImage尺寸处理
+ (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize;
//resize
- (void)drawInRect:(CGRect)rect withContentMode:(UIViewContentMode)contentMode;

/**
 * 将图片切成圆角图片
 *
 * @param size 返回图片的大小
 * @param r 圆角的大小
 *
 * @return 图片对象
 */
- (UIImage *)imageWithRoundedSize:(CGSize)size radius:(NSInteger)r;

/**
 *  播放GIF图片，放到imageView里面自动播放
 *
 *  @param theData  GIF图片的data
 *
 *  @return 返回一个GIF的图片
 */
+ (UIImage *)animatedImageWithAnimatedGIFData:(NSData *)theData;
//取图片上某点的颜色值
- (UIColor *)colorAtPixel:(CGPoint)point;

/**
 * 把图片旋转到指定角度
 *
 * @param degrees 旋转的度数,如：300
 *
 * @return 选择后的图片
 */
- (UIImage *)imageRotatedByDegrees:(CGFloat)degrees;


/// 把获得的相机照片或者摄像头照片旋转90度的调整为正向
/// @param aImage image
+(UIImage *)fixOrientationImage:(UIImage * )aImage;
@end

@interface UIImage (Color)
/**
 *  创建单色颜色值Image
 *
 *  @param color 颜色
 *  @param size size
 *
 *  @return image
 */
+ (UIImage *)imageWithSolidColor:(UIColor *)color size:(CGSize)size;

@end

//
//  UIImage+FixOrientation.h
//  NewEntertainment
//
//  Created by 车呗 on 2019/8/30.
//  Copyright © 2019 RACTest. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (FixOrientation)
+ (UIImage*)fixOrientation:(UIImage*)image rotation:(UIImageOrientation)orientation;
/*此方法慎用,容易导致内存泄漏*/
//+(UIImage *)image:(UIImage *)image rotation:(UIImageOrientation)orientation;
@end

NS_ASSUME_NONNULL_END

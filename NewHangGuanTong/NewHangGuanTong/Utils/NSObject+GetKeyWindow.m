//
//  NSObject+GetKeyWindow.m
//  NewEntertainment
//
//  Created by 车呗 on 2021/11/4.
//  Copyright © 2021 RACTest. All rights reserved.
//

#import "NSObject+GetKeyWindow.h"

@implementation NSObject (GetKeyWindow)
-(UIWindow *)getKeyWindow{
    if (@available(iOS 13.0, *)) {
        for (UIWindowScene *windowScene in [UIApplication sharedApplication].connectedScenes) {
            if (windowScene.activationState == UISceneActivationStateForegroundActive) {
                for (UIWindow *window in windowScene.windows) {
                    if (window.isKeyWindow) {
                        return window;
                    }
                }
            }
        }
    }else{
        return [UIApplication sharedApplication].keyWindow;
    }
    return nil;
}
@end

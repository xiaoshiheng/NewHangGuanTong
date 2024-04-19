//
//  UIAlertController+TextAliment.m
//  NewEntertainment
//
//  Created by 车呗 on 2020/5/18.
//  Copyright © 2020 RACTest. All rights reserved.
//

#import "UIAlertController+TextAliment.h"


@implementation UIAlertController (TextAliment)

@dynamic text_messageLabel;

- (NSArray *)yf_viewArray:(UIView *)root {
    static NSArray *_subviews = nil;
    _subviews = nil;
    for (UIView *v in root.subviews) {
        if (_subviews) {
            break;
        }
        if ([v isKindOfClass:[UILabel class]]) {
            _subviews = root.subviews;
            return _subviews;
        }
        [self yf_viewArray:v];
    }
    return _subviews;
}

- (UILabel *)text_messageLabel {
    return [self yf_viewArray:self.view][0];
}

@end

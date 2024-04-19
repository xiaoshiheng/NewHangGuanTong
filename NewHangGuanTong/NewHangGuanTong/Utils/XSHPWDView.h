//
//  XSHPWDView.h
//  NewEntertainment
//
//  Created by 车呗 on 2019/1/17.
//  Copyright © 2019 RACTest. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XSHTextField.h"

typedef void(^XSHPWDViewTextBlock)(NSArray *txtArry);

NS_ASSUME_NONNULL_BEGIN

@interface XSHPWDView : UIView<XSHTextFieldDelegate>

@property (nonatomic, strong)XSHTextField *firstsTxt;
@property (nonatomic, strong)XSHTextField *secondTxt;
@property (nonatomic, strong)XSHTextField *thirdTxt;
@property (nonatomic, strong)XSHTextField *fourthTxt;
@property (nonatomic, strong)XSHTextField *fifthTxt;
@property (nonatomic, strong)XSHTextField *sixthTxt;
@property (nonatomic, strong) NSMutableArray *strArry;
@property (nonatomic, copy) XSHPWDViewTextBlock block;

@end

NS_ASSUME_NONNULL_END

//
//  UILabel+ChangeLineSpaceAndWordSpace.h
//  NewEntertainment
//
//  Created by 车呗 on 2019/1/22.
//  Copyright © 2019 RACTest. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (ChangeLineSpaceAndWordSpace)

/*
改变行间距

*/
- (void)changeLineSpaceForLabelWithSpace:(float)space;
/***
 改变字间距
*/
- (void)changeWordSpaceForLabelWithSpace:(float)space;
/**
*  改变行间距和字间距
*/
- (void)changeSpaceForLabelwithLineSpace:(float)lineSpace WordSpace:(float)wordSpace;

@end

NS_ASSUME_NONNULL_END

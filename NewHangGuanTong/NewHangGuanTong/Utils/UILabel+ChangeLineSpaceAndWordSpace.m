//
//  UILabel+ChangeLineSpaceAndWordSpace.m
//  NewEntertainment
//
//  Created by 车呗 on 2019/1/22.
//  Copyright © 2019 RACTest. All rights reserved.
//

#import "UILabel+ChangeLineSpaceAndWordSpace.h"

@implementation UILabel (ChangeLineSpaceAndWordSpace)
- (void)changeLineSpaceForLabelWithSpace:(float)space {
    NSMutableAttributedString*attributedString = [[NSMutableAttributedString alloc] initWithString:self.text];
    NSMutableParagraphStyle*paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:space];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [self.text length])];
    self.attributedText = attributedString;
   // [self sizeToFit];
    
}

- (void)changeWordSpaceForLabelWithSpace:(float)space {
    NSMutableAttributedString*attributedString = [[NSMutableAttributedString alloc] initWithString:self.text attributes:@{NSKernAttributeName:@(space)}];
    NSMutableParagraphStyle*paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [self.text length])];
    self.attributedText = attributedString;
  //  [self sizeToFit];
    
}

- (void)changeSpaceForLabelwithLineSpace:(float)lineSpace WordSpace:(float)wordSpace{
    NSMutableAttributedString*attributedString = [[NSMutableAttributedString alloc] initWithString:self.text attributes:@{NSKernAttributeName:@(wordSpace)}];
    NSMutableParagraphStyle*paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:lineSpace];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [self.text length])];
    self.attributedText = attributedString;
 //   [self sizeToFit];
    
}

@end

//
//  UILabel+AlignmentLeftAndRight.m
//  NewEntertainment
//
//  Created by 车呗 on 2020/5/12.
//  Copyright © 2020 RACTest. All rights reserved.
//

#import "UILabel+AlignmentLeftAndRight.h"

@implementation UILabel (AlignmentLeftAndRight)
- (void)textAlignmentLeftAndRight{
    
    [self textAlignmentLeftAndRightWith:CGRectGetWidth(self.frame)];
    
}
- (void)textAlignmentLeftAndRightWith:(CGFloat)labelWidth{
    
    if(self.text==nil||self.text.length==0) {
        
        return;
        
    }
    
    CGSize size = [self.text boundingRectWithSize:CGSizeMake(labelWidth,MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:self.font} context:nil].size;
    
    NSInteger length = (self.text.length-1);
    
    NSString* lastStr = [self.text substringWithRange:NSMakeRange(self.text.length-1,1)];
    
    if([lastStr isEqualToString:@":"]||[lastStr isEqualToString:@"："]) {
        
        length = (self.text.length-2);
        
    }
    
    CGFloat margin = (labelWidth - size.width)/length;
    
    NSNumber *number = [NSNumber numberWithFloat:margin];
    
    NSMutableAttributedString* attribute = [[NSMutableAttributedString alloc]initWithString:self.text];
    [attribute addAttribute:NSKernAttributeName value:number range:NSMakeRange(0,length)];
    self.attributedText= attribute;
}
@end

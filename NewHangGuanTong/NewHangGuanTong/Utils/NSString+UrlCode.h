//
//  NSString+UrlCode.h
//  NewCarProject
//
//  Created by 车呗 on 2018/8/3.
//  Copyright © 2018年 车呗新车. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (UrlCode)

/**
 *  URLEncode
 */
- (NSString *)URLEncodedString;

/**
 *  URLDecode
 */
-(NSString *)URLDecodedString;

@end

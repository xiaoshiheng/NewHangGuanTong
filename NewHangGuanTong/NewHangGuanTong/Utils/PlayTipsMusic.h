//
//  PlayTipsMusic.h
//  NewEntertainment
//
//  Created by 车呗 on 2019/12/4.
//  Copyright © 2019 RACTest. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AudioToolbox/AudioToolbox.h>

NS_ASSUME_NONNULL_BEGIN

@interface PlayTipsMusic : NSObject

/**
 播放系统来电声音
 @param name 文件名
 @param type 文件类型
 @param isAlert 是否伴随震动
 */
+ (SystemSoundID)playSystemSoundWithName:(NSString *)name type:(NSString *)type isAlert:(BOOL)isAlert;

// 停止播放来电声音
+ (void)stopPlaySystemSound:(SystemSoundID)soundID;

@end

NS_ASSUME_NONNULL_END

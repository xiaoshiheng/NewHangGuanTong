//
//  PlayTipsMusic.m
//  NewEntertainment
//
//  Created by 车呗 on 2019/12/4.
//  Copyright © 2019 RACTest. All rights reserved.
//

#import "PlayTipsMusic.h"

@implementation PlayTipsMusic
+ (SystemSoundID)playSystemSoundWithName:(NSString *)name type:(NSString *)type isAlert:(BOOL)isAlert {
    // 获取文件路径
    NSString *filePath = [[NSBundle mainBundle] pathForResource:name ofType:type];
    // 加载音效文件，得到对应的音效ID
    SystemSoundID soundID = 0;
    AudioServicesCreateSystemSoundID((__bridge CFURLRef _Nonnull)[NSURL fileURLWithPath:filePath], &soundID);
    // 播放音效
    if (isAlert) {
        AudioServicesPlayAlertSound(soundID);
    } else {
        AudioServicesPlaySystemSound(soundID);
       // AudioServicesPlayAlertSound(soundID);
    }
    return soundID;
}

+ (void)stopPlaySystemSound:(SystemSoundID)soundID {
    //把需要销毁的音效文件的ID传递给它既可销毁
    AudioServicesDisposeSystemSoundID(soundID);
}

@end

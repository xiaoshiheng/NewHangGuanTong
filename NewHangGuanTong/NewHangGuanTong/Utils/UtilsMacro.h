//
//  UtilsMacro.h
//  NewCarProject
//
//  Created by 车呗 on 2017/11/20.
//  Copyright © 2017年 车呗新车. All rights reserved.
//

#import "AppDelegate.h"

//#define kIs_iPhoneX kScreenWidth >=375.0f && kScreenHeight >=812.0f&& kIs_iphone
//
///*状态栏高度*/
//#define kStatusBarHeight (CGFloat)(kIs_iPhoneX?(44.0):(20.0))
///*导航栏高度*/
//#define kNavBarHeight (44)
///*状态栏和导航栏总高度*/
#define kNavBarAndStatusBarHeight (CGFloat)(kIphoneX?(88.0):(64.0))
///*TabBar高度*/
//#define kTabBarHeight (CGFloat)(kIs_iPhoneX?(49.0 + 34.0):(49.0))
///*顶部安全区域远离高度*/
//#define kTopBarSafeHeight (CGFloat)(kIs_iPhoneX?(44.0):(0))
///*底部安全区域远离高度*/
//#define kBottomSafeHeight (CGFloat)(kIs_iPhoneX?(34.0):(0))
///*iPhoneX的状态栏高度差值*/
//#define kTopBarDifHeight (CGFloat)(kIs_iPhoneX?(24.0):(0))
///*导航条和Tabbar总高度*/
//#define kNavAndTabHeight (kNavBarAndStatusBarHeight + kTabBarHeight)


#define kSystemVersion             [[UIDevice currentDevice] systemVersion]//手机系统版本号
#define kPhoneIdentifierNumber          [[UIDevice currentDevice].identifierForVendor UUIDString] //手机序列号(删除重新安装会改变)
#define kUUID     [[NSUUID UUID] UUIDString]//UUID+keychain(保存比较就稳定---但是手机恢复出厂设置也会被清除掉)

#define kApplicationDelegate                 ((AppDelegate *)[[UIApplication sharedApplication] delegate])
#define kUserDefaults                       [NSUserDefaults standardUserDefaults]
#define kNavBarHeight                        self.navigationController.navigationBar.bounds.size.height
#define kStatusBarHeight                     [[UIApplication sharedApplication] statusBarFrame].size.height
#define kTabBarHeight                        self.tabBarController.tabBar.bounds.size.height
#define kScreenWidth                         [[UIScreen mainScreen] bounds].size.width
#define kScreenHeight                        [[UIScreen mainScreen] bounds].size.height
#define kSelfViewWidth                       self.view.bounds.size.width
#define kSelfViewHeight                      self.view.bounds.size.height
#define kScreenBounds                        [[UIScreen mainScreen] bounds]
//不带安全区域的
#define kUseViewScreenHeight     kIphoneX ? kScreenHeight - kNavBarHeight - 44  : kScreenHeight - kNavBarHeight - 20 //view高度
//带有安全区域的
#define kIphonexUseViewScreenHeight         kIphoneX ? kScreenHeight - kNavBarHeight - 44 - 34  : kScreenHeight - kNavBarHeight - 20

//带有安全区域切有tabbar的情况下
#define kIphonexTabBarUseViewScreenHeight         kIphoneX ? kScreenHeight - kNavBarHeight - 44 - kTabBarHeight  : kScreenHeight - kNavBarHeight - 20 - kTabBarHeight


#define RGB(r, g, b)                        [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0]
#define RGBA(r, g, b, a)                    [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

#define kUIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define kUIColorFromRGBWithAlpha(rgbValue,alphaValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:alphaValue]

#define kIphoneXColro(rgbValue) [UIColor colorWithHex:rgbValue alpha:0.5]

#define kFormat(string, args...)                  [NSString stringWithFormat:string, args]
//#define ALERT(title, msg)                   [[[UIAlertView alloc]initWithTitle:title\
//message:msg\
//delegate:nil\
//cancelButtonTitle:@"OK" \
//otherButtonTitles:nil] show]

#define ERROR(m,c,d) [NSError errorWithDomain:m code:c userInfo:d]
#define kAppNavigationController  (UINavigationController *)[UIApplication sharedApplication].keyWindow.rootViewController
#define kDocumentsPath [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES) objectAtIndex:0]
#define kAppVersion [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
#define kAppName [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"]
#define kDeviceMode [[UIDevice currentDevice] model]


//  DEVICE DETECTION
#define IS_WIDESCREEN ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON )
#define IS_IPAD (UI_USER_INTERFACE_IDIOM() != UIUserInterfaceIdiomPhone)
#define IS_IPHONE (!IS_IPAD)
#define IS_IPHONE_5 ( IS_IPHONE && IS_WIDESCREEN )

#pragma mark - 屏幕尺寸------------------
#define kIphone4        ([[UIScreen mainScreen] bounds].size.height == 480.f)
#define kIphone5        ([[UIScreen mainScreen] bounds].size.height == 568.f)
#define kIphone6        ([[UIScreen mainScreen] bounds].size.height == 667.f)
#define kIphone6p       ([[UIScreen mainScreen] bounds].size.height == 736.f)
//#define kIphoneX        ([[UIScreen mainScreen] bounds].size.height == 812.f)
#define kIphoneX \
({BOOL isPhoneX = NO;\
if (@available(iOS 11.0, *)) {\
isPhoneX = [[UIApplication sharedApplication] delegate].window.safeAreaInsets.bottom > 0.0;\
}\
(isPhoneX);})

#define IOS_VERSION_8_3_OR_LATER (([[[UIDevice currentDevice] systemVersion] floatValue]>=8.3)? (YES):(NO))


/**
 *  1 判断是否为3.5inch      320*480
 */
#define ONESCREEN ([UIScreen mainScreen].bounds.size.height == 480)
/**
 *  2 判断是否为4inch        640*1136
 */
#define TWOSCREEN ([UIScreen mainScreen].bounds.size.height == 568)
/**
 *  3 判断是否为4.7inch   375*667   750*1334
 */
#define THREESCREEN ([UIScreen mainScreen].bounds.size.height == 667)
/**
 *  4 判断是否为5.5inch   414*1104   1242*2208
 */
#define FOURSCREEN ([UIScreen mainScreen].bounds.size.height == 1104)


//  DEVICE VERSION
#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)

#define kIOS7 SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0")
#define kIOS8 SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"8.0")

#define DeviceVesrion [[UIDevice currentDevice] systemVersion]

#define PPMUIRealValue(value) ((value)/375.0f*[UIScreen mainScreen].bounds.size.width)

//
#define kOpenURL(urlString) [[NSWorkspace sharedWorkspace] openURL:[NSURL URLWithString:urlString]]

#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;
#pragma mark -> 打印 <-

#ifdef DEBUG
#define MWNSLog(format, ...) printf("\n[%s] %s [第%d行] %s\n", __TIME__, __FUNCTION__, __LINE__, [[NSString stringWithFormat:format, ## __VA_ARGS__] UTF8String]);
#elif Prepare
#define MWNSLog(format, ...) printf("\n[%s] %s [第%d行] %s\n", __TIME__, __FUNCTION__, __LINE__, [[NSString stringWithFormat:format, ## __VA_ARGS__] UTF8String]);
#else
#define MWNSLog(format, ...)

#endif

#ifndef SAFE_STRING
#define SAFE_STRING(x) ((x) == nil || [x isKindOfClass:[NSNull class]]) ? @"" : (x)
#endif

#define PPMUIRealValue(value) ((value)/375.0f*[UIScreen mainScreen].bounds.size.width)

#define NoCameraAuthorityText @"请在iPhone的\"设置-隐私-相机\"选项中，允许%@访问你的相机"

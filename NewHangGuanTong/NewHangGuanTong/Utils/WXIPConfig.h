//
//  WXIPConfig.h
//  NewEntertainment
//
//  Created by 车呗 on 2021/2/3.
//  Copyright © 2021 RACTest. All rights reserved.
//

#import <Foundation/Foundation.h>
static const NSString * _Nonnull kWXConfigInterfaceWifi = @"en0";
static const NSString * _Nonnull kWXConfigInterfaceCellular = @"pdp_ip0";
static const NSString * _Nonnull kWXConfigInterfaceVPN = @"utun0";
static const NSString * _Nonnull kWXIPConfigIPV4 = @"ipv4";
static const NSString * _Nonnull kWXIPConfigIPV6 = @"ipv6";

typedef NSDictionary<NSString*, NSString*> WXConfigIPMap;
NS_ASSUME_NONNULL_BEGIN

@interface WXIPConfig : NSObject

+ (NSString *)keyWithName: (NSString*)name version: (NSString*)version;
+ (nonnull WXConfigIPMap*)getAllIPs;
+ (nullable NSString*)getIPWithInterface: (NSString*)interface version: (NSString*)version;


@end

NS_ASSUME_NONNULL_END

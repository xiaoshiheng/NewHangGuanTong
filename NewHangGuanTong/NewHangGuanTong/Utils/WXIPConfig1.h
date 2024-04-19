//
//  WXIPConfig1.h
//  NewEntertainment
//
//  Created by 车呗 on 2021/2/3.
//  Copyright © 2021 RACTest. All rights reserved.
//

#import <Foundation/Foundation.h>
#include <ifaddrs.h>
#include <arpa/inet.h>
#include <net/if.h>
 
#define IOS_CELLULAR    @"pdp_ip0"
//有些分配的地址为en0 有些分配的en1
#define IOS_WIFI2       @"en2"
#define IOS_WIFI1       @"en1"
#define IOS_WIFI        @"en0"
//#define IOS_VPN       @"utun0"  vpn很少用到可以注释
#define IP_ADDR_IPv4    @"ipv4"
#define IP_ADDR_IPv6    @"ipv6"

NS_ASSUME_NONNULL_BEGIN

@interface WXIPConfig1 : NSObject

- (NSString *)getIPAddress:(BOOL)preferIPv4;

@end

NS_ASSUME_NONNULL_END

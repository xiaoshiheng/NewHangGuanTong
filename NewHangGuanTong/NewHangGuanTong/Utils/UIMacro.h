//
//  UIMacro.h
//  NewCarProject
//
//  Created by 车呗 on 2017/11/20.
//  Copyright © 2017年 车呗新车. All rights reserved.
//

#ifndef UIMacro_h
#define UIMacro_h


#pragma mark - Color Size 配置
#define kBaseNavColor               0xc1a7ed//导航条基本颜色
#define kBaseNavVersion2Color       0xffffff//导航条基本颜色

#define kBaseViewColor              0xF3F7F9//背景色 先灰色

#define kBaseGrayViewColor          0xf8f8f8//灰色背景

#define kBaseLineColor             0xEFEFEF//线条颜色
//#define kBaseLineGrayColor         0xe2e2e2//线条颜色
#define kLineSpaceColor             0xe2e2e2//分割线颜色2px
#define kGrayLineColor              0xefefef//灰色线条颜色

//#define kButtonColor                0xd1b5e1//主色按钮浅紫色
#define kButtonColor                0x916DFD//主色按钮淡紫色
#define kButtonBlackColor           0x080609//主色按钮深黑色
#define kButtonRedColor             0xF33B3B//红色按钮

#define kTabButtonColorSelect       0x8864FF//底部tabbar选中紫色
#define kTabButtonColorUnSelect     0x959595//底部tabbar未选中黑色
#define kFitButtonColor             0xFF7900//筛选页按钮颜色

#define kTextGrayColor              0x7E7E7E//灰色字体的颜色
#define kTextLightGrayColor         0xADADAD//亮灰色字体的颜色
#define kTextBlackColor             0x515151//黑色气体的颜色
#define kTextTitleBlackColor        0x404857//单元格标题颜色
#define kTextNavItemBtnColor        0x2C2C2C//导航栏按钮字体颜色
#define kTextPurpleColor            0x8864FF//紫色字体的颜色
#define kTextLightPurpleColor       0x7A6FE0//淡紫色的颜色
//#define kButtonUnClick              0xF7F7F7//按钮不可点击背景色
#define kButtonUnClick              0xC2ADFF//按钮不可点击背景色
#define kButtonGrayUnClick          0xe3e3e3//按钮不可点击灰色
#define kTextOriginColor            0xFF6F27//橙色字体的颜色
#define kTextRedColor               0xF33B3B//红色字体
#define kTextGreenColor             0x2EC459//绿色字体

#define kTextYellowColor            0xFF9905//黄色字体
#define kTextBlueColor              0x3D71FF//蓝色字体

#define kPlaceholderColor           kUIColorFromRGBWithAlpha(0x8E8E93, 0.5)//uitextfield Placeholder字体的颜色

#define ResponBtnColor              0xFE941A//结果提示页按钮颜色
#define kClearColor                 [UIColor clearColor]



#pragma mark - Notification

#pragma mark - Userdefaults

#define kStoneAppVersion           @"kStoneAppVersion"  //记录当前版本号  用户覆盖安装 比较

#define kUserDefaultsToken         [[NSUserDefaults standardUserDefaults] objectForKey:kToken] //本地token
#define kJPushRegistId                     [[NSUserDefaults standardUserDefaults] objectForKey:kJPushId]
#define kAliPushDeviceId            [[NSUserDefaults standardUserDefaults] objectForKey:kAliPushId]
#define kUserDefaultsPhoneNo       [[NSUserDefaults standardUserDefaults] objectForKey:kPhoneNo] //本地账号
#define kUserDefaultsLocationCity   [[NSUserDefaults standardUserDefaults] objectForKey:kLocationCity]
#define kUserDefaultsLocationCityId   [[NSUserDefaults standardUserDefaults] objectForKey:kLocationCityId]
#define kUserDefaultsCompanyId     [[NSUserDefaults standardUserDefaults] objectForKey:kDefaultCompanyId]

#define kToken                     @"kToken"             //记录用户登录的唯一标示
#define kDefaultCompanyId          @"kDefaultCompanyId"    //默认公司id
#define kDefaultOrganizationId     @"kDefaultOrganizationId"    //默认部门id
#define kJPushId                   @"kJPushId"    //极光id
#define kAliPushId                 @"kAliPushId"  //阿里云推送id
#define kDefaultOrganizationName    @"kDefaultOrganizationName"    //默认部门名称
#define kAutoLogin                 @"kAutoLogin"         //是否自动登录
#define kPhoneNo                   @"kPhoneNo"           //记录用户手机号
#define kUserName                  @"kUserName"          //记录用户艺名
#define kCompayName                @"kCompayName"        //场所名称
#define kCompayNickName            @"kCompayNickName"        //场所昵称
#define kUserLoginPhone            @"kUserLoginPhone"    //登录账号
#define kCompanyAvatar             @"kCompanyAvatar"    //场所头像
#define kSex                       @"kSex"               //性别
#define kIsPayPwd                  @"kIsPayPwd"          //是否设置支付密码
#define kIdentityCheck             @"kIdentityCheck"          //是否实名认证
#define kRechargeAndWaller         @"kRechargeAndWaller"          //钱包及支付方式控制
#define kHaiXinCheck               @"kHaiXinCheck"       //海鑫认证
#define kOrganizationLeader        @"kOrganizationLeader"//部门/部门负责人
#define kLeaderNickName            @"kLeaderNickName"//领队艺名
#define kGratuity                  @"kGratuity"//酒水提成
#define kDrawAccount               @"kDrawAccount"//提现默认账号
#define kPunchSysTime              @"kPunchSysTime"       //系统时间
#define kUserCompanyId             @"kUserCompanyId"       //用户场所关系ID
#define kRoleName                  @"kRoleName"           //用户角色名称
#define KUserRealName              @"KUserRealName"      //记录用户真实名字
#define KUserId                    @"KUserId"           //记录用户USERID
#define KIdCard                    @"KIdCard"            //记录用户身份证号
#define kBindBanksCount            @"kBindBanksCount"    //绑定银行卡的张数
#define kAvatar                     @"kAvatar"           //头像
#define kCaseCount                  @"kCaseCount"        //案件数
#define KRealNameAuth              @"KRealNameAuth"      //记录用户是否实名认证
#define kLocationCity              @"locationCity"      //定位城市
#define kLocationCityId             @"locationCityId"   //定位城市ID
#define kLocationCityName            @"LocationCityName"   //定位城市名字
#define kSelectDateStr              @"kSelectDateStr" //考勤月历选择的年月
#define kCityName                   @"kCityName" //当期所在城市
#define kCityCode                   @"kCityCode"//当前所在城市code

#define kAreaHostIp                 @"kAreaHostIp" //区域服务器域名
#define kFirstInstall              @"kFirstInstall"//首次安装
#define kNewApp                    @"kNewApp" //是否是使用新版本app
#define kNewAppAuth                @"kNewAppAuth" //新版本app是否已授权
#define kDeviceLock                @"kDeviceLock"//设备锁是否弹过

#define kApproveMessageCount       @"kApproveMessageCount"//未读消息的小红点
#define kUploadTimes               [[NSUserDefaults standardUserDefaults] objectForKey:@"kUploadTimes"]//更新弹窗出现的次数
#define kUploadTimeStemp           [[NSUserDefaults standardUserDefaults] objectForKey:@"kUploadTimeStemp"]//上次弹窗的时间戳

#define kNoUpLoadTips              @"kNoUpLoadTips"//是否点击了不再提醒更新提示

#define kSFunctionSuccess          @"kSFunctionSuccess"//H5跳转功能模块成功通知name
#define kSFunctionFail           @"kSFunctionFail"//H5跳转功能模块成功通知name
#define kSoboAppKey              @"435e6840bac5402a80a1723532707682"//智齿在线客服appkey
#define kWithdrawSuccess         @"kWithdrawSuccess"//提现成功
#define kUseCouponsSuccess       @"kUseCouponsSuccess"//使用优惠券支付成功


#define kTokeDes


#define kLocationCurrentProvinceName  @"kLocationCurrentProvinceName"      //当期定位的省
#define kLocationCurrentCityName      @"kLocationCurrentCityName"       //当前定位的市

#define KJPushRegistrationID       @"KJPushRegistrationID" //极光id

#pragma mark - 三方账号信息key 配置



#pragma mark - KEY

#pragma mark - Cache

/**
 用来存储从首页及搜索页的临时数据
 例如:点击首页品牌存储的值的形式为:@"品牌+品牌ID,数组索引,品牌名"
     点击首页首付存储的值的形式为:@"首付+首付区间"
 从搜索页存储的值的形式为:@"搜索+搜索关键词"
 @return nil
 */
#define kTempSearchKey            @"TempSearchKey"//搜索及首页临时数据
#define kServicerPhone            @"ServicerPhone"//客服电话


#pragma mark =================== URL相关

#define kALYEndPoint @"https://oss-cn-hangzhou.aliyuncs.com"

#define kBlankContractUrl          @"https://image.qingmiaojituan.com/h5/ruihong/pages/purpose0808/index.html"//空白意向合同链接

#ifdef DEBUG
#define kBaseImgUrl                @"http://image.test.qingmiaojituan.com/"//图片地址前缀
#define Env                        @"test"

#else
#define kBaseImgUrl                @"https://image.qingmiaojituan.com/"//图片地址前缀
#define Env                        @"release"

#endif


#endif /* UIMacro_h */

//
//  XSHCustomeAltView.h
//  NewEntertainment
//
//  Created by 车呗 on 2019/4/17.
//  Copyright © 2019 RACTest. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^ComplationBlock)(NSString *content);

typedef void(^XSHCustomeAltViewSureBtnBlock)(void);

typedef void(^XSHCustomerToRealCheck)(void);//去实名bLock

typedef void(^XSHCustomeAltViewCloseBlock)(void);

@interface XSHCustomeAltView : UIView<UITextViewDelegate>

@property (nonatomic, strong) UIView *backView;
@property (nonatomic, strong) UILabel *titleLab;
@property (nonatomic, strong) UILabel *messageLab;
@property (nonatomic, strong) UITextView *textView;
@property (nonatomic, strong) UIButton *cancelBtn;
@property (nonatomic, strong) UIButton *sureBtn;
@property (nonatomic, strong) UIView *hLineView;
@property (nonatomic, strong) UIView *vLineView;
@property (nonatomic, copy) ComplationBlock block;
@property (nonatomic, copy) XSHCustomeAltViewSureBtnBlock sureBlock;
@property (nonatomic, copy) XSHCustomerToRealCheck realBlock;
@property (nonatomic, copy) XSHCustomeAltViewCloseBlock closeBlock;
@property (nonatomic, assign) int type;//1,通过/2,拒绝

@property (nonatomic, copy) NSString *titleStr;
@property (nonatomic, copy) NSString *infoStr;

@property (nonatomic, copy) NSString *cancelBtnStr;
@property (nonatomic, copy) NSString *sureBtnStr;

@property (nonatomic, copy) NSString *reasonStr;

@property (nonatomic, strong) UILabel *placeLab;

@property (nonatomic, strong) NSArray *ticketsRulesArry;
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray *rulesSelectedArry;
@property (nonatomic, assign) int maxStrNum;//输入的最大字数

@property (nonatomic, assign) int countDownTime;//按钮倒计时
@property (nonatomic, strong) NSTimer *timer;//计时器
@property (nonatomic, assign) BOOL isShowCloseBtn;


@property (nonatomic, strong) UIButton *closeBtn;

@property (nonatomic, strong) UIImageView *scoreImg;
@property (nonatomic, strong) UIImageView *bgImg;

@property (nonatomic, assign) BOOL isRefuse;



/// 普通弹窗 首行缩进
/// @param frame frame
/// @param title title
/// @param message message
/// @param complation complation
-(instancetype)initWithFrame:(CGRect)frame Title:(NSString *)title Message:(NSString *)message Complation:(ComplationBlock)complation;



/**
 专用申请初始化方法

 @param frame frame
 @param type 类型 1,通过 2,拒绝 3,人员管理修改艺名 4,人员管理修改提成
 @param title title
 @param message message
 @param complation complation
 @return instancetype
 */
-(instancetype)initWithFrame:(CGRect)frame Type:(int)type Titl:(NSString *)title Message:(NSString *)message Complation:(ComplationBlock)complation;


/**
 员工管理设置入场券规则弹窗

 @param frame frame
 @param rules 规则
 @return instancetype
 */
-(instancetype)initWithFrame:(CGRect)frame TicketRules:(NSArray *)rules SelectTicketRule:(NSArray *)selectArry;


/**
 员工管理拒绝弹窗

 @param frame frame
 @param title title
 @param message message
 @param complation complation
 @return instancetype
 */
-(instancetype)initWithFrame:(CGRect)frame Titl:(NSString *)title Message:(NSString *)message  MaxStringNum:(int)strNum Complation:(ComplationBlock)complation;



/// 初始化首页实人认证右上角有关闭按钮和取消按钮倒计时
/// @param title 标题
/// @param message 提示内容
/// @param time 倒计时
/// @param cancelBtn 取消按钮title
/// @param sureBtn 确定按钮title
/// @param isShow 是否显示关闭按钮
-(instancetype)initWithTitle:(NSString *)title MessageContent:(NSString *)message CountDonwTime:(int)time CancelButton:(NSString *)cancelBtn SureButtone:(NSString *)sureBtn IsShowCloseBtn:(BOOL)isShow;


/// 考勤打卡状态弹窗
/// @param date 打卡时间
/// @param status 打卡状态
/// @param score 积分
-(instancetype)initWithTime:(NSString *)date Status:(int)status Score:(int)score;


/// 场所入职黑名单提醒
/// @param title title
/// @param info info
/// @param company company
-(instancetype)initWithTitle:(NSString *)title BlackNameInfo:(NSString *)info Company:(NSString *)company;

/// 广安授权弹窗
-(instancetype)initGuangAnAuth;


@end


typedef void(^XSHCustomeChangePhoneSureBlock)(void);
@interface XSHCustomeChangePhone : UIView

@property (nonatomic, strong) UIView *backView;
@property (nonatomic, strong) UILabel *titleLab;
@property (nonatomic, strong) UIButton *cancelBtn;
@property (nonatomic, strong) UIButton *sureBtn;
@property (nonatomic, strong) UIButton *closeBtn;
@property (nonatomic, copy) UILabel *phoneLab;
@property (nonatomic, copy) UILabel *timeLab;
@property (nonatomic, copy) UILabel *tipsLab;
@property (nonatomic, copy) XSHCustomeChangePhoneSureBlock sureBlock;

/// 身份确认弹框
/// @param time 注册时间
/// @param phone 手机号
/// @param tips 提示语
-(instancetype)initWithTime:(NSString *)time Phone:(NSString *)phone TipsStr:(NSString *)tips;

/// 授权绑定弹框
/// @param tips 提示语
-(instancetype)initWtihTips:(NSString *)tips;

@end



NS_ASSUME_NONNULL_END

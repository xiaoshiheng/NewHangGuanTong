//
//  PieChartView.h
//  CircleTest
//
//  Created by 车呗 on 2019/5/17.
//  Copyright © 2019 RACTest. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PieChartView : UIView

@property (nonatomic, strong) UIView *backView;//
@property (nonatomic, strong) UIView *circleBackView;

@property (nonatomic, strong) CAShapeLayer *layer1;//第一个圆弧
@property (nonatomic, strong) CAShapeLayer *layer2;//第一个圆弧
@property (nonatomic, strong) CAShapeLayer *layer3;//第一个圆弧

@property (nonatomic, strong) CAShapeLayer *noDatalayer;//暂无数据的圆

@property (nonatomic, strong) CAShapeLayer *dashLayer10;//第一个折线
@property (nonatomic, strong) CAShapeLayer *dashLayer11;//第二个折线
@property (nonatomic, strong) CAShapeLayer *dashLayer12;//第三个折线

@property (nonatomic, strong) UILabel *titleLab;//圆中心的title
@property (nonatomic, strong) UILabel *firstLab;//第一个折线下的label
@property (nonatomic, strong) UILabel *secondLab;//第二个折线下的label
@property (nonatomic, strong) UILabel *thirdLab;//第三个折线下的label

@property (nonatomic, assign) double centerY;//圆心Y
@property (nonatomic, assign) double centerX;//圆心X

@property (nonatomic, strong) UIColor *firstColor;//第一区域色值
@property (nonatomic, strong) UIColor *secondColor;//第二区域色值
@property (nonatomic, strong) UIColor *thirdColor;//第三区域色值

@property (nonatomic, strong) UIColor *noDataColor;//暂无数据色值

@property (nonatomic, assign) CGFloat totalHeight;//总得高度




/**
 初始化饼状图

 @param centerPoint 圆心坐标
 @param radius 圆的半径
 @param firstValue 第一个圆弧的值
 @param secondValue 第二个圆弧的值
 @param thirdValue 第三个圆弧的值
 */
-(void)creatCircle:(CGPoint)centerPoint RadiusValue:(double)radius SumValue:(double )sumValue FirstValue:(double)firstValue SecondValue:(double)secondValue ThirdValue:(double)thirdValue;
@end

NS_ASSUME_NONNULL_END

//
//  PieChartView.m
//  CircleTest
//
//  Created by 车呗 on 2019/5/17.
//  Copyright © 2019 RACTest. All rights reserved.
//

#import "PieChartView.h"

#define kScreenWidth                         [[UIScreen mainScreen] bounds].size.width
#define kScreenHeight                        [[UIScreen mainScreen] bounds].size.height

@interface PieChartView ()



@end

@implementation PieChartView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self creatBackView];
    }
    return self;
    
}

-(void)creatBackView{
    _circleBackView = [[UIView alloc]initWithFrame:CGRectMake(0, 0,210 , 210)];
    _circleBackView.center = CGPointMake(kScreenWidth/2, 105);
    _circleBackView.backgroundColor = [UIColor clearColor];
    [self addSubview:_circleBackView];
    
}
-(void)creatCircle:(CGPoint)centerPoint RadiusValue:(double)radius SumValue:(double )sumValue FirstValue:(double)firstValue SecondValue:(double)secondValue ThirdValue:(double)thirdValue{
    _totalHeight = 210;
    if (!_firstColor) {
        _firstColor = kUIColorFromRGBWithAlpha(0xff7d51, 1);
    }
    if (!_secondColor) {
        _secondColor = kUIColorFromRGBWithAlpha(kButtonColor, 1);
    }
    if (!_thirdColor) {
        _thirdColor = kUIColorFromRGBWithAlpha(0xFFBC48, 1);
    }
    if (!_noDataColor) {
        _noDataColor = [UIColor colorWithRed:228.0/255.0 green:228.0/255.0 blue:228.0/255.0 alpha:1];
    }
    if (_layer1) {
        [_layer1 removeFromSuperlayer];
        _layer1 = nil;
        [_layer2 removeFromSuperlayer];
        _layer2 = nil;
        [_layer3 removeFromSuperlayer];
        _layer3 = nil;
        
        [_dashLayer10 removeFromSuperlayer];
        _dashLayer10 = nil;
        [_dashLayer11 removeFromSuperlayer];
        _dashLayer11 = nil;
        [_dashLayer12 removeFromSuperlayer];
        _dashLayer12 = nil;
        
        [_firstLab removeFromSuperview];
        _firstLab = nil;
        [_secondLab removeFromSuperview];
        _secondLab = nil;
        [_thirdLab removeFromSuperview];
        _thirdLab = nil;
        
        [_titleLab removeFromSuperview];
        _titleLab = nil;
    }else if (_noDatalayer){
        [_noDatalayer removeFromSuperlayer];
        _noDatalayer = nil;
        
        [_titleLab removeFromSuperview];
        _titleLab = nil;
    }
    
    double originStart = -M_PI/2;
    double sum = sumValue;
    
    CGFloat x0 = 105;
    CGFloat y0 = 105;

    //按照顺时针方向
    BOOL clockWise = true;
    
    if (sum>0) {
        double average = 0;
        if (sum>0) {
            average = 2*M_PI/sum;
        }
        
        //double averageangle = 360/sum;
        //画圆的弧度
        double start1 = originStart + firstValue*average;
        double start2 = start1+secondValue*average;
        double start3 = start2+thirdValue*average;
        
        //求圆上点坐标的弧度
        double radian1 = originStart + firstValue*average/2;
        double radian2 = start1+average*secondValue/2;
        double radian3 = start2+average*thirdValue/2;
        
        CGFloat x1 = x0+76*cos(radian1);
        CGFloat y1 = y0+76*sin(radian1);
        CGPoint point100 = CGPointMake(x1, y1);
        
        CGFloat x2 = x0+76*cos(radian2);
        CGFloat y2 = y0+76*sin(radian2);
        CGPoint point111 = CGPointMake(x2, y2);
        
        CGFloat x3 = x0+76*cos(radian3);
        CGFloat y3 = y0+76*sin(radian3);
        CGPoint point222 = CGPointMake(x3, y3);
        
        
        
        _layer1 = [CAShapeLayer new];
        _layer1.lineWidth = 20;
        //圆环的颜色
        _layer1.strokeColor = _firstColor.CGColor;
        //背景填充色
        _layer1.fillColor = [UIColor clearColor].CGColor;
        //初始化一个路径
        
        UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(x0, y0) radius:radius startAngle:originStart endAngle:start1 clockwise:clockWise];
        _layer1.path = [path CGPath];
        [_circleBackView.layer addSublayer:_layer1];
        
        // 折线属性
        _dashLayer10 = [CAShapeLayer layer];
        _dashLayer10.strokeColor = _firstColor.CGColor;
        _dashLayer10.fillColor = [UIColor clearColor].CGColor;
        _dashLayer10.lineWidth = 0.5;
        // 绘制折线
        UIBezierPath * path10 = [[UIBezierPath alloc]init];
        [_circleBackView.layer addSublayer:_dashLayer10];
        
        
        if (firstValue>0) {
            _firstLab = [[UILabel alloc]initWithFrame:CGRectMake(point100.x, point100.y, 70, 40)];
            _firstLab.textColor = _firstColor;
            _firstLab.font = [UIFont systemFontOfSize:12];
            _firstLab.numberOfLines = 2;
            _firstLab.text = [NSString stringWithFormat:@"过期入场券收入:%.0f",firstValue];
            
            // 折线起点
            [path10 moveToPoint:point100];
            // 折线终点
            if (radian1>=originStart&&radian1<0) {
                //            [path10 addLineToPoint:CGPointMake(point100.x+10, point100.y-15)];
                //            [path10 addLineToPoint:CGPointMake(point100.x+80, point100.y-15)];
                //            _firstLab.frame = CGRectMake(point100.x+30, point100.y-10, 70, 35);
                //
                if (point111.y-point100.y<=15 && secondValue>0) {
                    [path10 addLineToPoint:CGPointMake(point100.x-10, point100.y-15)];
                    [path10 addLineToPoint:CGPointMake(point100.x-80, point100.y-15)];
                    _firstLab.frame = CGRectMake(point100.x-100, point100.y-10, 70, 35);
                }else{
                    [path10 addLineToPoint:CGPointMake(point100.x+10, point100.y-15)];
                    [path10 addLineToPoint:CGPointMake(point100.x+80, point100.y-15)];
                    _firstLab.frame = CGRectMake(point100.x+30, point100.y-10, 70, 35);
                    
                    
                    
                }
                
                
            }else if (radian1>=0&&radian1<M_PI/2){
                [path10 addLineToPoint:CGPointMake(point100.x+10, point100.y+15)];
                [path10 addLineToPoint:CGPointMake(point100.x+80, point100.y+15)];
                _firstLab.frame = CGRectMake(point100.x+30, point100.y+20, 70, 35);
                //此处代码是为了判断再第二和第三区间的时候的uilabel的最大Y值,然后确定饼状图的最大Y值
                _totalHeight = _totalHeight<point100.y+55?point100.y+55:_totalHeight;
            }else if (radian1>=M_PI/2&&radian1<M_PI){
                [path10 addLineToPoint:CGPointMake(point100.x-10, point100.y+15)];
                [path10 addLineToPoint:CGPointMake(point100.x-80, point100.y+15)];
                _firstLab.frame = CGRectMake(point100.x-100, point100.y+20, 70, 35);
                //此处代码是为了判断再第二和第三区间的时候的uilabel的最大Y值,然后确定饼状图的最大Y值
                _totalHeight = _totalHeight<point100.y+55?point100.y+55:_totalHeight;
            }else{
                [path10 addLineToPoint:CGPointMake(point100.x-10, point100.y-15)];
                [path10 addLineToPoint:CGPointMake(point100.x-80, point100.y-15)];
                _firstLab.frame = CGRectMake(point100.x-100, point100.y-10, 70, 35);
            }
            _dashLayer10.path = path10.CGPath;
        }
       
        
        
        
        _layer2 = [CAShapeLayer new];
        _layer2.lineWidth = 20;
        //圆环的颜色
        _layer2.strokeColor = _secondColor.CGColor;
        //背景填充色
        _layer2.fillColor = [UIColor clearColor].CGColor;
        UIBezierPath *path1 = [UIBezierPath bezierPathWithArcCenter:CGPointMake(x0, y0) radius:radius startAngle:start1 endAngle:start2 clockwise:clockWise];
        _layer2.path = [path1 CGPath];
        [_circleBackView.layer addSublayer:_layer2];
        
        
        // 折线属性
        _dashLayer11 = [CAShapeLayer layer];
        _dashLayer11.strokeColor = _secondColor.CGColor;
        _dashLayer11.fillColor = [UIColor clearColor].CGColor;
        _dashLayer11.lineWidth = 0.5;
        // 绘制折线
        UIBezierPath * path11 = [[UIBezierPath alloc]init];
        [_circleBackView.layer addSublayer:_dashLayer11];
        // 折线起点
        
        if (secondValue>0) {
            _secondLab = [[UILabel alloc]initWithFrame:CGRectMake(point111.x, point111.y, 70, 40)];
            _secondLab.textColor = _secondColor;
            _secondLab.font = [UIFont systemFontOfSize:12];
            _secondLab.text = [NSString stringWithFormat:@"使用入场券收入:%.0f",secondValue];
            _secondLab.numberOfLines = 2;
            
            
            [path11 moveToPoint:point111];
            // 折线终点
            if (radian2>=originStart&&radian2<0) {
                [path11 addLineToPoint:CGPointMake(point111.x+10, point111.y-15)];
                [path11 addLineToPoint:CGPointMake(point111.x+80, point111.y-15)];
                _secondLab.frame = CGRectMake(point111.x+30, point111.y-10, 70, 35);
            }else if (radian2>=0&&radian2<M_PI/2){
                [path11 addLineToPoint:CGPointMake(point111.x+10, point111.y+15)];
                [path11 addLineToPoint:CGPointMake(point111.x+80, point111.y+15)];
                _secondLab.frame = CGRectMake(point111.x+30, point111.y+20, 70, 35);
                
                //此处代码是为了判断再第二和第三区间的时候的uilabel的最大Y值,然后确定饼状图的最大Y值
                _totalHeight = _totalHeight<point111.y+55?point111.y+55:_totalHeight;
            }else if (radian2>=M_PI/2&&radian2<M_PI){
                [path11 addLineToPoint:CGPointMake(point111.x-10, point111.y+15)];
                [path11 addLineToPoint:CGPointMake(point111.x-80, point111.y+15)];
                _secondLab.frame = CGRectMake(point111.x-100, point111.y+20, 70, 35);
                //此处代码是为了判断再第二和第三区间的时候的uilabel的最大Y值,然后确定饼状图的最大Y值
                _totalHeight = _totalHeight<point111.y+55?point111.y+55:_totalHeight;
            }else{
                [path11 addLineToPoint:CGPointMake(point111.x-10, point111.y-15)];
                [path11 addLineToPoint:CGPointMake(point111.x-80, point111.y-15)];
                _secondLab.frame = CGRectMake(point111.x-100, point111.y-10, 70, 35);
            }
            _dashLayer11.path = path11.CGPath;
        }
       
        
        
        _layer3 = [CAShapeLayer new];
        _layer3.lineWidth = 20;
        //圆环的颜色
        _layer3.strokeColor = _thirdColor.CGColor;
        //背景填充色
        _layer3.fillColor = [UIColor clearColor].CGColor;
        UIBezierPath *path2 = [UIBezierPath bezierPathWithArcCenter:CGPointMake(x0, y0) radius:radius startAngle:start2 endAngle:start3 clockwise:clockWise];
        _layer3.path = [path2 CGPath];
        [_circleBackView.layer addSublayer:_layer3];
        
        
        
        
        // 折线属性
        _dashLayer12 = [CAShapeLayer layer];
        _dashLayer12.strokeColor = _thirdColor.CGColor;
        _dashLayer12.fillColor = [UIColor clearColor].CGColor;
        _dashLayer12.lineWidth = 0.5;
        // 绘制折线
        UIBezierPath * path12 = [[UIBezierPath alloc]init];
        [_circleBackView.layer addSublayer:_dashLayer12];
        
        if (thirdValue>0) {
            _thirdLab = [[UILabel alloc]initWithFrame:CGRectMake(point222.x, point222.y, 70, 40)];
            _thirdLab.textColor = _thirdColor;
            _thirdLab.font = [UIFont systemFontOfSize:12];
            _thirdLab.text = [NSString stringWithFormat:@"迟到罚款收入:%.0f",thirdValue];
            _thirdLab.numberOfLines = 2;
            
            
            // 折线起点
            [path12 moveToPoint:point222];
            // 折线终点
            if (radian3>=originStart&&radian3<0) {
                [path12 addLineToPoint:CGPointMake(point222.x+10, point222.y-15)];
                [path12 addLineToPoint:CGPointMake(point222.x+80, point222.y-15)];
                _thirdLab.frame = CGRectMake(point222.x+30, point222.y-10, 70, 35);
            }else if (radian3>=0&&radian3<M_PI/2){
                [path12 addLineToPoint:CGPointMake(point222.x+10, point222.y+15)];
                [path12 addLineToPoint:CGPointMake(point222.x+80, point222.y+15)];
                _thirdLab.frame = CGRectMake(point222.x+30, point222.y+20, 70, 35);
                //此处代码是为了判断再第二和第三区间的时候的uilabel的最大Y值,然后确定饼状图的最大Y值
                _totalHeight = _totalHeight<point222.y+55?point222.y+55:_totalHeight;
            }else if (radian3>=M_PI/2&&radian3<M_PI){
                [path12 addLineToPoint:CGPointMake(point222.x-10, point222.y+15)];
                [path12 addLineToPoint:CGPointMake(point222.x-80, point222.y+15)];
                _thirdLab.frame = CGRectMake(point222.x-100, point222.y+20, 70, 35);
                //此处代码是为了判断再第二和第三区间的时候的uilabel的最大Y值,然后确定饼状图的最大Y值
                _totalHeight = _totalHeight<point222.y+55?point222.y+55:_totalHeight;
            }else{
                if (point111.y-point222.y<=15 && secondValue>0) {
                    [path12 addLineToPoint:CGPointMake(point222.x+10, point222.y-15)];
                    [path12 addLineToPoint:CGPointMake(point222.x+80, point222.y-15)];
                    _thirdLab.frame = CGRectMake(point222.x+20, point222.y-10, 70, 35);
                }else{
                    [path12 addLineToPoint:CGPointMake(point222.x-10, point222.y-15)];
                    [path12 addLineToPoint:CGPointMake(point222.x-80, point222.y-15)];
                    _thirdLab.frame = CGRectMake(point222.x-100, point222.y-10, 70, 35);
                }
            }
            _dashLayer12.path = path12.CGPath;
        }
       
        
        [_circleBackView addSubview:_firstLab];
        [_circleBackView addSubview:_secondLab];
        [_circleBackView addSubview:_thirdLab];
        
        
        
        
    }else{
        
        _noDatalayer = [CAShapeLayer new];
        _noDatalayer.lineWidth = 20;
        //圆环的颜色
        _noDatalayer.strokeColor = _noDataColor.CGColor;
        //背景填充色
        _noDatalayer.fillColor = [UIColor clearColor].CGColor;
        
        UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(x0, y0) radius:radius startAngle:originStart endAngle:1.5*M_PI clockwise:clockWise];
        _noDatalayer.path = [path CGPath];
        [_circleBackView.layer addSublayer:_noDatalayer];
        
    }

    
    _titleLab = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 112, 112)];
    _titleLab.center = CGPointMake(105, 105);
    _titleLab.textColor = [UIColor blackColor];
    _titleLab.font = [UIFont systemFontOfSize:14];
    _titleLab.numberOfLines = 4;
    _titleLab.textAlignment = NSTextAlignmentCenter;
    //_titleLab.text = @"总收入\n99999999\n(元)";
    NSString *str = @"";
    if (sum>0) {
        str = [NSString stringWithFormat:@"总收入\n%.0f\n(元)",sum];
        NSMutableAttributedString *attributeStr = [[NSMutableAttributedString alloc]initWithString:str];
        [attributeStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:16] range:NSMakeRange(0, 3)];
        if (@available(iOS 8.2, *)) {
            [attributeStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:24 weight:UIFontWeightBold] range:NSMakeRange(3, str.length-6)];
        } else {
            // Fallback on earlier versions
             [attributeStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:24] range:NSMakeRange(3, str.length-6)];
        }
        _titleLab.attributedText = attributeStr;
    }else{
        str = @"暂无数据";
        _titleLab.textColor = [UIColor colorWithRed:138.0/255.0 green:138.0/255.0 blue:138.0/255.0 alpha:1];
        _titleLab.font = [UIFont systemFontOfSize:18];
        _titleLab.text = str;
    }
    
    [_circleBackView addSubview:_titleLab];
    
}

#pragma mark 计算圆圈上点在IOS系统中的坐标
-(CGPoint) calcCircleCoordinateWithCenter:(CGPoint) center  andWithAngle : (CGFloat) angle andWithRadius: (CGFloat) radius{
    CGFloat x2 = radius*cosf(angle*M_PI/180);
    CGFloat y2 = radius*sinf(angle*M_PI/180);
    return CGPointMake(center.x+x2, center.y-y2);
}

@end

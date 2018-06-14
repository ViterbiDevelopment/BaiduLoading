//
//  BezierLoadingView.m
//  loadingAnimation
//
//  Created by 掌上先机 on 2017/5/3.
//  Copyright © 2017年 wangchao. All rights reserved.
//

#import "BezierLoadingView.h"


@interface BezierLoadingView()


@property(nonatomic,strong)CAShapeLayer *maskLayer;


@end

@implementation BezierLoadingView


-(instancetype)initWithFrame:(CGRect)frame{


    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor clearColor];
        
        
        UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:self.bounds];
        
        CAShapeLayer *maskLayer = [CAShapeLayer layer];
        maskLayer.fillColor=[UIColor clearColor].CGColor;
        //将路径赋值给CAShapeLayer
        maskLayer.path = path.CGPath;
        //设置路径的颜色
        maskLayer.strokeColor=[UIColor colorWithRed:0.52f green:0.76f blue:0.07f alpha:1.00f].CGColor;
        //设置路径的宽度
        maskLayer.lineWidth=1;
        maskLayer.lineCap=kCALineCapRound;
        
        self.maskLayer = maskLayer;
        
        [self.layer addSublayer:maskLayer];
    }

    return self;

}

-(void)beginAnimation{

    
    self.maskLayer.strokeStart=0;
    //设置strokeEnd的最终值，动画的fromValue为0，strokeEnd的最终值为0.98
  //  self.maskLayer.strokeEnd=0.98;
    
    CABasicAnimation *BasicAnimation=[CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    BasicAnimation.fromValue=@(0);
    BasicAnimation.toValue=@(0.98);
    BasicAnimation.duration=2;
    //  BasicAnimation.delegate=self;
    [BasicAnimation setValue:@"BasicAnimationEnd" forKey:@"animationName"];
    [self.maskLayer addAnimation:BasicAnimation forKey:@"BasicAnimationEnd"];

    

}

@end

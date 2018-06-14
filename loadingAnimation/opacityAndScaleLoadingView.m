//
//  opacityAndScaleLoadingView.m
//  loadingAnimation
//
//  Created by 掌上先机 on 2017/7/17.
//  Copyright © 2017年 wangchao. All rights reserved.
//

#import "opacityAndScaleLoadingView.h"

@implementation opacityAndScaleLoadingView


-(instancetype)initWithFrame:(CGRect)frame{

    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor clearColor];
        CAKeyframeAnimation *animations = [self createBasic];
    
        CFTimeInterval currentTime = CACurrentMediaTime();
       
        for (int i = 0; i<8; i++) {
          
            CALayer *subLayer = [self createLayerWithSize:CGSizeMake(20, 20) andColor:[UIColor redColor]];
            CGFloat size = 20;
            CGPoint origin= CGPointMake(0, 0);

            CGFloat radius = self.frame.size.width/2.0;
            
            CGFloat angle = M_PI_4*i  ;
            
            subLayer.frame = CGRectMake(origin.x+radius*(cos(angle)+1)-size/2, origin.y+radius*(sin(angle)+1)-size/2, size, size);

            animations.beginTime = 0.2*i + currentTime;
          
            [subLayer addAnimation:animations forKey:nil];
        
            [self.layer addSublayer:subLayer];
        }
        
    }
    
    return self;
}

-(CAKeyframeAnimation *)createBasic{
    
    
    CAKeyframeAnimation *anmation = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
    
    anmation.autoreverses = YES;
    anmation.duration = 1.6;
    anmation.keyTimes = @[@(0),@(0.5),@(1)];
    anmation.values = @[@(1),@(0.1),@(1)];
  
    anmation.repeatCount = LONG_LONG_MAX;
    //anmation.repeatDuration = 2;
    anmation.removedOnCompletion = NO;
    anmation.fillMode = kCAFillModeForwards;
    
    return anmation;
    
}


-(void)drawRect:(CGRect)rect{
  
}

-(CALayer *)createLayerWithSize:(CGSize )size andColor:(UIColor *)color{
    
    
    CAShapeLayer *shaper = [CAShapeLayer layer];
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    [path addArcWithCenter:CGPointMake(size.width/2.0, size.height/2.0) radius:size.width/2.0 startAngle:0 endAngle:2*M_PI clockwise:YES];
    
    [path stroke];
    shaper.lineWidth = 2;
    
    shaper.fillColor = color.CGColor;
    shaper.path = path.CGPath;
    return shaper;
}


+(void)beginiAnimationWithSuperView:(UIView *)contanView{
    opacityAndScaleLoadingView *subview = [[opacityAndScaleLoadingView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    
    [contanView addSubview:subview];
  
}


+(void)stopAnimationWithSuperView:(UIView *)contanView{

    for (UIView * subview in contanView.subviews) {
      
        if ([subview isKindOfClass:[opacityAndScaleLoadingView class]]) {
            
            [subview removeFromSuperview];
        }
    }

}




@end

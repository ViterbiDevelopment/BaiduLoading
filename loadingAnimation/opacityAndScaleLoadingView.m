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
        
        //        //修改bounds，方便计算弧度
        self.bounds = CGRectMake(-self.frame.size.width/2.0, -self.frame.size.height/2.0, self.frame.size.width, self.frame.size.height);
        
        
        for (int i = 0; i<8; i++) {
            
            
            CALayer *subLayer = [self createLayerWithSize:CGSizeMake(20, 20) andColor:[UIColor redColor]];
            
          //  subLayer.anchorPoint = CGPointMake(1, 0.5);
            
        
            CGFloat initAngle = atan(10.0/(self.frame.size.width/2.0 - 20));
            

            

            CGFloat angle = -initAngle ;
            
            CGFloat x = cos(angle) * (frame.size.width/2.0 - 10) * cos(angle);
            
            CGFloat y = sin(angle) *(frame.size.width/2.0-10)*cos(angle);
            
            
            subLayer.frame = CGRectMake(x, y, 20, 20);
            
            
            [self.layer addSublayer:subLayer];
            
        }

        
        
    }
    
    return self;



}

-(void)drawRect:(CGRect)rect{
    
    
    for (int i = 0; i<8; i++) {
        
        if (i != 0) {
            
            return;
        }
        
        CGFloat initAngle = atan(10.0/(self.frame.size.width/2.0 - 20));
        
        
        
        CGFloat angle = -initAngle ;
        
        CGFloat x = cos(angle) * (self.frame.size.width/2.0 - 10) * cos(angle);
        
        CGFloat y = sin(angle) *(self.frame.size.width/2.0-10)*cos(angle);
        

        
        
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextSetLineCap(context, kCGLineCapRound);
        CGContextSetLineWidth(context, 0.5);  //线宽
        CGContextSetAllowsAntialiasing(context, true);
        CGContextSetRGBStrokeColor(context, 70.0 / 255.0, 241.0 / 255.0, 241.0 / 255.0, 1.0);  //线的颜色
        
        
        
        CGContextBeginPath(context);
        
        CGContextMoveToPoint(context, 0, 0);  //起点坐标
        CGContextAddLineToPoint(context,x, y);   //终点坐标
        
        CGContextStrokePath(context);
        
    }

    
  


    
    
   


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

    
    

    opacityAndScaleLoadingView *subview = [[opacityAndScaleLoadingView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    
    [contanView addSubview:subview];
    
    
    


}




@end

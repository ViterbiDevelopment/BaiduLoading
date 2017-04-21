//
//  loadingView.m
//  loadingAnimation
//
//  Created by 掌上先机 on 17/4/20.
//  Copyright © 2017年 wangchao. All rights reserved.
//

#import "loadingView.h"
#import "AppDelegate.h"


@interface loadingView()

@property(nonatomic,strong)CADisplayLink *displayLink;

@property(nonatomic,assign)int count;

@property(nonatomic,assign)BOOL toRight;

@property(nonatomic,strong)NSMutableArray *threeColors;


@property(nonatomic,strong)UILabel *oneLable;
@property(nonatomic,strong)UILabel *twoLable;
@property(nonatomic,strong)UILabel *threeLable;



@property(nonatomic,strong)NSMutableArray *loadViewArray;



@end


@implementation loadingView






-(instancetype)initWithFrame:(CGRect)frame{


    if (self = [super initWithFrame:frame]) {
        
        
        _loadViewArray = [[NSMutableArray alloc] initWithCapacity:0];
        
        
        _toRight = YES;
        
        
    
        _threeColors = [[NSMutableArray alloc] initWithObjects:[UIColor redColor],[UIColor blackColor],[UIColor blueColor], nil];
        
        _oneLable = [self createLableWithFrame:CGRectMake(0, 0, 20, 20) adnColor:[UIColor redColor]];
        [self addSubview:_oneLable];
        
        
        _twoLable = [self createLableWithFrame:CGRectMake(40, 0, 20, 20) adnColor:[UIColor blackColor]];
        [self addSubview:_twoLable];
        
        _threeLable = [self createLableWithFrame:CGRectMake(80, 0, 20, 20) adnColor:[UIColor blueColor]];
        
        [self addSubview:_threeLable];
        
        
      
        
    }

    return self;

}

+(void)showLoadingViewInView:(UIView *)view{

    
    loadingView *selfLoad = [[loadingView alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
    
    
    selfLoad.center = view.center;
    
    [view addSubview:selfLoad];
    
    [selfLoad began];
    

   


}

+(void)beginAnimation{
    

    UIView *topView = [UIApplication sharedApplication].windows.lastObject;
    
    [self showLoadingViewInView:topView];
    
    
}

+(void)stopAnimation{

    
    
     UIView *topView = [UIApplication sharedApplication].windows.lastObject;
    
    [self removeViewInnView:topView];
    


}


+(void)removeViewInnView:(UIView *)view{
    
    
    if ([view isKindOfClass:[loadingView class]]) {
        
        [UIView animateWithDuration:0.3 animations:^{
            
            view.alpha = 0;
            
        } completion:^(BOOL finished) {
            [view removeFromSuperview];
            
        }];
        
        
        return;
    }

    
    for (UIView *subviews in view.subviews) {
        
      
        if (subviews.subviews.count > 0) {
            
            [self removeViewInnView:subviews];
        }
        
        
    }

    

}


-(void)began{

    
    
    self.displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(changeFameAndColor)];
    
    [self.displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
    
    
}

-(void)stop{

    self.displayLink.paused = YES;
    
    [self.displayLink removeFromRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
    
    //_stance.hidden = YES;
    

    
    
}





-(void)changeFameAndColor{
    
    
    if (_toRight) {
        
        _count = _count + 1;
        _oneLable.frame = CGRectMake(_count*2 , 0, 20, 20);
        _threeLable.frame = CGRectMake(80 - _count*2, 0, 20, 20);
        [self changeColor];
    
    }
    else{
    
        _count = _count - 1;
        _oneLable.frame = CGRectMake(80 + _count*2, 0, 20, 20);
         _threeLable.frame = CGRectMake(- _count*2, 0, 20, 20);
        
        [self changeColor];
        
    }
    
    if (_oneLable.center.x == 90) {
        
        _count = 0;
        _toRight = NO;
        
    }
    if (_oneLable.center.x == 10) {
        
        
        _count = 0;
        
        _toRight = YES;
        
    }
    
    
}

-(void)changeColor{

    if (_oneLable.center.x == _threeLable.center.x) {
        
        /*
        红 黑 蓝
        蓝 红 黑
        黑 蓝 红
         */
        UIColor *first = _threeColors.firstObject;
        UIColor *second = _threeColors[1];
        UIColor *last = _threeColors.lastObject;
        
       
        _threeColors[0] = last;
        _threeColors[1] = first;
        _threeColors[2] = second;
        _oneLable.backgroundColor = _threeColors[0];
        _twoLable.backgroundColor = _threeColors[1];
        _threeLable.backgroundColor = _threeColors[2];
        
    
        
    }

   


}

+ (UIViewController *)presentingVC{
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal){
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows){
            if (tmpWin.windowLevel == UIWindowLevelNormal){
                window = tmpWin;
                break;
            }
        }
    }
    UIViewController *result = window.rootViewController;
    while (result.presentedViewController) {
        result = result.presentedViewController;
    }
    if ([result isKindOfClass:[UITabBarController class]]) {
        result = [(UITabBarController *)result selectedViewController];
    }
    if ([result isKindOfClass:[UINavigationController class]]) {
        result = [(UINavigationController *)result topViewController];
    }
    return result;
}

-(UILabel *)createLableWithFrame:(CGRect)frame adnColor:(UIColor *)color{


    UILabel *lable = [[UILabel alloc] initWithFrame:frame];
    
    lable.backgroundColor = color;
    
    
    lable.layer.cornerRadius = lable.frame.size.width/2.0;
    
    lable.layer.masksToBounds = YES;
    
    //[self addSubview:lable];

    return lable;

}


@end

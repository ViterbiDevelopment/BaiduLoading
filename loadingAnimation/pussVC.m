//
//  pussVC.m
//  loadingAnimation
//
//  Created by 掌上先机 on 17/4/20.
//  Copyright © 2017年 wangchao. All rights reserved.
//

#import "pussVC.h"
#import "loadingView.h"
#import "ShadingLoadingView.h"
#import "opacityAndScaleLoadingView.h"




@interface pussVC ()

@end

@implementation pussVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    
    UIView *loadgingBgView = [[UIView alloc] initWithFrame:CGRectMake(100, 64, 200, 100)];
    
    [loadingView showLoadingViewInView:loadgingBgView];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [loadingView stopAnimation];
    });
    
   
    [self.view addSubview:loadgingBgView];
    
    /*
     
     [loadingView beginAnimation];
     [loadingView stopAnimation];
     
     
     */
    
   
    
    
    
    UIView *ShadingLoadingBGView = [[UIView alloc] initWithFrame:CGRectMake(100, 164, 200, 100)];
    
    [ShadingLoadingView showLoadingViewInView:ShadingLoadingBGView];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [ShadingLoadingView stopAnimation];
    });
    
    
    [self.view addSubview:ShadingLoadingBGView];
    
    /*
     
     [ShadingLoadingView beginAnimation];
     [ShadingLoadingView stopAnimation];
     
     
     */
    
    
    UIView *opacityAndScaleBgView = [[UIView alloc] initWithFrame:CGRectMake(150, 264, 200, 200)];
    
    
    
    [opacityAndScaleLoadingView beginiAnimationWithSuperView:opacityAndScaleBgView];
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        
        
        [opacityAndScaleLoadingView stopAnimationWithSuperView:opacityAndScaleBgView];
        
        
    });
    
    [self.view addSubview:opacityAndScaleBgView];
    
    
}




@end




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



@interface pussVC ()

@end

@implementation pussVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    
    UIView *loadgingBgView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 200, 200)];
    
    [loadingView showLoadingViewInView:loadgingBgView];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [loadingView stopAnimation];
    });
    
   
    [self.view addSubview:loadgingBgView];
    
    /*
     
     [loadingView beginAnimation];
     [loadingView stopAnimation];
     
     
     */
    
   
    
    
    
    UIView *ShadingLoadingBGView = [[UIView alloc] initWithFrame:CGRectMake(100, 300, 200, 200)];
    
    [ShadingLoadingView showLoadingViewInView:ShadingLoadingBGView];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [ShadingLoadingView stopAnimation];
    });
    
    
    [self.view addSubview:ShadingLoadingBGView];
    
    /*
     
     [ShadingLoadingView beginAnimation];
     [ShadingLoadingView stopAnimation];
     
     
     */
    
    
    
    
    
}




@end




//
//  pussVC.m
//  loadingAnimation
//
//  Created by 掌上先机 on 17/4/20.
//  Copyright © 2017年 wangchao. All rights reserved.
//

#import "pussVC.h"
#import "loadingView.h"

@interface pussVC ()

@end

@implementation pussVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    

    //添加到window试图
    
    [loadingView beginAnimation];
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [loadingView stopAnimation];
    });
    
    
    /*
     
     添加到自定义的试图
     
      [loadingView showLoadingViewInView:self.view];
     
     
     */
    
    
}




@end

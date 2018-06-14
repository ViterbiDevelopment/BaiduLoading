//
//  loadingView.h
//  loadingAnimation
//
//  Created by 掌上先机 on 17/4/20.
//  Copyright © 2017年 wangchao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface loadingView : UIView

+(void)showLoadingViewInView:(UIView *)view;

+(void)beginAnimation;

+(void)stopAnimation;

@end

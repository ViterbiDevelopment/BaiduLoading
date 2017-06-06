//
//  ShadingLoadingView.h
//  loadingAnimation
//
//  Created by 掌上先机 on 2017/6/6.
//  Copyright © 2017年 wangchao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShadingLoadingView : UIView


+(void)showLoadingViewInView:(UIView *)view;

+(void)hidenLoadingView:(UIView *)view;

+(void)beginAnimation;

+(void)stopAnimation;

@end

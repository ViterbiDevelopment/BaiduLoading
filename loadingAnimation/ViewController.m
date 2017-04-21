//
//  ViewController.m
//  loadingAnimation
//
//  Created by 掌上先机 on 17/4/20.
//  Copyright © 2017年 wangchao. All rights reserved.
//

#import "ViewController.h"
#import "pussVC.h"

#import "loadingView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    

    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
  
}



- (IBAction)pushClick:(UIButton *)sender {
    
    pussVC *vc = [[pussVC alloc] init];
    
    
    [self.navigationController pushViewController:vc animated:YES];
    
    
}


@end

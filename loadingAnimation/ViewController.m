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
    
    
    
    
   // [[loadingView alloc] init];
    
//    loadingView *load = [[loadingView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
//    
//    load.center = self.view.center;
//    
//    [self.view addSubview:load];
//    
//    
    

    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
  //  
    
    
    // Do any additional setup after loading the view, typically from a nib.
}



- (IBAction)pushClick:(UIButton *)sender {
    
    pussVC *vc = [[pussVC alloc] init];
    
    
    [self.navigationController pushViewController:vc animated:YES];
    
    
}


@end

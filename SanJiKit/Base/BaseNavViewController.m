//
//  BaseNavViewController.m
//  SanJiKit
//
//  Created by ioskaifa on 2017/3/20.
//  Copyright © 2017年 ioskaifa. All rights reserved.
//

#import "BaseNavViewController.h"

@interface BaseNavViewController ()

@end

@implementation BaseNavViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
     self.navigationBar.backgroundColor = [UIColor clearColor];
    
    
    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"未标题-1"] forBarMetrics:UIBarMetricsDefault];
    
 
    
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    if (self.viewControllers.count >0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
    
}

- (void)backAction:(UIButton *)sender{
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

-(UIStatusBarStyle)preferredStatusBarStyle

{
    
    return UIStatusBarStyleLightContent; //默认的值是黑色的
    
}

- (BOOL)prefersStatusBarHidden

{
    
    return NO; // 是否隐藏状态栏
    
}

@end

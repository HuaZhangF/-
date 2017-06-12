//
//  BaseTabViewController.m
//  SanJiKit
//
//  Created by ioskaifa on 2017/3/20.
//  Copyright © 2017年 ioskaifa. All rights reserved.
//

#import "BaseTabViewController.h"
#import "BaseNavViewController.h"
#import "FirstViewController.h"
#import "SencondViewController.h"
#import "ThirdViewController.h"
#import "FourthViewController.h"
#import "FifthViewController.h"

@interface BaseTabViewController ()
@property (nonatomic, strong) UIButton *selected;

@end

@implementation BaseTabViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    [self _creatStoryBoard];
    
    [self _init];
    
    // Do any additional setup after loading the view.
}

- (void)_init{
    
    [self removeTabbar];
    
    self.tabBar.tintColor = [UIColor whiteColor];
    
    self.tabBar.translucent = YES;
    
    CGFloat width = KSW/5.0;
    
    NSArray *arr = @[@"第一",@"第二",@"第三",@"第四",@"第五"];
    NSArray *imgs = @[@"menu-home",@"menu-shopping",@"menu-order",@"menu-my",@"menu-my"];
    NSArray *selectedImgs = @[@"menu-home-nor",@"menu-shopping-sel",@"menu-order-sel",@"menu-my-sel",@"menu-my-sel"];
    for (int i = 0; i < 5; i ++) {
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(i * width,2 , width, 45);
        button.tag = 2016 + i;
        [button setImage:[UIImage imageNamed:imgs[i]] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:selectedImgs[i]] forState:UIControlStateDisabled];
        button.titleLabel.font = [UIFont systemFontOfSize:10];
        button.titleLabel.textAlignment = NSTextAlignmentCenter;//设置title的字体居中
        
        button.imageEdgeInsets = UIEdgeInsetsMake(3, (width-24)/2, 18, (width-24)/2);
        button.titleEdgeInsets = UIEdgeInsetsMake(25, (width-24)/2 - 40/375.0*KSW, 0, 10);//
        [button setTitle:arr[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor colorWithRed:0 green:183.0/255 blue:251.0/255 alpha:1] forState:UIControlStateDisabled];
        button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        button.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.tabBar addSubview:button];
        
        
        if (i == 0) {
            button.enabled = NO;
            self.selected = button;
        }
    }
}

- (void)buttonAction:(UIButton *)bt{
    
    if (bt == self.selected) {
        return;
    }
    
    self.selected.enabled = YES;
    bt.enabled = NO;
    self.selected = bt;
    self.selectedIndex =  bt.tag -2016;
}

- (void)_creatStoryBoard{
    
    FirstViewController *firstVC = [[FirstViewController alloc] init];
    SencondViewController *secondVC = [[SencondViewController alloc] init];
    ThirdViewController *thirdVC = [[ThirdViewController alloc] init];
    FourthViewController *fourVC = [[FourthViewController alloc] init];
    FifthViewController *fifVC = [[FifthViewController alloc] init];
    
    BaseNavViewController *firstNav = [[BaseNavViewController alloc] initWithRootViewController:firstVC];
    BaseNavViewController *secondNav = [[BaseNavViewController alloc] initWithRootViewController:secondVC];
    BaseNavViewController *thirdNav = [[BaseNavViewController alloc] initWithRootViewController:thirdVC];
    BaseNavViewController *fourNav = [[BaseNavViewController alloc] initWithRootViewController:fourVC];
    BaseNavViewController *fifNav = [[BaseNavViewController alloc] initWithRootViewController:fifVC];
    
    self.viewControllers = @[firstNav,secondNav,thirdNav,fourNav,fifNav];
}


//移除系统的
- (void)removeTabbar{
    
    for (UIView *view in self.tabBar.subviews) {
        
        if ([view isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            
            [view removeFromSuperview];
        }
    }
    
}



@end

//
//  TabBarViewController.m
//  YFTabBarController
//
//  Created by mashun on 15/8/26.
//  Copyright (c) 2015年 developer. All rights reserved.
//

#import "TabBarViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"

#define SCREEN_SIZE [UIScreen mainScreen].bounds.size

@interface TabBarViewController ()

@end

@implementation TabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    FirstViewController *firstVC = [[FirstViewController alloc] init];
    UINavigationController *firstNC = [[UINavigationController alloc] initWithRootViewController:firstVC];
    firstVC.navigationItem.title = @"first";
    
    SecondViewController *secondVC = [[SecondViewController alloc] init];
    UINavigationController *secondNC = [[UINavigationController alloc] initWithRootViewController:secondVC];
    secondVC.navigationItem.title = @"second";
    
    ThirdViewController *thirdVC = [[ThirdViewController alloc] init];
    UINavigationController *thirdNC = [[UINavigationController alloc] initWithRootViewController:thirdVC];
    thirdVC.navigationItem.title = @"third";
    
    self.viewControllers = @[firstNC, secondNC, thirdNC];
    
    //在系统的Tabbar上添加UIImageView控件
    UIImageView *barImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 49)];
    barImageView.backgroundColor = [UIColor whiteColor];
    barImageView.userInteractionEnabled = YES;
    [self.tabBar addSubview:barImageView];
    
    NSArray *colorArray = @[[UIColor redColor], [UIColor orangeColor], [UIColor yellowColor]];
    for (int i = 0; i < self.viewControllers.count; i++) {
        UIButton *tabbarButton = [UIButton buttonWithType:UIButtonTypeCustom];
        tabbarButton.frame = CGRectMake((SCREEN_SIZE.width / self.viewControllers.count) * i, 0, SCREEN_SIZE.width / 3., 49);
        tabbarButton.tag = 2015 + i;
        [tabbarButton addTarget:self action:@selector(clickTabBarButton:) forControlEvents:UIControlEventTouchUpInside];
        tabbarButton.backgroundColor = colorArray[i];
        [barImageView addSubview:tabbarButton];
    }
    [self.tabBar setBackgroundImage:[self imageWithColor:[UIColor clearColor] andSize:self.tabBar.frame.size]];
    [self.tabBar setShadowImage:[self imageWithColor:[UIColor clearColor] andSize:self.tabBar.frame.size]];
    self.selectedViewController = firstNC;
}

#pragma mark - 根据颜色和大小得到一张图片
- (UIImage *)imageWithColor:(UIColor *)color andSize:(CGSize)size
{
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

- (void)clickTabBarButton:(UIButton *)sender {
    self.selectedViewController = [self.viewControllers objectAtIndex:sender.tag - 2015];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

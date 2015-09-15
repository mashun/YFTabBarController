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
#import "YFButton.h"

#define SCREEN_SIZE [UIScreen mainScreen].bounds.size

@interface TabBarViewController () <YFButtonDelegate>

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
    
    [self createTabbarButton];
    
    self.selectedViewController = firstNC;
}

- (void)createTabbarButton {
    //在系统的Tabbar上添加UIImageView控件
    UIImageView *barImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 49)];
    barImageView.backgroundColor = [UIColor whiteColor];
    barImageView.userInteractionEnabled = YES;
    [self.tabBar addSubview:barImageView];
    
    NSArray *colorArray = @[[UIColor redColor], [UIColor orangeColor], [UIColor yellowColor]];
    
    for (int i = 0; i < self.viewControllers.count; i++) {
        //只需要添加正常状态的image和select状态的image,就可以;这里用backgroundColor代替
        YFButton *tabbarButton = [YFButton buttonWithFrame:CGRectMake((SCREEN_SIZE.width / self.viewControllers.count) * i, 0, SCREEN_SIZE.width / 3., 49) withIndex:i withSelectedImage:nil andNormalImage:nil];
        tabbarButton.backgroundColor = colorArray[i];
        tabbarButton.delegate = self;
        if (i == 0) {
            tabbarButton.choiceType = YFChoiceButtonStatusTypeSelected;
        }
        [barImageView addSubview:tabbarButton];
    }
    [self.tabBar setBackgroundImage:[self imageWithColor:[UIColor clearColor] andSize:self.tabBar.frame.size]];
    [self.tabBar setShadowImage:[self imageWithColor:[UIColor clearColor] andSize:self.tabBar.frame.size]];
}


#pragma mark - YFButtonDelegate
- (void)YFChoiceButtonSelectedIndex:(NSUInteger)index {
    self.selectedViewController = self.viewControllers[index];
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

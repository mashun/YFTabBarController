//
//  FirstViewController.m
//  YFTabBarController
//
//  Created by mashun on 15/8/26.
//  Copyright (c) 2015年 developer. All rights reserved.
//

#import "FirstViewController.h"
#import "YFTextView.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor purpleColor];
    self.automaticallyAdjustsScrollViewInsets = NO;//这个属性真的很蛋疼
    
    YFTextView *yfTextView = [[YFTextView alloc] initWithFrame:CGRectMake(30, 100, [UIScreen mainScreen].bounds.size.width - 60, 150)];
    yfTextView.strCount = 100;
    yfTextView.placeHolderLabel.text = @"请输入内容";
    [self.view addSubview:yfTextView];
}


//点击空白区域收回键盘
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
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

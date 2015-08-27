//
//  FirstViewController.m
//  YFTabBarController
//
//  Created by mashun on 15/8/26.
//  Copyright (c) 2015年 developer. All rights reserved.
//

#import "FirstViewController.h"
#import "YFTextView.h"

static BOOL isStretch = YES;

@interface FirstViewController ()
{
    NSString *_detailStr;
    UILabel  *_detailLabel;
}
@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;//这个属性真的很蛋疼
    
    //自定义textview
    YFTextView *yfTextView = [[YFTextView alloc] initWithFrame:CGRectMake(30, 100, [UIScreen mainScreen].bounds.size.width - 60, 150)];
    yfTextView.strCount = 100;
    yfTextView.placeHolderLabel.text = @"请输入内容";
    [self.view addSubview:yfTextView];
    
    
    _detailStr = @"NIHAONSKCKSNCJKASNCKSACKSACNSCNIHAONSKCKSNCJKASNCKSACKSACNSCNIHAONSKCKSNCJKASNCKSACKSACNSCNIHAONSKCKSNCJKASNCKSACKSACNSCNIHAONSKCKSNCJKASNCKSACKSACNSCNIHAONSKCKSNCJKASNCKSACKSACNSCNIHAONSKCKSNCJKASNCKSACKSACNSCNIHAONSKCKSNCJKASNCKSACKSACNSCNIHAONSKCKSNCJKASNCKSACKSACNSC";
    //长度可折叠的Label
    _detailLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 300, [UIScreen mainScreen].bounds.size.width - 60, 70)];
    _detailLabel.font = [UIFont systemFontOfSize:14.];
    _detailLabel.numberOfLines = 0;
    _detailLabel.userInteractionEnabled = YES;
    _detailLabel.backgroundColor = [UIColor yellowColor];
    _detailLabel.text = _detailStr;
    [_detailLabel addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(strecthTap:)]];
    [self.view addSubview:_detailLabel];
}

- (void)strecthTap:(UITapGestureRecognizer *)tap {
    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:14.], NSFontAttributeName, nil];
    CGSize size = [_detailStr boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width - 60, 0) options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size;
    if (size.height > 70) {
        _detailLabel.frame = CGRectMake(_detailLabel.frame.origin.x, _detailLabel.frame.origin.y, _detailLabel.frame.size.width, isStretch ? size.height : 70);
        isStretch = !isStretch;
    }
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

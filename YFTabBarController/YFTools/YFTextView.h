//
//  YFTextView.h
//  YFTabBarController
//
//  Created by mashun on 15/8/27.
//  Copyright (c) 2015年 developer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YFTextView : UIView <UITextViewDelegate>
//不需要在外面改变,所以把他写为类别
{
    UITextView *_textView;
    UILabel    *_countLabel;
}

//需要在外面改变的写为属性
@property (nonatomic, strong) UILabel   *placeHolderLabel;
@property (nonatomic, assign) NSInteger  strCount;

@end

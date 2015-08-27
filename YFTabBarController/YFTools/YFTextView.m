//
//  YFTextView.m
//  YFTabBarController
//
//  Created by mashun on 15/8/27.
//  Copyright (c) 2015年 developer. All rights reserved.
//

#import "YFTextView.h"

@implementation YFTextView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _textView = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        _textView.delegate = self;
        _textView.backgroundColor = [UIColor grayColor];
        [self addSubview:_textView];
        
        self.placeHolderLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 5, frame.size.width, 20)];
        _placeHolderLabel.backgroundColor = [UIColor clearColor];
        _placeHolderLabel.font = [UIFont systemFontOfSize:14.];
        [self addSubview:_placeHolderLabel];
        
        _countLabel = [[UILabel alloc] initWithFrame:CGRectMake(frame.size.width - 100, frame.size.height - 20, 100, 20)];
        _countLabel.textAlignment = NSTextAlignmentRight;
        _countLabel.backgroundColor = [UIColor clearColor];
        [_textView addSubview:_countLabel];
    }
    return self;
}

//重写strCount的set方法,可以在外面给strcount赋值的时候,来改变countLablel的text
- (void)setStrCount:(NSInteger)strCount {
    _strCount = strCount;//这一步是必须的
    _countLabel.text = [NSString stringWithFormat:@"%ld", (long)strCount];
}

//这是UITextView的代理,用的多了就可以啦
#pragma mark - UITextViewDelegate
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    NSString *new = [textView.text stringByReplacingCharactersInRange:range withString:text];
    NSInteger res = self.strCount - [new length];
    if ([new length] != 0) {
        _placeHolderLabel.hidden = YES;
    }else {
        _placeHolderLabel.hidden = NO;
    }
    if (res >= 0) {
        _countLabel.text = [NSString stringWithFormat:@"%ld", (long)res];
        return YES;
    }else {
        return NO;
    }
}

//实现,超出设定字数的时候,不能在输入
- (void)textViewDidChange:(UITextView *)textView {
    if (textView.text.length > self.strCount) {
        textView.text = [textView.text substringToIndex:self.strCount];
    }
}

//实现,使用系统键盘输入的时候,改变_countLabel的text;不实现这个方法,用系统键盘进行输入的时候,会出现_placeHolderLabel隐藏不掉的bug
- (void)textViewDidChangeSelection:(UITextView *)textView
{
    if ([textView.text length] == 0) {
        _placeHolderLabel.hidden = NO;
    }else {
        _placeHolderLabel.hidden = YES;
    }
    NSInteger res = self.strCount - [textView.text length];
    _countLabel.text = [NSString stringWithFormat:@"%ld", (long)res];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

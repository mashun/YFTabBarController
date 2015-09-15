//
//  YFButton.h
//  YFTabBarController
//
//  Created by mashun on 15/8/26.
//  Copyright (c) 2015年 developer. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    YFChoiceButtonStatusTypeUnselected,
    YFChoiceButtonStatusTypeSelected
} YFChoiceButtonStausType;

@protocol YFButtonDelegate <NSObject>

- (void)YFChoiceButtonSelectedIndex:(NSUInteger)index;

@end
@interface YFButton : UIButton

@property (nonatomic, assign) int index;
@property (nonatomic, assign) id<YFButtonDelegate>delegate;
@property (nonatomic, assign) YFChoiceButtonStausType choiceType;

+ (id)buttonWithFrame:(CGRect)frame
            withIndex:(int)index
    withSelectedImage:(UIImage*)selectedImage
       andNormalImage:(UIImage*)normalImage;

@end

//
//  UIBarButtonItem+ZJExtension.m
//  ZJWeibo
//
//  Created by dibadalu on 15/10/19.
//  Copyright (c) 2015年 dibadalu. All rights reserved.
//

#import "UIBarButtonItem+ZJExtension.h"
#import "UIView+ZJExtension.h"


@implementation UIBarButtonItem (ZJExtension)

+ (UIBarButtonItem *)itemWithImage:(NSString *)image highImage:(NSString *)highImage target:(id)target action:(SEL)action
{
    UIButton *button = [[UIButton alloc] init];
    //设置图片
    [button setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
    //设置大小
    button.size = button.currentImage.size;
    //监听事件
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
//    button.backgroundColor = [UIColor redColor];
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}


+ (UIBarButtonItem *)itemWithImage:(NSString *)image disabledImage:(NSString *)disabledImage target:(id)target action:(SEL)action
{
    UIButton *button = [[UIButton alloc] init];
    [button setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:disabledImage] forState:UIControlStateDisabled];
    button.size = button.currentBackgroundImage.size;
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}

@end

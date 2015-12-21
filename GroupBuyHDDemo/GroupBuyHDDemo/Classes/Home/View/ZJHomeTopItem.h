//
//  ZJHomeTopItem.h
//  GroupBuyHDDemo
//
//  Created by 陈泽嘉 on 15/12/21.
//  Copyright (c) 2015年 dibadalu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZJHomeTopItem : UIView
/**
 *  创建自定义item
 */
+ (instancetype)item;

/**
 *  设置点击的监听器
 *
 *  @param target 监听器
 *  @param action 监听方法
 */
- (void)addTarget:(id)target action:(SEL)action;

@end

//
//  ZJHomeDropDown.h
//  GroupBuyHDDemo
//
//  Created by 陈泽嘉 on 15/12/21.
//  Copyright (c) 2015年 dibadalu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZJHomeDropDown : UIView

+ (instancetype)dropDown;

/** 分类数据 */
@property(nonatomic,strong) NSArray *categories;

@end

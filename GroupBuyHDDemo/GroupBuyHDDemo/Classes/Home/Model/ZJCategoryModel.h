//
//  ZJCategoryModel.h
//  GroupBuyHDDemo
//
//  Created by 陈泽嘉 on 15/12/21.
//  Copyright (c) 2015年 dibadalu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZJCategoryModel : NSObject
/** 分类的名称 */
@property(nonatomic,copy) NSString *name;
/** 子分类：存放的是字符串 */
@property(nonatomic,strong) NSArray *subcategories;
/** 显示在分类上的图标 */
@property(nonatomic,copy) NSString *small_highlighted_icon;
@property(nonatomic,copy) NSString *small_icon;
/** 显示在导航栏上的图标 */
@property(nonatomic,copy) NSString *highlighted_icon;
@property(nonatomic,copy) NSString *icon;
/** 显示在地图上的图标 */
@property(nonatomic,copy) NSString *map_icon;

@end

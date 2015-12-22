//
//  ZJCityModel.h
//  GroupBuyHDDemo
//
//  Created by 陈泽嘉 on 15/12/22.
//  Copyright (c) 2015年 dibadalu. All rights reserved.
//  城市模型

#import <Foundation/Foundation.h>

@interface ZJCityModel : NSObject

/** 城市名称 */
@property(nonatomic,copy) NSString *name;
/** 城市名称拼音 */
@property(nonatomic,copy) NSString *pinYin;
/** 城市名称拼音声母 */
@property(nonatomic,copy) NSString *pinYinHead;
/** 城市区域列表（数组） */
@property(nonatomic,strong) NSArray *regions;
@end

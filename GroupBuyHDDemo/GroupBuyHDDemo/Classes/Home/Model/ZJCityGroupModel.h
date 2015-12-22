//
//  ZJCityGroupModel.h
//  GroupBuyHDDemo
//
//  Created by 陈泽嘉 on 15/12/22.
//  Copyright (c) 2015年 dibadalu. All rights reserved.
//  城市列表模型

#import <Foundation/Foundation.h>

@interface ZJCityGroupModel : NSObject

/** 这组的名称 */
@property(nonatomic,copy) NSString *title;
/** 这组的城市列表 */
@property(nonatomic,strong) NSArray *cities;

@end

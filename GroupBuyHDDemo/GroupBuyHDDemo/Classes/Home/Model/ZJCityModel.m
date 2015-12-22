//
//  ZJCityModel.m
//  GroupBuyHDDemo
//
//  Created by 陈泽嘉 on 15/12/22.
//  Copyright (c) 2015年 dibadalu. All rights reserved.
//

#import "ZJCityModel.h"
#import "ZJRegionModel.h"
#import "MJExtension.h"

@implementation ZJCityModel

+ (NSDictionary *)mj_objectClassInArray{
    
    return @{@"regions" : [ZJRegionModel class]};
}

@end

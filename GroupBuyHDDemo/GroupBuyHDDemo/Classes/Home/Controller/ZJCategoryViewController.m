//
//  ZJCategoryViewController.m
//  GroupBuyHDDemo
//
//  Created by 陈泽嘉 on 15/12/21.
//  Copyright (c) 2015年 dibadalu. All rights reserved.
//

/*
 ipad中控制器的view的尺寸默认是1024*768，ZJHomeDropDown的尺寸具体看nib文件
 为了让显示在popover中的控制器view与ZJHomeDropDown保持一致，需要
 self.preferredContentSize = dropDown.size;
 */

#import "ZJCategoryViewController.h"
#import "ZJHomeDropDown.h"
#import "ZJCategoryModel.h"
#import "MJExtension.h"
#import "UIView+ZJExtension.h"

@interface ZJCategoryViewController ()

@end

@implementation ZJCategoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //加载分类数据
    NSArray *categories = [ZJCategoryModel mj_objectArrayWithFilename:@"categories.plist"];
    //设置dropDown菜单
    ZJHomeDropDown *dropDown = [ZJHomeDropDown dropDown];
    dropDown.categories = categories;//将分类数据传给dropDown
    [self.view addSubview:dropDown];
    
    //设置控制器的view在popover中的尺寸
    self.preferredContentSize = dropDown.size;

}



@end

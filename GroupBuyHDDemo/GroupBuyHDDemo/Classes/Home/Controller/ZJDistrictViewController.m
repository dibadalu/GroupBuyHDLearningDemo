//
//  ZJCityViewController.m
//  GroupBuyHDDemo
//
//  Created by 陈泽嘉 on 15/12/22.
//  Copyright (c) 2015年 dibadalu. All rights reserved.
//

#import "ZJDistrictViewController.h"
#import "ZJHomeDropDown.h"
#import "UIView+ZJExtension.h"
#import "ZJCityViewController.h"

@interface ZJDistrictViewController ()

/** 切换城市 */
- (IBAction)swithCityClick:(id)sender;


@end

@implementation ZJDistrictViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //取出标题view
    UIView *title = [self.view.subviews firstObject];
    ZJHomeDropDown *dropDown = [ZJHomeDropDown dropDown];
    [self.view addSubview:dropDown];
    dropDown.y = title.height;
    //设置控制器的view在popover中的尺寸
    self.preferredContentSize = CGSizeMake(dropDown.width, CGRectGetMaxY(dropDown.frame));

}



- (IBAction)swithCityClick:(id)sender {
    
    //以modal弹出城市控制器
    ZJCityViewController *cityVc = [[ZJCityViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:cityVc];
    nav.modalPresentationStyle = UIModalPresentationFormSheet;
    [self presentViewController:nav animated:YES completion:nil];
    
}
@end

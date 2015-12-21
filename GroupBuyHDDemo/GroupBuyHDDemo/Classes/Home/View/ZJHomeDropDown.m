//
//  ZJHomeDropDown.m
//  GroupBuyHDDemo
//
//  Created by 陈泽嘉 on 15/12/21.
//  Copyright (c) 2015年 dibadalu. All rights reserved.
//
/*
  数据源方法cellForRowAtIndexPath没法调用的原因：view没尺寸
  解决方案：该view不要更随父控件的尺寸变化而伸缩
        self.autoresizingMask = UIViewAutoresizingNone;
 */

#import "ZJHomeDropDown.h"
#import "ZJCategoryModel.h"
#import "ZJConst.h"

@interface ZJHomeDropDown ()<UITableViewDataSource,UISearchBarDelegate>

/** 主表 */
@property (weak, nonatomic) IBOutlet UITableView *mainTableView;

@end

@implementation ZJHomeDropDown


+ (instancetype)dropDown{
    
    return [[[NSBundle mainBundle] loadNibNamed:@"ZJHomeDropDown" owner:nil options:nil] firstObject];
    
}

- (void)awakeFromNib{
#warning 不要更随父控件的尺寸变化而伸缩
    self.autoresizingMask = UIViewAutoresizingNone;
}

- (void)setCategories:(NSArray *)categories{
    //将分类数据存起来
    _categories = categories;
}

#pragma mark - tableView数据源
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//    ZJLog(@"numberOfRowsInSection---%d---%@",self.categories.count,NSStringFromCGRect(self.frame));
    return self.categories.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    ZJLog(@"cellForRowAtIndexPath");
    static NSString *ID = @"MainCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    
    ZJCategoryModel *category = self.categories[indexPath.row];//取出category模型
    cell.textLabel.text = category.name;
    cell.imageView.image = [UIImage imageNamed:category.small_icon];
    if (category.subcategories.count) {//如果有子分类
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }else{
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    

    return cell;
}

#pragma mark - tableView代理方法


@end

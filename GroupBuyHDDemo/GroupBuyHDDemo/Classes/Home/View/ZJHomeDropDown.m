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
#import "ZJHomeDropDownMainCell.h"
#import "ZJHomeDropDownSubCell.h"

@interface ZJHomeDropDown ()<UITableViewDataSource,UITableViewDelegate>

/** 主表 */
@property (weak, nonatomic) IBOutlet UITableView *mainTableView;
/** 从表 */
@property (weak, nonatomic) IBOutlet UITableView *subTableView;

/** 被选中的category模型 */
@property(nonatomic,strong) ZJCategoryModel *selectedCategory;

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

    if (tableView == self.mainTableView) {//主表
        return self.categories.count;
    }else{//有子分类
        return self.selectedCategory.subcategories.count;
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;
    if (tableView == self.mainTableView) {//主表
        //创建cell
        cell = [ZJHomeDropDownMainCell dropDownMainCellWithTableView:tableView];
        
        ZJCategoryModel *category = self.categories[indexPath.row];//取出category模型
        cell.textLabel.text = category.name;
        cell.imageView.image = [UIImage imageNamed:category.small_icon];
        if (category.subcategories.count) {//如果有子分类
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }else{
            cell.accessoryType = UITableViewCellAccessoryNone;
        }
        
    }else{//从表
        
        cell = [ZJHomeDropDownSubCell dropDownSubCellWithTableView:tableView];
        
        cell.textLabel.text = self.selectedCategory.subcategories[indexPath.row];
    }
    
    return cell;
}

#pragma mark - tableView代理方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (tableView == self.mainTableView) {//主表
        //取出模型
        ZJCategoryModel *category = self.categories[indexPath.row];
        //将模型存进selectedCategory，供数据源方法调用
        self.selectedCategory = category;
        
        //刷新从表中的数据
        [self.subTableView reloadData];
    }
    
}



@end

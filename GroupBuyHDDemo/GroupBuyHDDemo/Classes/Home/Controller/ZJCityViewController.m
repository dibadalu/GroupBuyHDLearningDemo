//
//  ZJCityViewController.m
//  GroupBuyHDDemo
//
//  Created by 陈泽嘉 on 15/12/22.
//  Copyright (c) 2015年 dibadalu. All rights reserved.
//

#import "ZJCityViewController.h"
#import "UIBarButtonItem+ZJExtension.h"
#import "ZJCityGroupModel.h"
#import "MJExtension.h"
#import "Masonry.h"

/** 遮盖的tag */
const int ZJCoverTag  = 999;

@interface ZJCityViewController ()<UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate>
/** 城市列表总数组 */
@property(nonatomic,strong) NSArray *cityGroups;

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

@end

@implementation ZJCityViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //设置导航栏内容
    self.title = @"城市选择";
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"btn_navigation_close" highImage:@"btn_navigation_close_hl" target:self action:@selector(close)];
    
    //加载城市数据（从plist文件）字典转模型
    self.cityGroups = [ZJCityGroupModel mj_objectArrayWithFilename:@"cityGroups.plist"];
    
    
    self.tableView.sectionIndexColor = [UIColor blackColor];
}

- (void)close{
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - 顶部搜索框代理
/**
 *  弹出键盘：搜索框开始编辑文字
 *
 *  @param searchBar 搜索框
 */
- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar{

    //1.隐藏导航栏
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    
    //2.添加遮盖
    UIView *cover = [[UIView alloc] init];
    cover.backgroundColor = [UIColor blackColor];
    cover.alpha = 0.5;
    cover.tag = ZJCoverTag;
    [self.view addSubview:cover];
    //添加autolayout的约束
    [cover mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.tableView).with.insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    
    //3.改变搜索框的背景为绿色
    [self.searchBar setBackgroundImage:[UIImage imageNamed:@"bg_login_textfield_hl"]];
    

}
/**
 *  隐藏键盘：搜索框结束编辑文字
 *
 *  @param searchBar 搜索框
 */
- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar{
    
    //1.隐藏导航栏
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    
    //2.移除遮盖
    [[self.view viewWithTag:ZJCoverTag] removeFromSuperview];
    
    //3.改变搜索框的背景为正常颜色
    [self.searchBar setBackgroundImage:[UIImage imageNamed:@"bg_login_textfield"]];
}

#pragma mark - tableView数据源
#pragma mark - 多少组
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return self.cityGroups.count;
}
#pragma mark - 每组有多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    //取出城市列表模型
    ZJCityGroupModel *cityGroup = self.cityGroups[section];
    return cityGroup.cities.count;
}
#pragma mark - cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"CityGroupCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    //取出城市列表模型
    ZJCityGroupModel *cityGroup = self.cityGroups[indexPath.section];
    cell.textLabel.text = cityGroup.cities[indexPath.row];

    return cell;
}

#pragma mark - tableView代理方法
#pragma mark - 每组的组名
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    //取出城市列表模型
    ZJCityGroupModel *cityGroup = self.cityGroups[section];
    return cityGroup.title;
    
}

#pragma mark - 组名索引
- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    
    //方法1 ：用遍历的方法
//    NSMutableArray *titles = [NSMutableArray array];
//    for (ZJCityGroupModel *cityGroup in self.cityGroups) {
//        [titles addObject:cityGroup.title];
//    }
//    return titles;

    //方法2：KVC
    return [self.cityGroups valueForKeyPath:@"title"];
    
}

@end

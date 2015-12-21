//
//  ZJHomeViewController.m
//  GroupBuyHDDemo
//
//  Created by 陈泽嘉 on 15/12/21.
//  Copyright (c) 2015年 dibadalu. All rights reserved.
//

/*
 reason: 'UICollectionView must be initialized with a non-nil layout parameter'
 collectiView必须初始化layout布局方式
 */


#import "ZJHomeViewController.h"
#import "ZJConst.h"
#import "UIBarButtonItem+ZJExtension.h"
#import "UIView+ZJExtension.h"
#import "ZJHomeTopItem.h"
#import "ZJCategoryViewController.h"

@interface ZJHomeViewController ()

@property(nonatomic,weak) UIBarButtonItem *categoryItem;
@property(nonatomic,weak) UIBarButtonItem *districtItem;
@property(nonatomic,weak) UIBarButtonItem *sortItem;

@end

@implementation ZJHomeViewController

static NSString * const reuseIdentifier = @"Cell";

- (instancetype)init{

    //流水线布局
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    return [self initWithCollectionViewLayout:layout];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    //self.view == self.tableView
    //self.view == self.collectionView.superView
    //设置全局背景色
    self.collectionView.backgroundColor = ZJGlobalBgColor;
    
    // Register cell classes
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    //设置导航栏内容
    [self setupLeftNav];
    [self setupRightNav];

}

#pragma mark - 设置导航栏内容
- (void)setupLeftNav{
    
    UIBarButtonItem *logoItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"icon_meituan_logo"] style:UIBarButtonItemStylePlain target:nil action:nil];
    
    ZJHomeTopItem *categoryTopItem = [ZJHomeTopItem item];
    [categoryTopItem addTarget:self action:@selector(categoryItemClick)];
    UIBarButtonItem *categoryItem = [[UIBarButtonItem alloc] initWithCustomView:categoryTopItem];
    self.categoryItem = categoryItem;
    
    ZJHomeTopItem *districtTopItem = [ZJHomeTopItem item];
    [districtTopItem addTarget:self action:@selector(districtItemClick)];
    UIBarButtonItem *districtItem = [[UIBarButtonItem alloc] initWithCustomView:districtTopItem];
    self.districtItem = districtItem;
    
    ZJHomeTopItem *sortTopItem = [ZJHomeTopItem item];
    [sortTopItem addTarget:self action:@selector(sortItemClick)];
    UIBarButtonItem *sortItem = [[UIBarButtonItem alloc] initWithCustomView:sortTopItem];
    self.sortItem = sortItem;
    
    self.navigationItem.leftBarButtonItems = @[logoItem,categoryItem,districtItem,sortItem];
}

- (void)setupRightNav{
    
    //map与search的间隔可以通过设置item的customView宽度来改变
    UIBarButtonItem *mapItem = [UIBarButtonItem itemWithImage:@"icon_map" highImage:@"icon_map_highlighted" target:nil action:nil];
    mapItem.customView.width = 60;
    UIBarButtonItem *searchItem = [UIBarButtonItem itemWithImage:@"icon_search" highImage:@"icon_search_highlighted" target:nil action:nil];
    searchItem.customView.width = 60;
    self.navigationItem.rightBarButtonItems = @[mapItem,searchItem];
}

#pragma mark - 顶部item的点击方法
- (void)categoryItemClick{
    
//    ZJLog(@"categoryItemClick");
    //显示popover菜单
    UIPopoverController *popover = [[UIPopoverController alloc] initWithContentViewController:[[ZJCategoryViewController alloc] init]];
    [popover presentPopoverFromBarButtonItem:self.categoryItem permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    
}
- (void)districtItemClick{
    
    ZJLog(@"districtItemClick");
}
- (void)sortItemClick{
    
    ZJLog(@"sortItemClick");
}

#pragma mark <UICollectionViewDataSource>
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
#warning Incomplete method implementation -- Return the number of sections
    return 0;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
#warning Incomplete method implementation -- Return the number of items in the section
    return 0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    // Configure the cell
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>
/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end

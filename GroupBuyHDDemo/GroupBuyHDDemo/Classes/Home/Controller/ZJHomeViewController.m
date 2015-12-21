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

@interface ZJHomeViewController ()

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
    
    UIBarButtonItem *logo = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"icon_meituan_logo"] style:UIBarButtonItemStylePlain target:nil action:nil];
    
    ZJHomeTopItem *categoryItem = [ZJHomeTopItem item];
    UIBarButtonItem *category = [[UIBarButtonItem alloc] initWithCustomView:categoryItem];
    
    ZJHomeTopItem *districtItem = [ZJHomeTopItem item];
    UIBarButtonItem *district = [[UIBarButtonItem alloc] initWithCustomView:districtItem];
    
    ZJHomeTopItem *sortItem = [ZJHomeTopItem item];
    UIBarButtonItem *sort = [[UIBarButtonItem alloc] initWithCustomView:sortItem];
    
    self.navigationItem.leftBarButtonItems = @[logo,category,district,sort];
}

- (void)setupRightNav{
    
    //map与search的间隔可以通过设置item的customView宽度来改变
    UIBarButtonItem *map = [UIBarButtonItem itemWithImage:@"icon_map" highImage:@"icon_map_highlighted" target:nil action:nil];
    map.customView.width = 60;
    UIBarButtonItem *search = [UIBarButtonItem itemWithImage:@"icon_search" highImage:@"icon_search_highlighted" target:nil action:nil];
    search.customView.width = 60;
    self.navigationItem.rightBarButtonItems = @[map,search];
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

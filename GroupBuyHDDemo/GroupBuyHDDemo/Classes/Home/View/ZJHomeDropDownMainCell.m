//
//  ZJHomeDropDownMainCell.m
//  GroupBuyHDDemo
//
//  Created by 陈泽嘉 on 15/12/22.
//  Copyright (c) 2015年 dibadalu. All rights reserved.
//

#import "ZJHomeDropDownMainCell.h"

@implementation ZJHomeDropDownMainCell

+ (instancetype)dropDownMainCellWithTableView:(UITableView *)tableView{
    
    static NSString *ID = @"MainCell";
    ZJHomeDropDownMainCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[ZJHomeDropDownMainCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
        
    }
    
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg_dropdown_rightpart"] highlightedImage:[UIImage imageNamed:@"bg_dropdown_right_selected"]];
        
    }
    return self;
}
@end

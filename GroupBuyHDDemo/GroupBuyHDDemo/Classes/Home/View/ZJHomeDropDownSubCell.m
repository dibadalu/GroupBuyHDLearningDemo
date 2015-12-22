//
//  ZJHomeDropDownSubCell.m
//  GroupBuyHDDemo
//
//  Created by 陈泽嘉 on 15/12/22.
//  Copyright (c) 2015年 dibadalu. All rights reserved.
//

#import "ZJHomeDropDownSubCell.h"

@implementation ZJHomeDropDownSubCell

+ (instancetype)dropDownSubCellWithTableView:(UITableView *)tableView{
    
    static NSString *ID = @"SubCell";
    ZJHomeDropDownSubCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[ZJHomeDropDownSubCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
        
    }
    
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg_dropdown_leftpart"] highlightedImage:[UIImage imageNamed:@"bg_dropdown_left_selected"]];
        
    }
    return self;
}

@end

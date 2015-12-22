//
//  ZJHomeTopItem.m
//  GroupBuyHDDemo
//
//  Created by 陈泽嘉 on 15/12/21.
//  Copyright (c) 2015年 dibadalu. All rights reserved.
//

#import "ZJHomeTopItem.h"

@interface ZJHomeTopItem ()

@property (weak, nonatomic) IBOutlet UIButton *iconButton;


@end

@implementation ZJHomeTopItem

+ (instancetype)item{
    
    return [[[NSBundle mainBundle] loadNibNamed:@"ZJHomeTopItem" owner:nil options:nil] firstObject];
    
}

- (void)awakeFromNib{
#warning 在nib文件中使用了autolayout后要self.autoresizingMask = UIViewAutoresizingNone;
    self.autoresizingMask = UIViewAutoresizingNone;
}

- (void)addTarget:(id)target action:(SEL)action{

    [self.iconButton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
}

@end

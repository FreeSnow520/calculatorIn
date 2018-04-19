//
//  ERPTableViewCell.h
//  qdjdbayi
//
//  Created by 200000549@qq.com on 16/8/15.
//  Copyright © 2016年 200000549@qq.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol deleteBtnClicked <NSObject>

- (void)deleteBtn:(UITableViewCell *)cell;

@end

@interface ERPTableViewCell : UITableViewCell
@property (nonatomic, copy) UILabel *label1;
@property (nonatomic, copy) UILabel *label2;
@property (nonatomic, copy) UILabel *label3;
@property (nonatomic, copy) UILabel *label4;
@property (nonatomic, copy) UIButton *btn1;

@property (nonatomic, weak) id<deleteBtnClicked>delegate;
@end

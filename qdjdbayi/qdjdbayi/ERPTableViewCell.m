//
//  ERPTableViewCell.m
//  qdjdbayi
//
//  Created by 200000549@qq.com on 16/8/15.
//  Copyright © 2016年 200000549@qq.com. All rights reserved.
//

#import "ERPTableViewCell.h"
#import "My.h"
@implementation ERPTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [self.contentView addSubview:self.label1];
    [self.contentView addSubview:self.label2];
    [self.contentView addSubview:self.label3];
    [self.contentView addSubview:self.label4];
    [self.contentView addSubview:self.btn1];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (UILabel *)label1{
    if (_label1 == nil) {
        _label1 = [[UILabel alloc]initWithFrame:CGRectMake(kWidth1*50, 0, kWidth1*270, kWidth1*60)];
        _label1.numberOfLines = 0;
        _label1.textAlignment = NSTextAlignmentLeft;

    }
    return _label1;
}

- (UILabel *)label2{
    if (_label2 == nil) {
        _label2 = [[UILabel alloc]initWithFrame:CGRectMake(kWidth1*280, 0, kWidth1*270, kWidth1*60)];
        _label2.numberOfLines = 0;
        _label2.textAlignment = NSTextAlignmentLeft;
    }
    return _label2;
}

- (UILabel *)label3{
    if (_label3 == nil) {
        _label3 = [[UILabel alloc]initWithFrame:CGRectMake(kWidth1*50,kWidth1* 60, kWidth1*270, kWidth1*60)];
        _label3.numberOfLines = 0;
        _label3.textAlignment = NSTextAlignmentLeft;
        
    }
    return _label3;
}

- (UILabel *)label4{
    if (_label4 == nil) {
        _label4 = [[UILabel alloc]initWithFrame:CGRectMake(kWidth1*280,kWidth1*60, kWidth1*270, kWidth1*60)];
        _label4.numberOfLines = 0;
        _label4.textAlignment = NSTextAlignmentLeft;

    }
    return _label4;
}

- (UIButton *)btn1{
    if (_btn1 == nil) {
        _btn1 = [[UIButton alloc]initWithFrame:CGRectMake(kWidth1*575, kWidth1*35, kWidth1*50, kWidth1*50)];
        [_btn1 setBackgroundImage:[UIImage imageNamed:@"删除@2x"] forState:UIControlStateNormal];
        [_btn1 addTarget:self action:@selector(btn1Clicked) forControlEvents:UIControlEventTouchUpInside];
    }
    return _btn1;
}

- (void)btn1Clicked{
    if ([_delegate respondsToSelector:@selector(deleteBtn:)]) {
        [_delegate deleteBtn:self];
    }
}



@end

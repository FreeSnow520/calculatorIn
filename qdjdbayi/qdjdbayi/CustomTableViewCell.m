//
//  CustomTableViewCell.m
//  qdjdbayi
//
//  Created by 200000549@qq.com on 16/8/1.
//  Copyright © 2016年 200000549@qq.com. All rights reserved.
//

#import "CustomTableViewCell.h"
#import "My.h"
@implementation CustomTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code

    [self.contentView addSubview:self.TF];
    [self.contentView addSubview:self.Label];

}

- (UITextField *)TF{
    if (_TF == nil) {
        _TF = [[UITextField alloc]init];
        _TF.frame = CGRectMake(kWidth1*10, kWidth1*8, kWidth1*150, kWidth1*55);
        _TF.borderStyle = UITextBorderStyleLine;
        _TF.layer.borderColor= [UIColor lightGrayColor].CGColor;
        _TF.layer.borderWidth= 1.0f;
        _TF.textAlignment = NSTextAlignmentCenter;
        _TF.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
    }
    return _TF;
}

- (UILabel *)Label{
    if (_Label == nil) {
        _Label = [[UILabel alloc]init];
        _Label.frame = CGRectMake(kWidth1*320, kWidth1*10, kWidth1*300, kWidth1*60);
        _Label.textColor = KPurpleColor;
    }
    return _Label;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

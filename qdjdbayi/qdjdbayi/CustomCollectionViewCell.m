//
//  CustomCollectionViewCell.m
//  qdjdbayi
//
//  Created by 200000549@qq.com on 16/8/1.
//  Copyright © 2016年 200000549@qq.com. All rights reserved.
//

#import "CustomCollectionViewCell.h"
#import "My.h"
@implementation CustomCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.TF.layer.borderColor= [UIColor lightGrayColor].CGColor;
    self.TF.textAlignment = NSTextAlignmentCenter;
    self.TF.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
    self.TF.layer.borderWidth= 1.0f;

}

@end

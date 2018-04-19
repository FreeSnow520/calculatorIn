//
//  My.m
//  qdjdbayi
//
//  Created by 200000549@qq.com on 16/8/1.
//  Copyright © 2016年 200000549@qq.com. All rights reserved.
//

#import "My.h"

@interface My ()

@end

@implementation My

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
+ (UIImageView *)ImageViewWithX:(CGFloat)X andY:(CGFloat)Y andW:(CGFloat)W andH:(CGFloat)H andImage:(NSString *)imageStr{
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(kWidth1*X, kWidth1*Y, kWidth1*W, kWidth1*H)];
    imageView.image = [UIImage imageNamed:imageStr];
    return imageView;
}

+ (UILabel *)LabelFrameX:(CGFloat)X andY:(CGFloat)Y andW:(CGFloat)W andH:(CGFloat)H andTitle:(NSString *)title andTextColor:(UIColor *)titlecolor andBgColor:(UIColor *)bgcolor andSize:(CGFloat)S{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(kWidth1*X, kWidth1*Y, kWidth1*W, kWidth1*H)];
    label.text = [NSString stringWithFormat:@"%@", title];
    label.textColor = titlecolor;
    label.backgroundColor = bgcolor;
    //    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:kWidth1*S];
    
    return label;
}

+ (UITextField *)TextfieldwithFrame:(CGFloat)X andY:(CGFloat)Y andW:(CGFloat)W andH:(CGFloat)H andPlaceStr:(NSString *)PlaceStr andTextColor:(UIColor*)Color{
    UITextField *tf = [[UITextField alloc]initWithFrame:CGRectMake(kWidth1*X, kWidth1*Y, kWidth1*W, kWidth1*H)];
    tf.borderStyle = UITextBorderStyleRoundedRect;
    tf.placeholder = PlaceStr;
    tf.textColor = Color;
    tf.borderStyle = UITextBorderStyleNone;
    
    return tf;
}

+ (UITextField *)Textfield1withFrame:(CGFloat)X andY:(CGFloat)Y andW:(CGFloat)W andH:(CGFloat)H andPlaceStr:(NSString *)PlaceStr andTextColor:(UIColor*)Color{
    UITextField *tf = [[UITextField alloc]initWithFrame:CGRectMake(kWidth1*X, kWidth1*Y, kWidth1*W, kWidth1*H)];
    tf.borderStyle = UITextBorderStyleRoundedRect;
    tf.placeholder = PlaceStr;
    tf.textColor = Color;
    tf.borderStyle = UITextBorderStyleLine;
    tf.layer.borderColor= [UIColor lightGrayColor].CGColor;
    
    tf.layer.borderWidth= 1.0f;
    return tf;
}

+ (UIView *)View1withY:(CGFloat)Y{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(kWidth1*0, kWidth1*Y, kWidth1*600, kWidth1*2)];
    view.backgroundColor = [UIColor colorWithRed:24/255.0f green:117/255.0f blue:130/255.0f alpha:1];
    return view;
}

+ (UIView *)ViewwithX:(CGFloat)X andY:(CGFloat)Y andW:(CGFloat)W andBgColor:(UIColor *)Color{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(kWidth1*X, kWidth1*Y, kWidth1*W, kWidth1*1)];
    view.backgroundColor = Color;
    return view;
}

+ (UIButton *)BtnwithImageFrameX:(CGFloat)X andY:(CGFloat)Y andW:(CGFloat)W andH:(CGFloat)H andtitle:(NSString *)title andImage:(NSString *)imageStr andtitleColor:(UIColor *)color andBGColor:(UIColor *)bgColor target:(id)target action:(SEL)action{
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(kWidth1*X, kWidth1*Y, kWidth1*W, kWidth1*H)];
    [btn setBackgroundColor:bgColor];
    [btn setTitleColor:color forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:imageStr] forState:UIControlStateNormal];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    btn.titleLabel.font = [UIFont systemFontOfSize:kWidth1*30];
    return btn;
}



@end

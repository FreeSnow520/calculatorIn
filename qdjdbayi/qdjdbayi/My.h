//
//  My.h
//  qdjdbayi
//
//  Created by 200000549@qq.com on 16/8/1.
//  Copyright © 2016年 200000549@qq.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#define kScreenBounds ([[UIScreen mainScreen] bounds])
#define kWidth1 (kScreenBounds.size.width)/640
#define KGreenColor [UIColor colorWithRed:24/255.0f green:117/255.0f blue:130/255.0f alpha:1]
#define KRedColor [UIColor colorWithRed:200/255.0f green:72/255.0f blue:77/255.0f alpha:1]
#define KPurpleColor [UIColor colorWithRed:168/255.0f green:124/255.0f blue:176/255.0f alpha:1]
@interface My : UIViewController
+ (UIImageView *)ImageViewWithX:(CGFloat)X andY:(CGFloat)Y andW:(CGFloat)W andH:(CGFloat)H andImage:(NSString *)imageStr;
+ (UILabel *)LabelFrameX:(CGFloat)X andY:(CGFloat)Y andW:(CGFloat)W andH:(CGFloat)H andTitle:(NSString *)title andTextColor:(UIColor *)titlecolor andBgColor:(UIColor *)bgcolor andSize:(CGFloat)S;
+ (UITextField *)TextfieldwithFrame:(CGFloat)X andY:(CGFloat)Y andW:(CGFloat)W andH:(CGFloat)H andPlaceStr:(NSString *)PlaceStr andTextColor:(UIColor*)Color;
+ (UIView *)ViewwithX:(CGFloat)X andY:(CGFloat)Y andW:(CGFloat)W andBgColor:(UIColor *)Color;
+ (UIView *)View1withY:(CGFloat)Y;
+ (UIButton *)BtnwithImageFrameX:(CGFloat)X andY:(CGFloat)Y andW:(CGFloat)W andH:(CGFloat)H andtitle:(NSString *)title andImage:(NSString *)imageStr andtitleColor:(UIColor *)color andBGColor:(UIColor *)bgColor target:(id)target action:(SEL)action;
+ (UITextField *)Textfield1withFrame:(CGFloat)X andY:(CGFloat)Y andW:(CGFloat)W andH:(CGFloat)H andPlaceStr:(NSString *)PlaceStr andTextColor:(UIColor*)Color;
@end

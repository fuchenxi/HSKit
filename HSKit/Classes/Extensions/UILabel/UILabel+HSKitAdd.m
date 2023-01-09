//
//  UILabel+HSKitAdd.m
//  AFNetworking
//
//  Created by 付晨曦 on 2023/1/9Monday.
//

#import "UILabel+HSKitAdd.h"

@implementation UILabel (HSKitAdd)

/// 初始化一个 Label
/// @param font 字体
/// @param textColor 字体颜色
+ (instancetype)ls_labelWithFont:(UIFont *)font
                       textColor:(UIColor *)textColor {
    
    UILabel *label = [[self alloc] init];
    label.textColor = textColor;
    label.font = font;
    return label;
}

/// 初始化一个 Label
/// @param text 文字
/// @param font 字体
/// @param textColor 字体颜色
+ (instancetype)ls_labelWithText:(NSString *)text
                            font:(UIFont *)font
                       textColor:(UIColor *)textColor {
    
    UILabel *label = [[self alloc] init];
    label.text = text;
    label.textColor = textColor;
    label.font = font;
    return label;
}

@end

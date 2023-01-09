//
//  UILabel+HSKitAdd.h
//  AFNetworking
//
//  Created by 付晨曦 on 2023/1/9Monday.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (HSKitAdd)

/// 初始化一个 Label
/// @param font 字体
/// @param textColor 字体颜色
+ (instancetype)hs_labelWithFont:(UIFont *)font
                       textColor:(UIColor *)textColor;

/// 初始化一个 Label
/// @param text 文字
/// @param font 字体
/// @param textColor 字体颜色
+ (instancetype)hs_labelWithText:(NSString *)text
                            font:(UIFont *)font
                       textColor:(UIColor *)textColor;

@end

NS_ASSUME_NONNULL_END

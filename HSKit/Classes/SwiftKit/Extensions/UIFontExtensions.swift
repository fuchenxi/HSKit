//
//  UIFontExtensions.swift
//  iShow
//
//  Created by 付晨曦 on 2022/12/2Friday.
//

import Foundation

extension UIFont {
    
    // 默认字体
    class func font(_ value: CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: kScale(value))
    }
    
    // 加粗字体
    class func boldFont(_ value: CGFloat) -> UIFont {
        return UIFont.boldSystemFont(ofSize: kScale(value))
    }
}

//
//  UIColorExtensions.swift
//  iShow
//
//  Created by 付晨曦 on 2022/10/25Tuesday.
//

import Foundation

@objc extension UIColor {
    
    static var color_00BBFF = UIColor(hex: "00BBFF")
    static var color_00E2C2 = UIColor(hex: "00E2C2")
    static var color_00FFDB = UIColor(hex: "00FFDB")
    static var color_202038 = UIColor(hex: "202038")
    static var color_4C00FF = UIColor(hex: "4C00FF")
    static var color_5F60FF = UIColor(hex: "5F60FF")
    static var color_6E00FF = UIColor(hex: "6E00FF")
    static var color_666666 = UIColor(hex: "666666")
    static var color_6D6F88 = UIColor(hex: "6D6F88")
    static var color_7550FF = UIColor(hex: "7550FF")
    static var color_888AA0 = UIColor(hex: "888AA0")
    static var color_999999 = UIColor(hex: "999999")
    static var color_A0A2B4 = UIColor(hex: "A0A2B4")
    static var color_BDBDF2 = UIColor(hex: "BDBDF2")
    static var color_D8D8D8 = UIColor(hex: "D8D8D8")
    static var color_E8EAEF = UIColor(hex: "E8EAEF")
    static var color_EBEBEB = UIColor(hex: "EBEBEB")
    static var color_EFEFEF = UIColor(hex: "EFEFEF")
    static var color_F0EEF3 = UIColor(hex: "F0EEF3")
    static var color_F4F4FB = UIColor(hex: "F4F4FB")
    static var color_F5F5F5 = UIColor(hex: "F5F5F5")
    static var color_F7F7F7 = UIColor(hex: "F7F7F7")
    static var color_F8FAFF = UIColor(hex: "F8FAFF")
    static var color_FAFAFA = UIColor(hex: "FAFAFA")
    static var color_FF0365 = UIColor(hex: "FF0365")
    static var color_FF4F4F = UIColor(hex: "FF4F4F")
    static var color_FFE149 = UIColor(hex: "FFE149")
    static var color_FFEF5B = UIColor(hex: "FFEF5B")
}

@objc extension UIColor {
    
    func withAlpha(_ alpha: CGFloat) -> UIColor {
        return self.withAlphaComponent(alpha)
    }
    
    static var random: UIColor {
        get {
            let red = CGFloat(arc4random() % 256) / 255.0
            let green = CGFloat(arc4random() % 256) / 255.0
            let blue = CGFloat(arc4random() % 256) / 255.0
            return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
        }
    }
    
    /// 16进制字符串转颜色 ARGB
    /// - Parameter hex: 16进制字符串
    public convenience init(hex: String) {
        
        var red:   CGFloat = 0.0
        var green: CGFloat = 0.0
        var blue:  CGFloat = 0.0
        var alpha: CGFloat = 1.0
        var hex:   String = hex
        
        if hex.hasPrefix("#") {
            let index = hex.index(hex.startIndex, offsetBy: 1)
            hex = String(hex[index...])
        }
        
        let scanner = Scanner(string: hex)
        var hexValue: CUnsignedLongLong = 0
        if scanner.scanHexInt64(&hexValue) {
            switch (hex.count) {
                case 3:
                    red   = CGFloat((hexValue & 0xF00) >> 8)       / 15.0
                    green = CGFloat((hexValue & 0x0F0) >> 4)       / 15.0
                    blue  = CGFloat(hexValue & 0x00F)              / 15.0
                case 4:
                    alpha   = CGFloat((hexValue & 0xF000) >> 12)     / 15.0
                    red = CGFloat((hexValue & 0x0F00) >> 8)      / 15.0
                    green  = CGFloat((hexValue & 0x00F0) >> 4)      / 15.0
                    blue = CGFloat(hexValue & 0x000F)             / 15.0
                case 6:
                    red   = CGFloat((hexValue & 0xFF0000) >> 16)   / 255.0
                    green = CGFloat((hexValue & 0x00FF00) >> 8)    / 255.0
                    blue  = CGFloat(hexValue & 0x0000FF)           / 255.0
                case 8:
                    alpha   = CGFloat((hexValue & 0xFF000000) >> 24) / 255.0
                    red = CGFloat((hexValue & 0x00FF0000) >> 16) / 255.0
                    green  = CGFloat((hexValue & 0x0000FF00) >> 8)  / 255.0
                    blue = CGFloat(hexValue & 0x000000FF)         / 255.0
                default:
                    print("Invalid RGB string, number of characters after '#' should be either 3, 4, 6 or 8", terminator: "")
            }
        } else {
            print("Scan hex error")
        }
        self.init(red:red, green:green, blue:blue, alpha:alpha)
    }
}

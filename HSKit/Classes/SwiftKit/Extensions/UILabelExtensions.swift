//
//  UILabelExtensions.swift
//  iShow
//
//  Created by 付晨曦 on 2022/10/28Friday.
//

import Foundation

extension UILabel {
    
    convenience init(text: String) {
        self.init()
        self.text = text
    }
    
    convenience init(font: UIFont, textColor: UIColor) {
        self.init()
        self.font = font
        self.textColor = textColor
    }
    
    convenience init(text: String, font: UIFont, textColor: UIColor) {
        self.init()
        self.text = text
        self.font = font
        self.textColor = textColor
    }
}

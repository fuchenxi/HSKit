//
//  NSMutableAttributedStringAdapter.swift
//  iShow
//
//  Created by 付晨曦 on 2022/12/3Saturday.
//

import Foundation

class NSMutableAttributedStringAdapter {
    
    internal let attributedString: NSMutableAttributedString
    
    internal init(attributedString: NSMutableAttributedString) {
        
        self.attributedString = attributedString
    }
    
    @discardableResult
    func font(_ font: UIFont) -> NSMutableAttributedStringAdapter {
        self.attributedString.yy_font = font
        return self
    }
    
    @discardableResult
    func color(_ color: UIColor) -> NSMutableAttributedStringAdapter {
        self.attributedString.yy_color = color
        return self
    }
}

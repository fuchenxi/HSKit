//
//  StringExtensions.swift
//  iShow
//
//  Created by 付晨曦 on 2022/11/11Friday.
//

import Foundation

extension String {
//    func assetString() -> String {
//        if self.hasPrefix("http") {
//            return self
//        }
//        if self.hasPrefix("/") {
//            return LSUIHelper.assetsHost() + self
//        }
//        return LSUIHelper.assetsHost() + "/" + self
//    }
//
//    func assetURL() -> URL? {
//        return URL(string: self.assetString())
//    }
//
//    var localized: String {
//        return HSString(self)
//    }
    
    var decimal: String {
        
        return NSDecimalNumber(string: self).stringValue
    }
}

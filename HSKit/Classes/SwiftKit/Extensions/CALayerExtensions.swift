//
//  CALayerExtensions.swift
//  iShow
//
//  Created by 付晨曦 on 2022/12/28Wednesday.
//

import Foundation

extension CALayer {
    
    @objc func setBorder(_ color: UIColor, _ width: CGFloat) {
        borderColor = color.cgColor
        borderWidth = width
    }
}

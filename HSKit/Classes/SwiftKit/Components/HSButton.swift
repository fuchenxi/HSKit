//
//  HSButton.swift
//  iShow
//
//  Created by 付晨曦 on 2022/10/26Wednesday.
//

import Foundation

class HSButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.adjustsImageWhenHighlighted = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        return CGSizeMake(ceil(size.width + titleEdgeInsets.left + titleEdgeInsets.right),
                          ceil(size.height + titleEdgeInsets.top + titleEdgeInsets.bottom))
    }
}

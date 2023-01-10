//
//  HSMarqueeLabel.swift
//  iShow
//
//  Created by 付晨曦 on 2022/12/30Friday.
//

import UIKit
import MarqueeLabel

class HSMarqueeLabel: MarqueeLabel {

    override init(frame: CGRect, duration: CGFloat, fadeLength fade: CGFloat) {
        super.init(frame: frame, duration: duration, fadeLength: fade)
        
        setupCommon()
    }
    
    override init(frame: CGRect, rate: CGFloat, fadeLength fade: CGFloat) {
        super.init(frame: frame, rate: rate, fadeLength: fade)
        
        setupCommon()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupCommon()
    }
    
    private func setupCommon() {
        
        type = .continuous
        speed = .rate(30)
        fadeLength = 10
        animationCurve = .linear;
        leadingBuffer = 0
        trailingBuffer = kScale(5)
        animationDelay = 1.5
    }
}

//
//  HSGradientView.swift
//  iShow
//
//  Created by 付晨曦 on 2023/1/4Wednesday.
//

import UIKit

class HSGradientView: HSView {
    
    // MARK: - Propertys
    var colors: [UIColor]? {
        didSet {
            guard let colors = colors else { return }
            self.layer.colors = colors.map {
                return $0.cgColor
            }
        }
    }
    
    var locations: [NSNumber]? {
        didSet {
            guard let locations = locations else { return }
            self.layer.locations = locations
        }
    }
    
    var startPoint: CGPoint? {
        didSet {
            guard let startPoint = startPoint else { return }
            self.layer.startPoint = startPoint
        }
    }
    
    var endPoint: CGPoint? {
        didSet {
            guard let endPoint = endPoint else { return }
            self.layer.endPoint = endPoint
        }
    }
    
    var cornerRaius: CGFloat = CGFLOAT_MAX {
        didSet {
            setNeedsLayout()
        }
    }
    
    private var cornerLayer = CAShapeLayer()

    // MARK: - Override
    override class var layerClass: AnyClass {
        return CAGradientLayer.self
    }
    
    override var layer: CAGradientLayer {
        return super.layer as! CAGradientLayer
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        isOpaque = false
        layer.mask = cornerLayer
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        isOpaque = false
        layer.mask = cornerLayer
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        cornerLayer.frame = bounds
        var radius = 0.0
        if cornerRaius == CGFLOAT_MAX {
            radius = bounds.height / 2
        } else {
            radius = cornerRaius
        }
        cornerLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: radius).cgPath
    }
}

extension HSGradientView {
    
    convenience init(_ colors: [UIColor],
                     _ start: CGPoint = .init(x: 0, y: 0.5),
                     _ end: CGPoint = .init(x: 1, y: 0.5)) {
        
        self.init(colors, [0, 1], start, end)
    }
    
    convenience init(_ colors: [UIColor],
                     _ locations: [NSNumber] = [0, 1],
                     _ start: CGPoint = .init(x: 0, y: 0.5),
                     _ end: CGPoint = .init(x: 1, y: 0.5)) {
        
        self.init(frame: .zero)
        
        guard colors.count == locations.count else {
            fatalError("颜色和位置数量不相等")
        }
        
        self.colors = colors
        self.locations = locations
        self.startPoint = start
        self.endPoint = end
    }
}

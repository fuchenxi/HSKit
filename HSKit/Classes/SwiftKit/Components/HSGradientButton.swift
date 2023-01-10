//
//  HSGradientButton.swift
//  iShow
//
//  Created by 付晨曦 on 2023/1/4Wednesday.
//

import UIKit

class HSGradientButton: UIButton {

    // MARK: - Propertys
    var colors: [UIColor]? {
        didSet {
            guard let colors = colors else { return }
            gradientLayer.colors = colors.map {
                return $0.cgColor
            }
        }
    }
    
    var locations: [NSNumber]? {
        didSet {
            guard let locations = locations else { return }
            gradientLayer.locations = locations
        }
    }
    
    var startPoint: CGPoint? {
        didSet {
            guard let startPoint = startPoint else { return }
            gradientLayer.startPoint = startPoint
        }
    }
    
    var endPoint: CGPoint? {
        didSet {
            guard let endPoint = endPoint else { return }
            gradientLayer.endPoint = endPoint
        }
    }
    
    var cornerRaius: CGFloat = CGFLOAT_MAX {
        didSet {
            setNeedsLayout()
        }
    }
    
    private var gradientLayer = CAGradientLayer()
    private var cornerLayer = CAShapeLayer()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        isOpaque = false
        layer.insertSublayer(gradientLayer, at: 0)
        layer.mask = cornerLayer
        adjustsImageWhenHighlighted = false
        
        setupViews()
        setupLayout()
        addObservers()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        isOpaque = false
        layer.insertSublayer(gradientLayer, at: 0)
        layer.mask = cornerLayer
        adjustsImageWhenHighlighted = false
        
        setupViews()
        setupLayout()
        addObservers()
    }
    
    deinit {
    
        removeObservers()
    }
    
    func setupViews() {
        
    }
    
    func setupLayout() {
        
    }
    
    func addObservers() {
        
    }
    
    func removeObservers() {
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        gradientLayer.frame = bounds
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

extension HSGradientButton {
    
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
        
        gradientLayer.colors = colors
        gradientLayer.locations = locations
        gradientLayer.startPoint = start
        gradientLayer.endPoint = end
    }
}

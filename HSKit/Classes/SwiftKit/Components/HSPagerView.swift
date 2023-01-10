//
//  HSPagerView.swift
//  iShow
//
//  Created by 付晨曦 on 2022/12/28.
//

import UIKit
import FSPagerView
import CHIPageControl
import SnapKit

class HSPagerView: UIView {

    open weak var dataSource: FSPagerViewDataSource? {
        didSet {
            pagerView.dataSource = dataSource
        }
    }
    open weak var delegate: FSPagerViewDelegate?
    
    open var isHiddenPageControl: Bool = false {
        didSet {
            pageControl.isHidden = isHiddenPageControl
        }
    }
    
    func register(cellType: HSPagerViewCell.Type) {
        pagerView.register(cellType: cellType)
    }
    
    func currentCell() -> FSPagerViewCell? {
        return pagerView.currentCell()
    }
    
    func reloadData() {
        
        if isHiddenPageControl == false {
            let number = pagerView.dataSource?.numberOfItems(in: pagerView)
            pageControl.numberOfPages = number ?? 0
        }
        pagerView.reloadData()
    }
    
    // MARK: - Propertys
    private lazy var cornerLayer = CAShapeLayer()
    private lazy var pagerView: FSPagerView = {
        let view = FSPagerView()
        view.delegate = self
        view.isInfinite = true
        view.automaticSlidingInterval = 5
        view.removesInfiniteLoopForSingleItem = true
//        let transformer = FSPagerViewTransformer(type: .depth)
//        transformer.minimumAlpha = 1.0
//        view.transformer = transformer
        return view
    }()
    private lazy var pageControl: CHIPageControlPuya = {
        let pageControl = CHIPageControlPuya()
        pageControl.radius = 4
        pageControl.tintColor = .white.withAlpha(0.5)
        pageControl.currentPageTintColor = .white
        pageControl.padding = 6
        return pageControl
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupCommonViews()
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupCommonViews()
        setupViews()
    }
    
    func setupCommonViews() {
        
        layer.mask = cornerLayer
        addSubview(pagerView)
        addSubview(pageControl)
        
        pagerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        pageControl.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-kMargin4)
            make.trailing.equalToSuperview().offset(-kMargin10)
            make.height.equalTo(kMargin10)
        }
    }
    
    func setupViews() {
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        cornerLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: kRadius8).cgPath
        cornerLayer.frame = bounds
    }
}

extension HSPagerView: FSPagerViewDelegate {
    
    func pagerViewDidScroll(_ pagerView: FSPagerView) {
        if isHiddenPageControl == false {
            pageControl.progress = pagerView.scrollOffset
        }
    }
    
    func pagerView(_ pagerView: FSPagerView, didSelectItemAt index: Int) {
        guard let delegate = self.delegate else { return }
        delegate.pagerView?(pagerView, didSelectItemAt: index)
    }
}

class HSPagerViewCell: FSPagerViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupDefault()
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupDefault()
        setupViews()
    }
    
    private func setupDefault() {
        
        contentView.layer.shadowColor = UIColor.clear.cgColor
        contentView.layer.shadowRadius = 0
    }
    
    open func setupViews() {
        
    }
}

class HSPagerViewBannerCell: HSPagerViewCell {
    
    // MARK: - Propertys
    private lazy var bannerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    var imageURL: String? {
        didSet {
            guard let imageURL = imageURL else { return }
            bannerImageView.setFadeImage(imageURL, UIImage(named: "hs_default_banner"))
        }
    }
    
    // MARK: - Init
    override func setupViews() {
        
        contentView.addSubview(bannerImageView)
        bannerImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

extension FSPagerView {

    func register(cellType: HSPagerViewCell.Type) {
        register(cellType, forCellWithReuseIdentifier: String(describing: cellType))
    }
    
    func dequeueReusableCell<T: HSPagerViewCell>(with type: T.Type, at index: Int) -> T {
        return dequeueReusableCell(withReuseIdentifier: String(describing: type), at: index) as! T
    }
    
    func cellForItem<T: HSPagerViewCell>(at index: Int, type: T.Type) -> T? {
        return cellForItem(at: index) as? T
    }
    
    func currentCell() -> FSPagerViewCell? {
        return cellForItem(at: currentIndex)
    }
}

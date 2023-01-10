//
//  HSCommonBannerView.swift
//  iShow
//
//  Created by 付晨曦 on 2022/12/29Thursday.
//

import UIKit
import FSPagerView

@objc enum HSBannerType: Int {
    case none
    case liveList
    case partyList
    case momentList
    case mine
    case room
    func toString() -> String {
        switch self {
            case .none:
                return ""
            case .liveList:
                return "live_list"
            case .partyList:
                return "party_list"
            case .momentList:
                return "content_top"
            case .mine:
                return "mine"
            case .room:
                return "live_room"
        }
    }
}

@objc class HSCommonBannerView: UIView {
    
    private lazy var pagerView: HSPagerView = {
        let view = HSPagerView()
        view.dataSource = self
        view.delegate = self
        view.register(cellType: HSPagerViewBannerCell.self)
        return view
    }()
    
    @objc var isHiddenPageControl: Bool = false {
        didSet {
            pagerView.isHiddenPageControl = isHiddenPageControl
        }
    }
    
    @objc var infos: [LSBannerInfo]? {
        didSet {
            pagerView.reloadData()
        }
    }
    
    @objc var type: HSBannerType = .none
    
    /// 获取公共Banner的高度
    /// - Parameter width: 宽度
    /// - Returns: 比例计算出高度
    @objc func getBannerHeight(_ width: CGFloat) -> CGFloat {
        return kBannerHeight(width: width)
    }
    
    // MARK: - Init
    init(type: HSBannerType) {
        super.init(frame: .zero)
        
        self.type = type
        
        setupViews()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupViews()
    }
    
    private func setupViews() {
        
        addSubview(pagerView)
        pagerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

extension HSCommonBannerView: FSPagerViewDelegate, FSPagerViewDataSource {
    
    func numberOfItems(in pagerView: FSPagerView) -> Int {
        return infos?.count ?? 0
    }
    
    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        
        let cell = pagerView.dequeueReusableCell(with: HSPagerViewBannerCell.self, at: index)
        cell.imageURL = self.infos?[index].banner.image
        return cell
    }
    
    func pagerView(_ pagerView: FSPagerView, didSelectItemAt index: Int) {
        guard let info = self.infos?[index] else { return }
        
        HSStatisticsManager.shared.logEvent(name: .clickBanner, contentID: info.bannerID, contentType: self.type.toString())
        let aClass: AnyClass? = NSClassFromString("LSSchemeManager")
        aClass?.performSelector(onMainThread: NSSelectorFromString("scheme"), with: info.action, waitUntilDone: false, modes: nil)
    }
}

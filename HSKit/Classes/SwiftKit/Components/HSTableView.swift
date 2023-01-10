//
//  HSTableView.swift
//  iShow
//
//  Created by 付晨曦 on 2022/10/25Tuesday.
//

import Foundation

class HSTableView: UITableView {
    
    override init(frame: CGRect, style: UITableView.Style) {
    
        super.init(frame: frame, style: style)
        
        self.backgroundColor = UIColor.white
        self.separatorColor = UIColor.clear
        self.separatorStyle = .none
        self.delaysContentTouches = false
        self.canCancelContentTouches = true
        self.estimatedRowHeight = 0
        self.estimatedSectionFooterHeight = 0
        self.estimatedSectionHeaderHeight = 0
        if #available(iOS 13.0, *) {
            self.automaticallyAdjustsScrollIndicatorInsets = false
        }
        if #available(iOS 15.0, *) {
            self.sectionHeaderTopPadding = 0
        }
        self.showsVerticalScrollIndicator = false
        self.showsHorizontalScrollIndicator = false
        self.keyboardDismissMode = .onDrag
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

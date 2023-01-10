//
//  HSRoomBaseView.swift
//  iShow
//
//  Created by 付晨曦 on 2022/12/30Friday.
//

import UIKit

class HSRoomBaseView: UIView {

    var roomID = ""
    
    init(roomID: String?) {
        super.init(frame: .zero)
        
        self.roomID = roomID ?? ""
        
        setupViews()
        setupLayout()
        setupData()
        addObservers()
    }
    
    deinit {
        removeObservers()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        
    }
    
    func setupLayout() {
        
    }
    
    func setupData() {
        
    }
    
    func addObservers() {
        
    }
    
    func removeObservers() {
        
    }
}

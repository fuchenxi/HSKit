//
//  HSCollectionViewCell.swift
//  iShow
//
//  Created by 付晨曦 on 2023/1/4Wednesday.
//

import UIKit

class HSCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupLayout()
        addObservers()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
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
}

//
//  HSTableViewCell.swift
//  iShow
//
//  Created by 付晨曦 on 2022/10/25Tuesday.
//

import Foundation

class HSTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = .none
        self.backgroundColor = .white
        self.contentView.backgroundColor = .white
        
        setupViews()
        setupLayout()
        addObservers()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        self.selectionStyle = .none
        self.backgroundColor = .white
        self.contentView.backgroundColor = .white
        
        setupViews()
        setupLayout()
        addObservers()
    }
    
    deinit {
        removeObservers()
    }
    
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        
        super.setHighlighted(highlighted, animated: animated)
        
        UIView.animate(withDuration: 0.3) {
            self.contentView.backgroundColor = highlighted ? UIColor.color_F7F7F7 : UIColor.white
        }
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

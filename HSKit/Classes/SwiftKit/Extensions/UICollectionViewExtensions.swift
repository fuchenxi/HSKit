//
//  UICollectionViewExtensions.swift
//  iShow
//
//  Created by 付晨曦 on 2022/12/5Monday.
//

import Foundation

#if canImport(UIKit) && !os(watchOS) && !os(tvOS)
import UIKit

public extension UICollectionView {
    
    // MARK: - Register
    func register(cellType: UICollectionViewCell.Type) {
        register(cellType, forCellWithReuseIdentifier: cellType.className)
    }

    func register(cellTypes: [UICollectionViewCell.Type]) {
        cellTypes.forEach { register(cellType: $0) }
    }

    func register(reusableViewType: UICollectionReusableView.Type, ofKind kind: String) {
        register(reusableViewType, forSupplementaryViewOfKind: kind, withReuseIdentifier: reusableViewType.className)
    }

    func register(reusableViewTypes: [UICollectionReusableView.Type],
                  ofKind kind: String) {
        reusableViewTypes.forEach { register(reusableViewType: $0, ofKind: kind) }
    }

    func dequeueReusableCell<T: UICollectionViewCell>(with type: T.Type,
                                                      for indexPath: IndexPath) -> T {
        return dequeueReusableCell(withReuseIdentifier: type.className, for: indexPath) as! T
    }

    func dequeueReusableView<T: UICollectionReusableView>(with type: T.Type,
                                                          for indexPath: IndexPath,
                                                          ofKind kind: String) -> T {
        return dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: type.className, for: indexPath) as! T
    }
}

extension UICollectionView {
    
    enum Alignment {
        case none
        case left
        case center
        case right
    }
    
    func reloadData(alignment: UICollectionView.Alignment) {
        
        self.reloadData()
        switch alignment {
            case .left:
                self.layoutIfNeeded()
                contentInset = .init(top: contentInset.top,
                                     left: 0,
                                     bottom: contentInset.bottom,
                                     right: 0)
                
            case .center:
                self.layoutIfNeeded()
                if contentSize.width < bounds.size.width {
                    contentInset = .init(top: contentInset.top,
                                         left: (bounds.size.width - contentSize.width) / 2,
                                         bottom: contentInset.bottom,
                                         right: 0)
                } else {
                    contentInset = .init(top: contentInset.top,
                                         left: 0,
                                         bottom: contentInset.bottom,
                                         right: 0)
                }
            case .right:
                self.layoutIfNeeded()
                guard let number = dataSource?.collectionView(self, numberOfItemsInSection: 0) else { return }
                if number > 0 &&
                    contentSize.width < bounds.size.width {
                    contentInset = .init(top: contentInset.top,
                                         left: bounds.size.width - contentSize.width,
                                         bottom: contentInset.bottom,
                                         right: 0)
                } else {
                    contentInset = .init(top: contentInset.top,
                                         left: 0,
                                         bottom: contentInset.bottom,
                                         right: 0)
                }

            default:
                self.layoutIfNeeded()
                contentInset = .init(top: contentInset.top,
                                     left: 0,
                                     bottom: contentInset.bottom,
                                     right: 0)
                break
        }
    }
}

#endif // canImport(UIKit)

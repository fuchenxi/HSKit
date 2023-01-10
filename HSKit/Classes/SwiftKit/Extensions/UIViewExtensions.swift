//
//  UIViewExtensions.swift
//  iShow
//
//  Created by 付晨曦 on 2022/12/2Friday.
//

import Foundation

extension UIView {
    
    var viewController: UIViewController? {
        var parent: UIResponder? = self
        while parent != nil {
            parent = parent?.next
            if let viewController = parent as? UIViewController {
                return viewController
            }
        }
        return nil
    }
    
    func removeAllSubviews() {
        subviews.forEach({ $0.removeFromSuperview() })
    }
}

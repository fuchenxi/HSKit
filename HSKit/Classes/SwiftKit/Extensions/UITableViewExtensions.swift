//
//  UITableViewExtensions.swift
//  iShow
//
//  Created by 付晨曦 on 2022/10/25Tuesday.
//

import Foundation

#if canImport(UIKit) && !os(watchOS) && !os(tvOS)
import UIKit

public extension UITableView {
    
    // MARK: - Register
    @objc func register(cellType: UITableViewCell.Type) {
        register(cellType, forCellReuseIdentifier: cellType.className)
    }
    
    @objc func register(cellTypes: [UITableViewCell.Type]) {
        cellTypes.forEach { register(cellType: $0) }
    }
    
    @objc func register(headerType: UITableViewHeaderFooterView.Type) {
        register(headerType, forHeaderFooterViewReuseIdentifier: headerType.className)
    }
    
    @objc func register(headerTypes: [UITableViewHeaderFooterView.Type]) {
        headerTypes.forEach { register(headerType: $0) }
    }
    
    @objc func register(footerType: UITableViewHeaderFooterView.Type) {
        register(footerType, forHeaderFooterViewReuseIdentifier: footerType.className)
    }
    
    @objc func register(footerTypes: [UITableViewHeaderFooterView.Type]) {
        footerTypes.forEach { register(footerType: $0) }
    }
    
    // MARK: - Dequeue Reusable
    func dequeueReusableCell<T: UITableViewCell>(with type: T.Type, for indexPath: IndexPath) -> T {
        dequeueReusableCell(withIdentifier: type.className, for: indexPath) as! T
    }
    
    func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>(with type:T.Type) -> T {
        dequeueReusableHeaderFooterView(withIdentifier: type.className) as! T
    }
    
    // MARK: - Cache Height
    func heightForCell<T: UITableViewCell>(_ cell: T.Type, for indexPath: IndexPath, block configuration: @escaping (_ cell: T) -> Void) -> CGFloat {
        return fd_heightForCell(withIdentifier: cell.className, cacheBy: indexPath) { v in
            configuration(v as! T)
        }
    }
    
    func heightForHeaderFooterView<T: UITableViewHeaderFooterView>(_ headerFooterView: T.Type, block configuration: @escaping (_ view: T) -> Void) -> CGFloat {
        return ls_heightForHeaderFooterView(withIdentifier: headerFooterView.className) { v in
            configuration(v as! T)
        }
    }
    
    // MARK: - Refresh
    @objc func hs_header(_ refreshBlock: @escaping () -> Void) {
        mj_header = LSRefreshHeader(refreshingBlock: {
            refreshBlock()
        })
    }
    
    @objc func hs_footer(_ refreshBlock: @escaping () -> Void) {
        mj_footer = LSRefreshFooter(refreshingBlock: {
            refreshBlock()
        })
    }
    
    
//    func tableHeaderViewSizeToFit() {
//        tableHeaderOrFooterViewSizeToFit(\.tableHeaderView)
//    }
//
//    func tableFooterViewSizeToFit() {
//        tableHeaderOrFooterViewSizeToFit(\.tableFooterView)
//    }
//
//    private func tableHeaderOrFooterViewSizeToFit(_ keyPath: ReferenceWritableKeyPath<UITableView, UIView?>) {
//        guard let headerOrFooterView = self[keyPath: keyPath] else { return }
//        let height = headerOrFooterView
//            .systemLayoutSizeFitting(CGSize(width: frame.width, height: 0),
//                                     withHorizontalFittingPriority: .required,
//                                     verticalFittingPriority: .fittingSizeLevel).height
//        guard headerOrFooterView.frame.height != height else { return }
//        headerOrFooterView.frame.size.height = height
//        self[keyPath: keyPath] = headerOrFooterView
//    }
//
//    func deselectSelectedRow(animated: Bool) {
//        guard let indexPathForSelectedRow = indexPathForSelectedRow else { return }
//        deselectRow(at: indexPathForSelectedRow, animated: animated)
//    }

    @objc func reloadData(_ completion: @escaping () -> Void) {
        UIView.animate(withDuration: 0, animations: {
            self.reloadData()
        }, completion: { _ in
            completion()
        })
    }
}
#endif // canImport(UIKit)

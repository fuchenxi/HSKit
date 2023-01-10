//
//  UIImageViewExtensions.swift
//  iShow
//
//  Created by 付晨曦 on 2022/10/28Friday.
//

import Foundation

enum AnimationType {
    case none
    case fade
}

typealias HSImageCompletionBlock = (UIImage?, Error?) -> (Void)

extension UIImageView {
    
    func cancelCurrentImageLoad() {
        self.sd_cancelCurrentImageLoad()
    }
    
    func setFadeImage(_ url: String?, _ placeholder: UIImage? = nil, completionHandler: HSImageCompletionBlock? = nil) {
        self.setImageURL(url: url, placeholder: placeholder, animationType: .fade, completionHandler: completionHandler)
    }
    
    func setImageURL(url: String?, placeholder: UIImage?, animationType: AnimationType = .none, completionHandler: HSImageCompletionBlock? = nil) {
        if animationType == .fade {
            self.sd_imageTransition = SDWebImageTransition.fade(duration: 0.3)
        }
        let url = url ?? ""
        self.sd_setImage(with: url.assetURL(), placeholderImage: placeholder) { image, error, type, url in
            completionHandler?(image, error)
        }
    }
}

extension UIImageView {
    
    convenience init(imageNamed: String? = nil) {
        self.init()
        
        if imageNamed != nil {
            image = UIImage(named: imageNamed ?? "")
        }
    }
}

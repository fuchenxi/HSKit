//
//  NSMutableAttributedStringExtensions.swift
//  iShow
//
//  Created by 付晨曦 on 2022/12/2Friday.
//

import Foundation
import YYText

extension NSMutableAttributedString {
    
    var hs: NSMutableAttributedStringAdapter {
        return NSMutableAttributedStringAdapter(attributedString: self)
    }
    
    func hs_append(_ string: String?) {
        guard string != nil else {
            return
        }
        let text = NSMutableAttributedString(string: string!)
        self.append(text)
    }
    
    func hs_append(_ string: String?, _ font: UIFont) {
        guard string != nil else {
            return
        }
        let text = NSMutableAttributedString(string: string!)
        text.yy_font = font
        self.append(text)
    }
    
    func hs_append(_ string: String?, _ color: UIColor) {
        guard string != nil else {
            return
        }
        let text = NSMutableAttributedString(string: string!)
        text.yy_color = color
        self.append(text)
    }
    
    func hs_append(_ string: String?, _ font: UIFont, _ color: UIColor) {
        guard string != nil else {
            return
        }
        let text = NSMutableAttributedString(string: string!)
        text.yy_font = font
        text.yy_color = color
        self.append(text)
    }
    
    func hs_append(_ image: UIImage?, _ font: UIFont) {
        guard image != nil else {
            return
        }
        let attributedString = NSMutableAttributedString.yy_attachmentString(withContent: image,
                                                                             contentMode: .scaleAspectFit,
                                                                             attachmentSize: .init(width: image!.size.width, height: image!.size.height),
                                                                             alignTo: font,
                                                                             alignment: .center)
        self.append(attributedString)
    }
    
    func hs_appendSpace(_ width: CGFloat) {
        guard width > 0 else {
            return
        }
        let attributedString = NSMutableAttributedString.yy_attachmentString(withContent: UIImage(),
                                                                             contentMode: .left,
                                                                             attachmentSize: .init(width: width, height: 0),
                                                                             alignTo: .font(1),
                                                                             alignment: .center)
        self.append(attributedString)
    }
}

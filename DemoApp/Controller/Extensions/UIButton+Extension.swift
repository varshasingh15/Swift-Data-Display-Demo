//
//  UIButton+Extension.swift
//  DemoApp
//
//  Created by Varsha Singh on 7/13/18.
//  Copyright © 2018 DemoApp. All rights reserved.
//

import Foundation
import UIKit
/*
 An extension of UIButton to support methods which can be apply on button
 */
extension UIButton {
    
    /**
     Add underline
     - does:
       - check button text is available or not
       - create and apply attributed string for underline
     */
    func underline() {
        guard let text = self.titleLabel?.text else { return }
        
        let attributedString = NSMutableAttributedString(string: text)
        attributedString.addAttribute(NSAttributedStringKey.underlineStyle, value: NSUnderlineStyle.styleSingle.rawValue, range: NSRange(location: 0, length: text.count))
        
        self.setAttributedTitle(attributedString, for: .normal)
    }
}

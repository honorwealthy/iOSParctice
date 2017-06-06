//
//  BorderLabel.swift
//  iOSPractice
//
//  Created by Schilling Chiu on 2017/6/6.
//  Copyright © 2017 honorwealthy. All rights reserved.
//

import UIKit

@IBDesignable
class BorderLabel: UILabel {

    @IBInspectable var borderSize: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderSize
        }
    }
    
    @IBInspectable var borderColor: UIColor = UIColor.black {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    
    // round corner
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
    
    // shadow
    
    @IBInspectable var outlineShadowColor: UIColor = UIColor() {
        didSet {
            layer.shadowColor = outlineShadowColor.cgColor
        }
    }
    
    @IBInspectable var outlineShadowOpacity: Float = 0 {
        didSet {
            layer.shadowOpacity = outlineShadowOpacity
        }
    }
    
    @IBInspectable var outlineShadowOffset: CGSize = CGSize.zero {
        didSet {
            layer.shadowOffset = outlineShadowOffset
        }
    }
    
    @IBInspectable var outlineShadowRadius: CGFloat = 0 {
        didSet {
            layer.shadowRadius = outlineShadowRadius
        }
    }
    
    // insets
    
    @IBInspectable var topInset: CGFloat = 0
    @IBInspectable var leftInset: CGFloat = 0
    @IBInspectable var bottomInset: CGFloat = 0
    @IBInspectable var rightInset: CGFloat = 0
    
    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets(top: borderSize + topInset, left: borderSize + leftInset, bottom: borderSize + bottomInset, right: borderSize + rightInset)
        super.drawText(in: UIEdgeInsetsInsetRect(rect, insets))
    }
    
    override func textRect(forBounds bounds: CGRect, limitedToNumberOfLines numberOfLines: Int) -> CGRect {
        let textInsets = UIEdgeInsets(top: borderSize + topInset, left: borderSize + leftInset, bottom: borderSize + bottomInset, right: borderSize + rightInset)
        let insetRect = UIEdgeInsetsInsetRect(bounds, textInsets)
        let textRect = super.textRect(forBounds: insetRect, limitedToNumberOfLines: numberOfLines)
        let invertedInsets = UIEdgeInsets(top: -borderSize - topInset, left: -borderSize - leftInset, bottom: -borderSize - bottomInset, right: -borderSize - rightInset)
        return UIEdgeInsetsInsetRect(textRect, invertedInsets)
    }

}

//
//  BorderView.swift
//  iOSPractice
//
//  Created by Schilling Chiu on 2017/6/6.
//  Copyright © 2017 honorwealthy. All rights reserved.
//

import UIKit

@IBDesignable
class BorderView: UIView {

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
}

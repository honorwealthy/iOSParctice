//
//  FlipImageView.swift
//  iOSPractice
//
//  Created by Schilling Chiu on 2017/6/6.
//  Copyright © 2017 honorwealthy. All rights reserved.
//

import UIKit

@IBDesignable
class FlipImageView : UIImageView {
    
    private var orientationType: UIImageOrientation = .upMirrored
    
    @IBInspectable var orientation: Int {
        get {
            return self.orientationType.rawValue
        }
        
        set(newValue) {
            self.orientationType = UIImageOrientation(rawValue: newValue) ?? .upMirrored
            refreshImage()
        }
    }
    
    private func refreshImage() {
        if let img = self.image {
            let flippedImg = UIImage(cgImage: img.cgImage!, scale: 1, orientation: orientationType)
            self.image = flippedImg.resizableImage(withCapInsets: img.capInsets, resizingMode: UIImageResizingMode.stretch)
        }
    }
}

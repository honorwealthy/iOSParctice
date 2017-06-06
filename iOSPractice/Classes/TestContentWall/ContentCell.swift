//
//  ContentCell.swift
//  iOSPractice
//
//  Created by Schilling Chiu on 2017/6/6.
//  Copyright © 2017 honorwealthy. All rights reserved.
//

import UIKit
import SDWebImage

class ContentCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var caption: BorderLabel!
    
    func setData(_ data: ContentData) {
        caption.text = data.Caption
        
        imageView.sd_setImage(with: URL(string: data.ImageUrl), placeholderImage: UIImage(named: "noimage"))
    }
    
    public class func calculateHeight(_ cellWidth: CGFloat, _ data: ContentData) -> CGFloat {
        return ceil(cellWidth * data.imageHeight / data.imageWidth)
    }
}

//
//  TestClassFromJson.swift
//  iOSPractice
//
//  Created by Schilling Chiu on 2017/6/8.
//  Copyright © 2017 honorwealthy. All rights reserved.
//

import Foundation
import UIKit

class TestClassFromJson {
    var Id: String
    var Caption: String
    var ImageUrl: String
    var ImageWidth: CGFloat
    var ImageHeight: CGFloat
    
    init? (json: [String: Any]) {
        guard let id = json["id"] as? String,
            let name = json["n"] as? String,
            let imageUrl = json["img"] as? String,
//            let categories = json["cs"] as? [String],
            let width = json["w"] as? CGFloat,
            let height = json["h"] as? CGFloat
        else {
                print("Error occured when loading story list. \(json)")
                return nil
        }
        
        Id = id
        Caption = name
        ImageUrl = imageUrl
        ImageWidth = width
        ImageHeight = height
    }
}

//
//  TestContentDataController.swift
//  iOSPractice
//
//  Created by Schilling Chiu on 2017/6/6.
//  Copyright © 2017 honorwealthy. All rights reserved.
//

import Foundation
import UIKit

class TestContentDataController {
    private static var _instance: TestContentDataController?
    
    static var Instance: TestContentDataController {
        get {
            if _instance == nil {
                _instance = TestContentDataController()
            }
            return _instance!
        }
    }
    
    var dataList: [ContentData]
    
    private init() {
        dataList = []
        
        dataList.append(ContentData(id:"1", caption: "Scream", image: "https://upload.wikimedia.org/wikipedia/commons/thumb/f/f4/The_Scream.jpg/377px-The_Scream.jpg", width: 377, height: 480))
        dataList.append(ContentData(id:"2", caption: "Starry Night", image: "https://upload.wikimedia.org/wikipedia/commons/thumb/e/ea/Van_Gogh_-_Starry_Night_-_Google_Art_Project.jpg/606px-Van_Gogh_-_Starry_Night_-_Google_Art_Project.jpg", width: 606, height: 480))
        dataList.append(ContentData(id:"3", caption: "Cafe Terrace at Night", image: "https://upload.wikimedia.org/wikipedia/commons/thumb/2/21/Vincent_Willem_van_Gogh_-_Cafe_Terrace_at_Night_%28Yorck%29.jpg/383px-Vincent_Willem_van_Gogh_-_Cafe_Terrace_at_Night_%28Yorck%29.jpg", width: 383, height: 480))
    }
}

class ContentData {
    var Id: String
    var Caption: String
    var ImageUrl: String
    
    var imageWidth: CGFloat = 1
    var imageHeight: CGFloat = 1
    
    init(id: String, caption: String, image: String, width: CGFloat, height: CGFloat) {
        Id = id
        Caption = caption
        ImageUrl = image
        imageWidth = width
        imageHeight = height
    }
}

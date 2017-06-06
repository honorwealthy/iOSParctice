//
//  TestList.swift
//  iOSPractice
//
//  Created by Schilling Chiu on 2017/6/6.
//  Copyright © 2017 honorwealthy. All rights reserved.
//

import Foundation
import UIKit

class TestList {
    private static var _instance: TestList?
    
    static var Instance: TestList {
        get {
            if _instance == nil {
                _instance = TestList()
            }
            return _instance!
        }
    }
    
    var SampleList: [TestSampleData]
    
    private init() {
        SampleList = []
    }
    
    func addTest(_ data: TestSampleData) {
        SampleList.append(data)
    }
}

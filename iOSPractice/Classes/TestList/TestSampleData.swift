//
//  TestSampleData.swift
//  iOSPractice
//
//  Created by Schilling Chiu on 2017/6/6.
//  Copyright © 2017 honorwealthy. All rights reserved.
//

import Foundation
import UIKit

class TestSampleData {
    var DisplayName: String {
        get {
            return "unknown"
        }
    }
    
    func generateVC() -> UIViewController {
        return UIViewController()
    }
}


class TestNavigatorDrawer: TestSampleData {
    override var DisplayName: String {
        get {
            return "navigator drawer test"
        }
    }
    
    override func generateVC() -> UIViewController {
        let otherStoryboard = UIStoryboard(name: "NavigatorDrawer", bundle: nil)
        let navigatorDrawer = otherStoryboard.instantiateViewController(withIdentifier: "NavigatorDrawer") as! KYDrawerController
        
        let drawerWidth = UIScreen.main.bounds.width * 4 / 5
        navigatorDrawer.drawerWidth = drawerWidth
        return navigatorDrawer
    }
}

class TestContentWall: TestSampleData {
    override var DisplayName: String {
        get {
            return "content wall test"
        }
    }
    
    override func generateVC() -> UIViewController {
        let otherStoryboard = UIStoryboard(name: "ContentWall", bundle: nil)
        return otherStoryboard.instantiateViewController(withIdentifier: "ContentWallViewController")
    }
}

class TestLoadJson: TestSampleData {
    override var DisplayName: String {
        get {
            return "load json test"
        }
    }
    
    override func generateVC() -> UIViewController {
        let otherStoryboard = UIStoryboard(name: "Main", bundle: nil)
        return otherStoryboard.instantiateViewController(withIdentifier: "TestLoadJson")
    }
}

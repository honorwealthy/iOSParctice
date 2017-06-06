//
//  EnterViewController.swift
//  iOSPractice
//
//  Created by Schilling Chiu on 2017/6/6.
//  Copyright © 2017 honorwealthy. All rights reserved.
//

import UIKit

class EnterViewController: UIViewController {
    
    @IBOutlet weak var menuTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        menuTableView.dataSource = self
        menuTableView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

// MARK: - UITableViewDataSource

extension EnterViewController : UITableViewDataSource {
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let reusableId = "functionCell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: reusableId, for: indexPath)
        
        cell.textLabel?.text = "drawer test"
        
        return cell
    }
}

// MARK: - UITableViewDelegate

extension EnterViewController : UITableViewDelegate {
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let otherStoryboard = UIStoryboard(name: "NavigatorDrawer", bundle: nil)
        let navigatorDrawer = otherStoryboard.instantiateViewController(withIdentifier: "NavigatorDrawer") as! KYDrawerController
        
        let drawerWidth = UIScreen.main.bounds.width * 4 / 5
        navigatorDrawer.drawerWidth = drawerWidth
        
        self.present(navigatorDrawer, animated: true, completion: nil)
    }
}

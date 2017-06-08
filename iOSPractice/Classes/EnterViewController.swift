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
        
        TestList.Instance.addTest(TestNavigatorDrawer())
        TestList.Instance.addTest(TestContentWall())
        TestList.Instance.addTest(TestLoadJson())
        
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
        return TestList.Instance.SampleList.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let reusableId = "functionCell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: reusableId, for: indexPath)
        
        cell.textLabel?.text = TestList.Instance.SampleList[indexPath.item].DisplayName
        
        return cell
    }
}

// MARK: - UITableViewDelegate

extension EnterViewController : UITableViewDelegate {
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = TestList.Instance.SampleList[indexPath.item].generateVC()
        
        self.present(vc, animated: true, completion: nil)
    }
}


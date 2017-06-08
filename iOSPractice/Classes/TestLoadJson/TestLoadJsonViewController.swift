//
//  TestLoadJsonViewController.swift
//  iOSPractice
//
//  Created by Schilling Chiu on 2017/6/8.
//  Copyright © 2017 honorwealthy. All rights reserved.
//

import UIKit

class TestLoadJsonViewController: UIViewController {
    
    @IBOutlet weak var dataTableView: UITableView!
    fileprivate var dataList: [TestClassFromJson]!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        loadData()
        dataTableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    private func loadData() {
        dataList = []
        
        repeat {
            guard let url = Bundle.main.url(forResource: "story_list", withExtension: "json") else {
                break
            }
            
            guard let dataString = try? Data(contentsOf: url, options: .mappedIfSafe) else {
                break
            }
            
            guard let jsonObj = try? JSONSerialization.jsonObject(with: dataString),
                let jsonList = jsonObj as? [[String: Any]]
            else {
                break
            }
            
            for json in jsonList {
                if let data = TestClassFromJson(json: json) {
                    dataList.append(data)
                }
            }
        } while false
    }
    
    @IBAction func goBack(sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}

// MARK: - UITableViewDataSource

extension TestLoadJsonViewController : UITableViewDataSource {
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let reusableId = "dataCell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: reusableId, for: indexPath)
        
        cell.textLabel?.text = dataList[indexPath.item].Caption
        
        return cell
    }
}

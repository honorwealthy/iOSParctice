//
//  TheMainViewController.swift
//  iOSPractice
//
//  Created by Schilling Chiu on 2017/6/6.
//  Copyright © 2017 honorwealthy. All rights reserved.
//

import UIKit

class TheMainViewController: UIViewController {
    
    @IBOutlet weak var HistoryValueLabel: BorderLabel!
    
    private var historyValue: Int = 0
    private var dbConnect: CoreDataConnect! = nil

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        loadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func loadData() {
        dbConnect = CoreDataConnect(context: DatabaseController.getContext())
        if let results = dbConnect.retrieve("History", predicate: nil, sort: nil, limit: nil) {
            if results.count > 0 {
                historyValue = results[0].value(forKey: "count") as! Int
                updateValue()
            }
        }
    }
    
    private func saveData() {
        if let results = dbConnect.retrieve("History", predicate: nil, sort: nil, limit: nil) {
            if results.count > 0 {
                _ = dbConnect.update("History", predicate: nil, attributeInfo: [
                    "count" : "\(historyValue)"
                ])
            }
            else {
                _ = dbConnect.insert("History", attributeInfo: [
                    "count" : "\(historyValue)"
                ])
            }
        }
    }
    
    @IBAction func click(sender: UIButton) {
        historyValue += 1
        updateValue()
        saveData()
    }

    private func updateValue() {
        HistoryValueLabel.text = "\(historyValue)"
    }
}

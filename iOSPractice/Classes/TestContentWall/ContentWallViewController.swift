//
//  ContentWallViewController.swift
//  iOSPractice
//
//  Created by Schilling Chiu on 2017/6/6.
//  Copyright © 2017 honorwealthy. All rights reserved.
//

import UIKit

class ContentWallViewController: UIViewController {
    
    @IBOutlet var contentCollectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        contentCollectionView.dataSource = self
        contentCollectionView.delegate = self
        
        if let layout = contentCollectionView.collectionViewLayout as? StaggeredGridLayout {
            layout.delegate = self
        }
        
        contentCollectionView!.contentInset = UIEdgeInsets(top: 0, left: 5, bottom: 10, right: 5)
        
        
        // let navigation bar don't affect collection view
        self.automaticallyAdjustsScrollViewInsets = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

// MARK: - UICollectionViewDataSource

extension ContentWallViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return TestContentDataController.Instance.dataList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ContentCell", for: indexPath) as! ContentCell
        
        cell.setData(TestContentDataController.Instance.dataList[indexPath.item])
        
        return cell
    }
}

// MARK: - UICollectionViewDelegate

extension ContentWallViewController : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
//        let story = TestContentDataController.Instance.dataList[indexPath.item]
//        
//        self.performSegue(withIdentifier: "startChat", sender: story.Id)
    }
}

// MARK: - StaggeredGridLayoutDelegate

extension ContentWallViewController : StaggeredGridLayoutDelegate {
    func heightForCellAtIndexPath(_ collectionView: UICollectionView, indexPath: IndexPath, width: CGFloat) -> CGFloat {
        
        return ContentCell.calculateHeight(width, TestContentDataController.Instance.dataList[indexPath.item])
    }
}

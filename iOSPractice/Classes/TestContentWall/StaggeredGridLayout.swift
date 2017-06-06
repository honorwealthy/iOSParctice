//
//  StaggeredGridLayout.swift
//  iOSPractice
//
//  Created by Schilling Chiu on 2017/6/6.
//  Copyright © 2017 honorwealthy. All rights reserved.
//

import UIKit

protocol StaggeredGridLayoutDelegate {
    func heightForCellAtIndexPath(_ collectionView: UICollectionView, indexPath: IndexPath, width: CGFloat) -> CGFloat
}

class StaggeredGridLayout: UICollectionViewLayout {
    var delegate: StaggeredGridLayoutDelegate!
    
    fileprivate let numberOfColumns = 2
    fileprivate let cellMargin: CGFloat = 0.0
    
    fileprivate var cachedAttributes = [UICollectionViewLayoutAttributes]()
    
    fileprivate var contentHeight: CGFloat = 0.0
    fileprivate var contentWidth: CGFloat {
        let insets = collectionView!.contentInset
        return collectionView!.bounds.width - (insets.left + insets.right)
    }
    
    override func prepare() {
        cachedAttributes.removeAll()
        contentHeight = 0
        
        var column = 0
        
        let totalHorizontalMargin : CGFloat = (cellMargin * (CGFloat(numberOfColumns - 1)))
        let cellWidth = (contentWidth - totalHorizontalMargin) / CGFloat(numberOfColumns)
        
        var cellOriginXList = [CGFloat]()
        for i in 0 ..< numberOfColumns {
            let originX = CGFloat(i) * (cellWidth + cellMargin)
            cellOriginXList.append(originX)
        }
        
        var currentCellOriginYList = [CGFloat](repeating: 0, count: numberOfColumns)
        
        for item in 0 ..< collectionView!.numberOfItems(inSection: 0) {
            let indexPath = IndexPath(item: item, section: 0)
            let cellHeight = delegate.heightForCellAtIndexPath(
                collectionView!, indexPath: indexPath, width: cellWidth)
            let cellFrame = CGRect(
                x: cellOriginXList[column],
                y: currentCellOriginYList[column],
                width: cellWidth,
                height: cellHeight)
            
            let attributes = StaggeredGridLayoutAttributes(forCellWith: indexPath)
            attributes.imageHeight = cellHeight
            attributes.frame = cellFrame
            cachedAttributes.append(attributes)
            
            contentHeight = max(contentHeight, cellFrame.maxY)
            currentCellOriginYList[column] = currentCellOriginYList[column] + cellHeight + cellMargin
            
            var nextColumn = 0
            var minOriginY = CGFloat.greatestFiniteMagnitude
            let nsCurrentCellOriginYList = NSArray(array: currentCellOriginYList)
            nsCurrentCellOriginYList.enumerateObjects({ (originY, index, stop) in
                if (originY as! NSNumber).compare(minOriginY as NSNumber) == .orderedAscending {
                    minOriginY = CGFloat(originY as! NSNumber)
                    nextColumn = index
                }
            })
            
            column = nextColumn
        }
    }
    
    override var collectionViewContentSize: CGSize {
        get {
            return CGSize(width: contentWidth, height: contentHeight)
        }
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var layoutAttributes = [UICollectionViewLayoutAttributes]()
        
        for attributes in cachedAttributes {
            if attributes.frame.intersects(rect) {
                layoutAttributes.append(attributes)
            }
        }
        
        return layoutAttributes
    }
}

class StaggeredGridLayoutAttributes: UICollectionViewLayoutAttributes {
    var imageHeight : CGFloat = 0.0
    
    override func copy(with zone: NSZone?) -> Any {
        let copy = super.copy(with: zone) as! StaggeredGridLayoutAttributes
        copy.imageHeight = self.imageHeight;
        return copy;
    }
    
    override func isEqual(_ object: Any?) -> Bool {
        if let attributtes = object as? StaggeredGridLayoutAttributes {
            if attributtes.imageHeight == self.imageHeight {
                return super.isEqual(attributtes)
            }
        }
        return false;
    }
}

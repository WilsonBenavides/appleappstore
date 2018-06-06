//
//  ViewController.swift
//  appleappstore
//
//  Created by willix on 3/06/18.
//  Copyright © 2018 willix. All rights reserved.
//

import UIKit

class FeaturedAppsController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    private let cellId = "cellId"
    
    var appCategories: [AppCategory]?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //appCategories = AppCategory.sampleAppCategories()
        
        AppCategory.fetchFeaturedApps { (appCategories) in
            self.appCategories = appCategories
            self.collectionView?.reloadData()
        }
        
        collectionView?.backgroundColor = UIColor.whiteColor()
        
        collectionView?.registerClass(CategoryCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(cellId, forIndexPath: indexPath) as! CategoryCell
        
        cell.appCategory = appCategories?[indexPath.item]
        return cell
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let count = appCategories?.count {
            return count
        }
        return 0
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(view.frame.width, 230)
    }

}

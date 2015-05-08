//
//  ViewController.swift
//  AutolayoutTest
//
//  Created by Kevin Lundberg on 5/8/15.
//  Copyright (c) 2015 klundberg. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    var sizingCell: UICollectionViewCell?

    override func viewDidLoad() {
        super.viewDidLoad()

        sizingCell = collectionView?.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: NSIndexPath(forItem: 0, inSection: 0)) as? UICollectionViewCell
    }

    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {

        if let sizingCell = sizingCell { // if the sizing cell is nil, we're in viewDidLoad and we're dequeueing the initial cell used for sizing.
            sizingCell.frame.size.width = collectionView.bounds.size.width
            sizingCell.setNeedsLayout()
            sizingCell.layoutIfNeeded()

            let size = sizingCell.systemLayoutSizeFittingSize(UILayoutFittingCompressedSize)
            return size
        } else {
            return CGSize(width: 150, height: 100) // dummy size for the original sizing cell
        }
    }

    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! UICollectionViewCell
    }

}


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

        collectionView?.reloadData()
    }

    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {

        if let sizingCell = sizingCell { // if the sizing cell is nil, we're in viewDidLoad and we're dequeueing the initial cell used for sizing.

            // set the width we want the cell to be in hopes that the cell will size vertically to match the aspect ratio in the cell.
            sizingCell.frame.size.width = collectionView.bounds.size.width
            sizingCell.contentView.frame = sizingCell.bounds
            sizingCell.setNeedsLayout() // this is where the problem happens, the cell's height constraints conflict with the aspect ratio and the width, and the aspect ratio constraint is usually broken first.
            sizingCell.layoutIfNeeded()

            let size = sizingCell.contentView.systemLayoutSizeFittingSize(UILayoutFittingCompressedSize)
            // this size is the original size of the cell due to the constraint problems, not the desired full-width with respected aspect ratio.
            return size
        } else {
            return CGSize(width: 150, height: 100) // dummy size for the original sizing cell to be sized at temporarily
        }
    }

    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! UICollectionViewCell
    }

}


//
//  TeamSelectionVC.swift
//  TweetyPie
//
//  Created by Prince Agrawal on 13/05/16.
//  Copyright © 2016 Harmony Codes Technologies Pvt. Ltd. All rights reserved.
//

import UIKit

let COLLECTION_SPACING_CONSTANT:CGFloat = 5


class TeamSelectionVC: BaseVC {
    
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func onNextButtonAction(sender: UIButton) {
        let cellIndex = collectionView.indexPathsForSelectedItems()![0].item
        TwitterVM.setFavouriteTeam(TEAM.teamForIndex(cellIndex))
    }
}

extension TeamSelectionVC: UICollectionViewDataSource {
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return TEAM.count()
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("teamCell", forIndexPath: indexPath) as! TeamCollectionViewCell
        let team = TEAM.teamForIndex(indexPath.item)
        cell.imageView.image = UIImage(named: team.rawValue + "_logo")
        cell.layer.cornerRadius = 10
        return cell
    }
}

extension TeamSelectionVC: UICollectionViewDelegateFlowLayout {
    
    func cellDimensionForCollectionView(collectionView: UICollectionView) -> CGFloat {
        //get max height possible for cells
        let maxPossibleHeight = (collectionView.frame.height - (5 * COLLECTION_SPACING_CONSTANT)) / 4
        let maxPossibleWidth = (collectionView.frame.width - (3 * COLLECTION_SPACING_CONSTANT)) / 2
        let cellDimensionConstant = maxPossibleWidth > maxPossibleHeight ? maxPossibleHeight : maxPossibleWidth
        return cellDimensionConstant
    }
    
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return COLLECTION_SPACING_CONSTANT
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return COLLECTION_SPACING_CONSTANT
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let maxPossibleHeight = (collectionView.frame.height - (5 * COLLECTION_SPACING_CONSTANT)) / 4
        let maxPossibleWidth = (collectionView.frame.width - (3 * COLLECTION_SPACING_CONSTANT)) / 2
        return CGSizeMake(maxPossibleWidth, maxPossibleHeight)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(COLLECTION_SPACING_CONSTANT, COLLECTION_SPACING_CONSTANT, COLLECTION_SPACING_CONSTANT, COLLECTION_SPACING_CONSTANT)
    }
}

extension TeamSelectionVC: UICollectionViewDelegate {
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        //Enable Next Button
        nextButton.enabled = true
        
    }
}
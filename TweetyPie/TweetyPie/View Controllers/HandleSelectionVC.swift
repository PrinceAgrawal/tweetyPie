//
//  HandleSelectionVC.swift
//  TweetyPie
//
//  Created by Prince Agrawal on 13/05/16.
//  Copyright © 2016 Harmony Codes Technologies Pvt. Ltd. All rights reserved.
//

import UIKit

let HANDLE_CELL_HEIGHT:CGFloat = 100

class HandleSelectionVC: BaseVC {

    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.allowsMultipleSelection = true
    }
    
    //MARK: IBActions
    @IBAction func onBackAction(sender: UIButton) {
        navigationController?.popViewControllerAnimated(true)
    }
    
    @IBAction func onDoneAction(sender: UIButton) {
        
    }
}

extension HandleSelectionVC: UICollectionViewDataSource {
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("handleCell", forIndexPath: indexPath) as! HandleCollectionViewCell
        return cell
    }
}

extension HandleSelectionVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return COLLECTION_SPACING_CONSTANT
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return COLLECTION_SPACING_CONSTANT
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(collectionView.frame.width - (COLLECTION_SPACING_CONSTANT * 2), HANDLE_CELL_HEIGHT)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(COLLECTION_SPACING_CONSTANT, COLLECTION_SPACING_CONSTANT, COLLECTION_SPACING_CONSTANT, COLLECTION_SPACING_CONSTANT)
    }
}

extension HandleSelectionVC: UICollectionViewDelegate {
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        //Enable Done Button
        doneButton.enabled = true
    }
}
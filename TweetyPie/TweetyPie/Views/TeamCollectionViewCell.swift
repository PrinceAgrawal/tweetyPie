//
//  TeamCollectionViewCell.swift
//  TweetyPie
//
//  Created by Prince Agrawal on 13/05/16.
//  Copyright © 2016 Harmony Codes Technologies Pvt. Ltd. All rights reserved.
//

import UIKit

let TEAM_CELL_COLOUR = UIColor(white: 1, alpha: 0.25)

class TeamCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    
    override var selected: Bool {
        didSet {
            if selected {
                backgroundColor = UIColor.whiteColor()
            }
            else {
                backgroundColor = TEAM_CELL_COLOUR
            }
        }
    }
    
}

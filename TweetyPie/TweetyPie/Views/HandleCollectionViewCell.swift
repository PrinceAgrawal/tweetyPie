//
//  HandleCollectionViewCell.swift
//  TweetyPie
//
//  Created by Prince Agrawal on 13/05/16.
//  Copyright © 2016 Harmony Codes Technologies Pvt. Ltd. All rights reserved.
//

import UIKit

let HANDLE_CELL_COLOUR = UIColor(white: 1, alpha: 0.12)
let HANDLE_SELECTED_CELL_COLOUR = UIColor(white: 1, alpha: 0.75)

class HandleCollectionViewCell: UICollectionViewCell {
    
    override var selected: Bool {
        didSet {
            if selected {
                backgroundColor = HANDLE_SELECTED_CELL_COLOUR
            }
            else {
                backgroundColor = HANDLE_CELL_COLOUR
            }
        }
    }
}

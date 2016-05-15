//
//  FeedVC.swift
//  TweetyPie
//
//  Created by Prince Agrawal on 15/05/16.
//  Copyright © 2016 Harmony Codes Technologies Pvt. Ltd. All rights reserved.
//

import UIKit

class FeedVC: BaseVC {

    @IBAction func onSettingButtonAction(sender: UIButton) {
        //Select team
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let teamSelectionVC = storyBoard.instantiateViewController() as TeamSelectionVC
        navigationController!.setViewControllers([teamSelectionVC], animated: false)
    }
}

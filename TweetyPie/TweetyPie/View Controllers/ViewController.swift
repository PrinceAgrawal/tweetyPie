//
//  ViewController.swift
//  TimelinesSwift
//
//  Created by Fabric  on 5/26/15.
//  Copyright (c) 2015 Fabric. All rights reserved.
//

import UIKit
import TwitterKit

class ViewController: TWTRTimelineViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let teamName = NSUserDefaults.standardUserDefaults().stringForKey(kFavouriteTeam) {
        let team = TEAM(rawValue: teamName)
        let client = TWTRAPIClient()
        self.dataSource = TWTRUserTimelineDataSource(screenName:team!.usernameForTeam(), APIClient: client)
        }
    }

    

    
}
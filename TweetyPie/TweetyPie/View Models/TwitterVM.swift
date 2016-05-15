//
//  TwitterViewModel.swift
//  TweetyPie
//
//  Created by Prince Agrawal on 15/05/16.
//  Copyright © 2016 Harmony Codes Technologies Pvt. Ltd. All rights reserved.
//

import Foundation

enum TEAM: String {
    case DD = "DD"
    case GL = "GL"
    case KKR = "KKR"
    case KXIP = "KXIP"
    case MI = "MI"
    case RCB = "RCB"
    case RPS = "RPS"
    case SRH = "SRH"

    static func count () -> Int {
        return 8
    }
    
    static func teamForIndex(index: Int) ->TEAM {
        var team: TEAM
        switch index {
        case 0:
            team = .DD
        case 1:
            team = .GL
        case 2:
            team = .KKR
        case 3:
            team = .KXIP
        case 4:
            team = .MI
        case 5:
            team = .RCB
        case 6:
            team = .RPS
        default:
            team = .SRH
        }
        return team
    }
    
    func usernameForTeam() -> String {
        var username = ""
        switch self {
        case .DD:
            username = "DelhiDaredevils"
        case .GL:
            username = "TheGujratLions"
        case .KKR:
            username = "KKRiders"
        case .KXIP:
            username = "lionsdenkxip"
        case .MI:
            username = "mipaltan"
        case .RCB:
            username = "RCBTweets"
        case .RPS:
            username = "RPSupergiants"
        case .SRH:
            username = "RPSupergiants"
        }
        return username
    }
    
}

class TwitterVM {
    
    class func setFavouriteTeam(team: TEAM) {
        NSUserDefaults.standardUserDefaults().setValue(team.rawValue, forKey: kFavouriteTeam)
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    class func favouriteTeamForUser() -> TEAM? {
        let userDefaultsValue = NSUserDefaults.standardUserDefaults().stringForKey(kFavouriteTeam)
        if  userDefaultsValue != nil {
            return TEAM(rawValue: userDefaultsValue!)
        }
        else {
            return nil
        }
    }
}
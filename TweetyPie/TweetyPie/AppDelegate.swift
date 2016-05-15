//
//  AppDelegate.swift
//  TweetyPie
//
//  Created by Prince Agrawal on 13/05/16.
//  Copyright © 2016 Harmony Codes Technologies Pvt. Ltd. All rights reserved.
//

import UIKit
import Fabric
import TwitterKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        Twitter.sharedInstance().startWithConsumerKey("MKSc2c7QSVvQhDaP39yQCHEwM", consumerSecret: "THM1wwC32r62m1Q8JI5a7MFbuksCZmYUkvoLX25Simu4v8HGn8")
        Fabric.with([Twitter.self()])

        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        
    }

    func applicationDidBecomeActive(application: UIApplication) {
        let navigationController: UINavigationController = self.window!.rootViewController as! UINavigationController
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        Twitter.sharedInstance().logInWithCompletion { session, error in
            if (session != nil) {
                print("signed in as \(session!.userName)")
                if TwitterVM.favouriteTeamForUser() == nil {
                    //Select team
                    let teamSelectionVC = storyBoard.instantiateViewController() as TeamSelectionVC
                    navigationController.setViewControllers([teamSelectionVC], animated: false)
                }
                else {
                    //load FeedVC
                    let feedVC = storyBoard.instantiateViewController() as FeedVC
                    navigationController.setViewControllers([feedVC], animated: false)
                    
                }
            } else {
                print("error: \(error?.localizedDescription)")
                let signInVC = storyBoard.instantiateViewController() as SignInVC
                navigationController.setViewControllers([signInVC], animated: false)
            }
        }
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}


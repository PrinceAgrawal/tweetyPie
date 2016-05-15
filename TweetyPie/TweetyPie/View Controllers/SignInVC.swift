//
//  SignInVC.swift
//  TweetyPie
//
//  Created by Prince Agrawal on 15/05/16.
//  Copyright © 2016 Harmony Codes Technologies Pvt. Ltd. All rights reserved.
//

import UIKit
import TwitterKit

class SignInVC: BaseVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        addTwitterSignInButton()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func addTwitterSignInButton() {
        let logInButton = TWTRLogInButton(logInCompletion: { session, error in
            if (session != nil) {
                print("signed in as \(session!.userName)");
            } else {
                print("error: \(error!.localizedDescription)");
            }
        })
        logInButton.center.x = view.center.x
        let yPosition = view.frame.height - 50 - logInButton.frame.height
        logInButton.frame = CGRectMake(logInButton.frame.minX, yPosition , logInButton.frame.width, logInButton.frame.height)
        view.addSubview(logInButton)
    }

}

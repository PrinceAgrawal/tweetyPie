//
//  BaseVC.swift
//  TweetyPie
//
//  Created by Prince Agrawal on 13/05/16.
//  Copyright © 2016 Harmony Codes Technologies Pvt. Ltd. All rights reserved.
//

import UIKit

class BaseVC: UIViewController {
    
    var activityIndicator : UIActivityIndicatorView = {
        
        let activityInd = UIActivityIndicatorView()
        activityInd.frame = UIScreen.mainScreen().bounds
        activityInd.hidden = true
        return activityInd
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackgroundImage()
    }
    
    func showIndicator(message:String? = nil){
        self.view.addSubview(activityIndicator)
        activityIndicator.hidden = false
        
    }
    
    func hideIndicator(){
        activityIndicator.removeFromSuperview()
        activityIndicator.hidden = true
        
    }
    
    //MARK: Private Methods
    private func setBackgroundImage() {
        let bgImageView = UIImageView(frame: CGRectMake(0, 0, view.frame.width, view.frame.height))
        bgImageView.image = UIImage(named: "bg")
        view.addSubview(bgImageView)
        view.sendSubviewToBack(bgImageView)
    }
}

//
//  UIStoryboard+Instantiators.swift
//  TweetyPie
//
//  Created by Prince Agrawal on 15/05/16.
//  Copyright © 2016 Harmony Codes Technologies Pvt. Ltd. All rights reserved.
//

import UIKit

protocol StoryboardIdentifiable {
    static var storyboardIdentifier: String { get }
}

extension StoryboardIdentifiable where Self: UIViewController {
    static var storyboardIdentifier: String {
        return String(self)
    }
}
extension UIStoryboard  {
    
    /// View Controller Instantiation from Generics
    func instantiateViewController<T: UIViewController where T: StoryboardIdentifiable>() -> T {
        guard let viewController = self.instantiateViewControllerWithIdentifier(T.storyboardIdentifier) as? T else {
            fatalError("Couldn't instantiate view controller with identifier \(T.storyboardIdentifier) ")
        }
        
        return viewController
    }
}


// Conform Protocol to all the view controllers

extension UIViewController : StoryboardIdentifiable {
    
}

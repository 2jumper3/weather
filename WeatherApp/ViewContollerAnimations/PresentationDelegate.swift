//
//  PresentationDelegate.swift
//  WeatherApp
//
//  Created by Sergey on 21/02/2019.
//  Copyright © 2019 Sergey. All rights reserved.
//

import UIKit

class PresentationDelegate: NSObject, UIViewControllerTransitioningDelegate {
    let openAnimationController = OpenAnimationController(isPresented: true)
    let closeAnimationController = CloseAnimationController(isPresented: true)
    
    
    //    animator
    
    func animationController(forPresented  presented: UIViewController,
                             presenting: UIViewController,
                             source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self.openAnimationController
    }
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self.closeAnimationController
    }
}

//
//  AnimationControllers.swift
//  WeatherApp
//
//  Created by Sergey on 21/02/2019.
//  Copyright © 2019 Sergey. All rights reserved.
//

import UIKit

let animationDuration: TimeInterval = 1

class CloseAnimationController: NSObject, UIViewControllerAnimatedTransitioning {
    
    var isPresented: Bool = true
    
    init (isPresented: Bool) {
        super.init()
        self.isPresented = isPresented
        print ("close")
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return animationDuration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let fromVC = transitionContext.viewController(forKey: .from) else {
            return
        }
        
        guard let toVC = transitionContext.viewController(forKey: .to) else {
            return
        }
        
        var hintsButtonFrame: CGRect = CGRect.zero
        
        
        if let loginViewController = toVC as? LoginViewController, let hintsButton = loginViewController.hintButton {
            hintsButtonFrame = hintsButton.frame
        } else if let navViewController = toVC as? UINavigationController,
            let logincViewController = navViewController.viewControllers.first as? LoginViewController,
            let hintsButton = logincViewController.hintButton {
                hintsButtonFrame = hintsButton.frame
        }
        
        let buttonCenter = CGRect(x: hintsButtonFrame.origin.x + hintsButtonFrame.size.width / 2,
                                  y: hintsButtonFrame.origin.y + hintsButtonFrame.size.height / 2,
                                  width: 0, height: 0)
        
        transitionContext.containerView.insertSubview(toVC.view, belowSubview: fromVC.view)
        toVC.view.frame = fromVC.view.bounds
        
        UIView.animate(withDuration: self.transitionDuration(using: transitionContext), animations: {
            fromVC.view.frame = hintsButtonFrame
        }) { (finished: Bool) in
            fromVC.removeFromParent()
            
            transitionContext.completeTransition(true)
        }
    }
}


class OpenAnimationController: NSObject, UIViewControllerAnimatedTransitioning {
    
    
    var isPresented: Bool = true
    
    init (isPresented: Bool) {
       super.init()
        self.isPresented = isPresented
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return animationDuration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let fromVC = transitionContext.viewController(forKey: .from) else {
            return
        }
        
        guard let toVC = transitionContext.viewController(forKey: .to) else {
            return
        }
    
        var hintsButtonFrame: CGRect = CGRect.zero
        
        
        if let loginViewController = fromVC as? LoginViewController, let hintsButton = loginViewController.hintButton {
            hintsButtonFrame = hintsButton.frame } else if let navViewController = fromVC as? UINavigationController,
        let logincViewController = navViewController.viewControllers.first as? LoginViewController,
            let hintsButton = logincViewController.hintButton {
                hintsButtonFrame = hintsButton.frame
        }
            
        let buttonCenter = CGRect(x: hintsButtonFrame.origin.x + hintsButtonFrame.size.width / 2,
                                  y: hintsButtonFrame.origin.y + hintsButtonFrame.size.height / 2,
                                  width: 0, height: 0)
        
        transitionContext.containerView.addSubview(toVC.view)
        toVC.view.frame = buttonCenter
        
        UIView.animate(withDuration: self.transitionDuration(using: transitionContext), animations: {
            toVC.view.frame = fromVC.view.bounds
        }) { (finished: Bool) in
            
            if self.isPresented {
                fromVC.removeFromParent()
                
            } else {
                fromVC.view.removeFromSuperview()
            }            
            transitionContext.completeTransition(true)
        }
    }
}

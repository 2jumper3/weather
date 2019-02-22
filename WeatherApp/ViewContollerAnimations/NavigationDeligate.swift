//
//  NavigationDeligate.swift
//  WeatherApp
//
//  Created by Sergey on 22/02/2019.
//  Copyright © 2019 Sergey. All rights reserved.
//

import UIKit

class NavigationDeligate: NSObject, UINavigationControllerDelegate {
    let openAnimationController = OpenAnimationController(isPresented: false)
    let closeAnimationController = CloseAnimationController(isPresented: false)
    
    //MARK
    
    func navigationController(_ navigationController: UINavigationController,
                              animationControllerFor operation: UINavigationController.Operation,
                              from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        var controller: UIViewControllerAnimatedTransitioning?
        
        switch operation {
        case .none:
            break
        case .push:
            controller = self.openAnimationController
        case .pop:
            controller = self.closeAnimationController
        }
        return controller
        
        
    }
}

class internalNavigationController: UINavigationController, UINavigationControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
    }
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if operation == .push {
            return PushAnimation()
        } else if operation == .pop {
            return PopAnimation()
        }
        return nil
    }
    
}

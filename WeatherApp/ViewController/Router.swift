//
//  Router.swift
//  WeatherApp
//
//  Created by Sergey on 21/02/2019.
//  Copyright © 2019 Sergey. All rights reserved.
//

import UIKit

class Router: NSObject {

    let presentationDelegate = PresentationDelegate()
    let navigationDeligate = NavigationDeligate()

    
    
    func openHints() {
        guard let viewController = self.getHintsViewController() else {
            return
        }
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        
        guard let navigationController = appDelegate.window?.rootViewController as? UINavigationController else {
            return
        }
        
        navigationController.delegate = self.navigationDeligate
        navigationController.pushViewController(viewController, animated: true)

//        let transition = CATransition()
//        transition.duration = 1
//        transition.type = CATransitionType.push
//        transition.subtype = CATransitionSubtype.fromLeft
//        appDelegate.window?.rootViewController?.view.window?.layer.add(transition, forKey: kCATransition)

//        viewController.transitioningDelegate = self.presentationDelegate
        
//        appDelegate.window?.rootViewController?.present(viewController, animated: true, completion: nil)
        
    }
    
    func closeHints(viewController: HintsViewController?) {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        
        guard let navigationController = appDelegate.window?.rootViewController as? UINavigationController else {
            return
        }
        
        
        navigationController.popViewController(animated: true)
        //        let transition = CATransition()
//        transition.duration = 0.5
//        transition.type = CATransitionType.push
//        transition.subtype = CATransitionSubtype.fromRight
//        viewController?.view.window?.layer.add(transition, forKey: kCATransition)

        
//        viewController?.dismiss(animated: true, completion: nil)
        
    }
    
    private func getHintsViewController () -> HintsViewController? {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        guard let viewController = storyBoard.instantiateViewController(withIdentifier: "HintsViewController") as? HintsViewController else
        {
            return nil
        }
        return viewController
    }
}

//
//  HintsViewController.swift
//  WeatherApp
//
//  Created by Sergey on 21/02/2019.
//  Copyright © 2019 Sergey. All rights reserved.
//

import UIKit

class HintsViewController: UIViewController {
    
    let router = Router()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let swipe = UISwipeGestureRecognizer(target: self, action: #selector(closeBySwipe))
        swipe.direction = .left
        self.view.addGestureRecognizer(swipe)
    }
    
    @objc func closeBySwipe() {
        self.router.closeHints(viewController: self)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

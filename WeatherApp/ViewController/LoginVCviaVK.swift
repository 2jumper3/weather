//
//  LoginVCviaVK.swift
//  WeatherApp
//
//  Created by Sergey on 12/03/2019.
//  Copyright © 2019 Sergey. All rights reserved.
//

import UIKit


class LoginVCviaVK: UIViewController {
    
    
    @IBOutlet private weak var loginButton:UIButton?
    @IBOutlet private weak var scrollView:UIScrollView?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        assignbackground()

    }
    
    @IBAction func loginButtonAction ()  {
//        self.performSegue(withIdentifier: "openVKLogin", sender: nil)
        self.navigationController?.pushViewController(VKViewController(), animated: true)

    }
    
    
    func assignbackground(){
        let background = UIImage(named: "wallaper")
        
        var imageView : UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode =  UIView.ContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubviewToBack(imageView)
    }
    
    @objc func keyboardWasShown (notification: Notification) {
        let info = notification.userInfo! as NSDictionary
        let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)
        
        self.scrollView?.contentInset = contentInsets
        scrollView?.scrollIndicatorInsets = contentInsets
    }
    
    @objc func keyboardWillBeHidden (notification: Notification) {
        let contentInsets = UIEdgeInsets.zero
        scrollView?.contentInset = contentInsets
        scrollView?.scrollIndicatorInsets = contentInsets
    }
}

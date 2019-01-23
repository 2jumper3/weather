//
//  LoginViewController.swift
//  WeatherApp
//
//  Created by Sergey on 21/01/2019.
//  Copyright © 2019 Sergey. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet private weak var scrollView:UIScrollView?
    
    @IBOutlet private weak var titleLabel:UILabel?

    @IBOutlet private weak var loginFieldLabel:UILabel?
    @IBOutlet private weak var loginTextBox:UITextField?
    
    @IBOutlet private weak var passwordFieldLabel:UILabel?
    @IBOutlet private weak var passwordTextBox:UITextField?
    
    @IBOutlet private weak var loginButton:UIButton?

    private let demoLogin = "123"
    private let demoPass = "456"

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func loginButtonAction ()  {
        print ("weather is good")
        
        guard let loginText  = self.loginTextBox?.text else {
            print ("no login")
            return
        }
        guard let passwordText = self.passwordTextBox?.text else {
            print ("no password")
            return
        }
        if self.demoLogin == loginText && self.demoPass == passwordText {
            print ("success")
            
        } else {
            print ( "login or password wrong")
        }
    }
    
    @IBAction func closeKeyboard () {
        self.view.endEditing(true)
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
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWasShown), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillBeHidden(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        

    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
}

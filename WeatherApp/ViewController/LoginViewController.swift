//
//  LoginViewController.swift
//  Friends Store
//
//  Created by Sergey on 21/01/2019.
//  Copyright © 2019 Sergey. All rights reserved.
//

import UIKit




class LoginViewController: UIViewController {
    
    var loginDelegate: LoginAPIProtocol = Login.shared
    
    @IBOutlet private weak var scrollView:UIScrollView?
    
    @IBOutlet private weak var titleLabel:UILabel?

    @IBOutlet private weak var loginFieldLabel:UILabel?
    @IBOutlet private weak var loginTextBox:UITextField?
    
    @IBOutlet private weak var passwordFieldLabel:UILabel?
    @IBOutlet private weak var passwordTextBox:UITextField?
    
    @IBOutlet private weak var loginButton:UIButton?
    
    @IBOutlet private weak var loader: Loader?
    @IBOutlet private weak var loaderNew: LoaderNew?

    @IBOutlet private weak var label: UILabel?
    

    @IBOutlet weak var labelWidthConstraint: NSLayoutConstraint?
    
    @IBOutlet weak var hintButton: UIButton?

    let router = Router()

    private let demoLogin = ""
    private let demoPass = ""
    
    @objc   func presentBySwipe() {
        self.router.openHints()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.scrollView?.alpha = 0
        self.passwordTextBox?.isSecureTextEntry = true
        assignbackground()

        let swipe = UISwipeGestureRecognizer(target: self, action: #selector(presentBySwipe))
        swipe.direction = .right
        self.view.addGestureRecognizer(swipe)
       
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.loader?.start()
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0, execute: {
            self.loader?.stop()
            self.loaderStopped()
        })
    }
    
    
   

    // Actions
    
    @IBAction func loginButtonAction ()  {
        guard let loginText  = self.loginTextBox?.text else {
            print ("no login")
            return
        }
        guard let passwordText = self.passwordTextBox?.text else {
            print ("no password")
            return
        }
        if self.demoLogin == loginText && self.demoPass == passwordText {
            
//            self.performSegue(withIdentifier: "openApp", sender: nil)
            self.navigationController?.pushViewController(VKViewController(), animated: true)


            self.login(login: loginText, password: passwordText) { (error: Error?) in
//                self.performSegue(withIdentifier: "openApp", sender: nil)
                self.navigationController?.pushViewController(VKViewController(), animated: true)

            }
//            let manager = Login.shared
//            manager.loginCompletion = { (error: Error?) in
//                self.performSegue(withIdentifier: "openApp", sender: nil)
//            }
//            manager.login(login: loginText, password: passwordText)
        } else {
            self.errorAlert()
        }
    }
    @IBAction func logOut (segue: UIStoryboardSegue?) {
        
    }
    
    @IBAction func closeKeyboard () {
        self.view.endEditing(true)
    }
    
    @IBAction func hintsButtonAction() {
        self.router.openHints()
    }
    
//    Алерты
    
    func successAlert () {
    let alertController = UIAlertController(title: "Login", message: "Success", preferredStyle: .alert)
    let alertOk = UIAlertAction(title: "Succes", style: .cancel) { (action: UIAlertAction) in }
    alertController.addAction(alertOk)
    self.present(alertController, animated: true, completion: nil)
    }
    func errorAlert () {
        let alertController = UIAlertController(title: "Login", message: "Wrong Login or Password", preferredStyle: .alert)
        let alertOk = UIAlertAction(title: "Done", style: .cancel) { (action: UIAlertAction) in }
        alertController.addAction(alertOk)
        self.present(alertController, animated: true, completion: nil)
    }
    
   //Клавиатура
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
        self.loader?.start()
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0, execute: {
            self.loader?.stop()
            self.loaderStopped()
        })
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWasShown), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillBeHidden(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        self.navigationController?.navigationBar.backgroundColor = UIColor.green
        

    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func loaderStopped() {
        UIView.animate(withDuration: 1,
                       delay: 0,
                       options: [.curveEaseOut],
                       animations: {
//                        self.labelWidthConstraint?.constant = self.view.frame.size.height
                        self.view.layoutIfNeeded()
                        
        }) { (finished: Bool) in
            
            UIView.animate(withDuration: 2, animations: {
                self.scrollView?.alpha = 1
            }, completion: { (finished: Bool) in
            })
        }
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
}


extension LoginViewController {
    func login(login: String, password: String, completion: @escaping (Error?) -> ()) {
//        self.loginDelegate.login(login: login, password: password , completion: completion)
        self.navigationController?.pushViewController(VKViewController(), animated: true)

    }
}


//
//  SecondViewController.swift
//  WeatherApp
//
//  Created by Sergey on 28/01/2019.
//  Copyright © 2019 Sergey. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.backgroundColor = UIColor.red
    }
    
    @IBAction func testButton () {
        let alertController = UIAlertController(title: "Login", message: "Success", preferredStyle: .alert)
        let alertOk = UIAlertAction(title: "Succes", style: .cancel) { (action: UIAlertAction) in }
        alertController.addAction(alertOk)
        self.present(alertController, animated: true, completion: nil)
    }
    
//@IBAction func 
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

 }

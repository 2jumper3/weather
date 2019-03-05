//
//  LoginAPI.swift
//  WeatherApp
//
//  Created by Sergey on 04/03/2019.
//  Copyright © 2019 Sergey. All rights reserved.
//

import UIKit


protocol LoginAPIProtocol: class {
    func login(login: String, password: String, completion: @escaping (Error?) -> ())
    
    func login(login: String, password: String)
    var loginCompletion: ((Error?) -> ())? {get set}
    
    var userName: String? {get}
    
    func changeUserName(newUserName: String)
}

class Login {
    
    private init () {}
    
    static var shared: LoginAPIProtocol = DefaultLoginAPIManager()

}
// Синглтон для хранения сессии
class Session {
    
    static let shared = Session()
    
    private init () {}
    
    var userName: String?
    var tokenID: Int?
}



private class DefaultLoginAPIManager: LoginAPIProtocol {
    var loginCompletion: ((Error?) -> ())?
    var userName: String?
    
    func changeUserName(newUserName: String) {
        self.userName = newUserName
    }

    
    func login(login: String, password: String) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.0, execute: {
            if let completion = self.loginCompletion {
                completion (nil)
            }
        })
    }
    
    func login(login: String, password: String, completion: @escaping (Error?) -> ()) {
        
        print("login")
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: {
            completion(nil)
            
        })
    }
}

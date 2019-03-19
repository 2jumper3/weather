//
//  LoginAPI.swift
//  WeatherApp
//
//  Created by Sergey on 04/03/2019.
//  Copyright © 2019 Sergey. All rights reserved.
//

import UIKit
import Alamofire


protocol LoginAPIProtocol: class {
    func login(login: String, password: String, completion: @escaping (Error?) -> ())
    
    func getWeather(completion: @escaping (Error?) -> ())
}

class Login {
    
    private init () {}
    
    static var shared: LoginAPIProtocol = URLSessionAPIManeger()

}

private class URLSessionAPIManeger: LoginAPIProtocol {
    func login(login: String, password: String, completion: @escaping (Error?) -> ()) {
        completion(nil)
    }
    func getWeather(completion: @escaping (Error?) -> ()) {
        let requestData = RequestData.createRequestDataForGetWeather()
        
        self.execute(requestData: requestData) { (data: Data?, error: Error?) in
            completion(error)
        }
    }

    // MARK -
    func execute(requestData: RequestData, completion: @escaping (Data?, Error?) -> ()) {
        
        var urlComponents = URLComponents()
        urlComponents.scheme = requestData.sheme
        urlComponents.host = requestData.host
        urlComponents.path = requestData.path
        
        var urlQueryItems: [URLQueryItem] = []
        
        for getParm in requestData.getParms.values {
            
        }
        urlComponents.queryItems = urlQueryItems
        
//        if let url 
//
//        var request = URLRequest(url: urlComponents.url, cachePolicy: <#T##URLRequest.CachePolicy#>, timeoutInterval: <#T##TimeInterval#>)

    }
}

// Синглтон для хранения сессии
class Session {
    
    static let shared = Session()
    
    private init () {}
    
    var userName: String?
    var tokenID: String?
}



private class DefaultLoginAPIManager: LoginAPIProtocol {
    var loginCompletion: ((Error?) -> ())?
    var userName: String?
    
    func getWeather(completion: @escaping (Error?) -> ()) {completion(nil)
}

    
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

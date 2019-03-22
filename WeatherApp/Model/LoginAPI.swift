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
    
    func getFriends(completion: @escaping (UserInfoMainResponse?, Error?) -> ())
}

class Login {
    
    private init () {}
    
    static var shared: LoginAPIProtocol = URLSessionAPIManager()

}

private class URLSessionAPIManager: LoginAPIProtocol {
    
    var urlSession: URLSession?
    
    var showLogs = true
    
    init() {
        let config = URLSessionConfiguration.default
        self.urlSession = URLSession(configuration: config)
    }
    
    func login(login: String, password: String, completion: @escaping  (Error?) -> ()) {
        completion(nil)
    }
    
    func getFriends(completion: @escaping  (UserInfoMainResponse?, Error?) -> ()) {
        let requestData = RequestData.createRequestDataForGetFriends()
        self.execute(requestData: requestData) { (data: Data?, error: Error?) in
            let response = Parser.parse(data: data)
            completion(response, nil)
        }
    }
    
    // MARK: -
    
    func execute(requestData: RequestData, completion: @escaping  (Data?, Error?) -> ()) {
        
        if self.showLogs {
            print("execute \(String(describing: requestData.generateURL()))")
        }
        
        guard let request = requestData.generateRequest() else {
            completion(nil, nil)
            return
        }
        
        let dataTask = self.urlSession?.dataTask(with: request, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) in
            
            if let httpResponse: HTTPURLResponse = response as? HTTPURLResponse {
                let status = httpResponse.statusCode // 401
            }
            
            if self.showLogs {
                if let responseData = data {
                    let dataString = String(data: responseData, encoding: .utf8)
                }
            }
            
            
            OperationQueue.main.addOperation({
                completion(data, error)
            })
            
        })
        dataTask?.resume()
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
    func getFriends(completion: @escaping (UserInfoMainResponse?, Error?) -> ()) {
        let requestData = RequestData.createRequestDataForGetFriends()
    }
    
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

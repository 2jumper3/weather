//
//  RequestData.swift
//  WeatherApp
//
//  Created by Sergey on 07/03/2019.
//  Copyright © 2019 Sergey. All rights reserved.
//

import Foundation

let openweatherAppId = "b1b15e88fa797225412429c1c50c122a1"


class RequestData {
    
    var sheme: String = "http"
    var host: String  = "samples.openweathermap.org"
    var path: String  = "/data/2.5/forecast"
    var getParms: [String:String] = [:]
    
    var method: String = "GET"
    
    var body: Data?
    
    var timeout: TimeInterval?
    
    func generateURL() -> URL? {
        var urlComponents = URLComponents()
        urlComponents.scheme = self.sheme
        urlComponents.host = self.host
        urlComponents.path = self.path
        
        var urlQueryItems: [URLQueryItem] = []
        for getParmKey in self.getParms.keys {
            let item = URLQueryItem(name: getParmKey, value: self.getParms[getParmKey])
            urlQueryItems.append(item)
        }
        urlComponents.queryItems = urlQueryItems
        
        return urlComponents.url
    }
    
    func generateRequest() -> URLRequest? {
        guard let url = self.generateURL() else {
            return nil
        }
        
        var request = URLRequest(url: url,
                                 cachePolicy: .reloadIgnoringCacheData,
                                 timeoutInterval: self.timeout ?? 15)
        request.setValue("iOS", forHTTPHeaderField: "User-Info")
        request.httpMethod = self.method
        request.httpBody = self.body
        
        return request
    }
}

extension RequestData {
//https://api.vk.com/method/friends.get?order=name&fields=nickname&access_token=f2af025ca36f42d75d140048677e7d4185f0c1a1aea36c26084c7466131b36f3608391692d6922a5d6790&v=5.52
    static func createRequestDataForGetFriends() -> RequestData {
        let requestData = RequestData()
        
        requestData.sheme = "https"
        requestData.host = "api.vk.com"
        requestData.path = "method/friends.get"
        
        
        var getParms: [String:String] = [:]
        getParms["ACCESS_TOKEN"] = Session.shared.tokenID
        getParms["v"] = "5.92"
        getParms["order"] = "name"
        getParms["fields"] = "nickname"
        
        
        return requestData
    }
    //    https://api.vk.com/method/users.get?user_id=210700286&v=5.52

    static func createRequestDataForGetInfo(accessToken: String) -> RequestData {
        let requestData = RequestData()
        
        requestData.sheme = "https"
        requestData.host = "api.vk.com"
        requestData.path = "method/users.get"
        
        
        var getParms: [String:String] = [:]
        getParms["ACCESS_TOKEN"] = Session.shared.tokenID
        getParms["v"] = "5.92"
        
        return requestData
    }
}




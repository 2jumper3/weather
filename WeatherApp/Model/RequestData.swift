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
    var host: String = "samples.openweathermap.org"
    var path: String = "/data/2.5/forecast"
    var getParms: [String:String] = [:]
    var method: String = "GET"
    var body: String?
}

extension RequestData {
    static func createRequestDataForGetWeather () -> RequestData {
        let requestData = RequestData()
        
        var getParms: [String:String] = [:]
        getParms["q"] = "Moscow,DE"
        getParms["appid"] = openweatherAppId
        requestData.getParms = getParms

        return requestData
    }
}

//
//  VKManager.swift
//  WeatherApp
//
//  Created by Sergey on 25/03/2019.
//  Copyright © 2019 Sergey. All rights reserved.
//

import Foundation


class VKManager {
    
    static let shared = VKManager()
    
    
    func removeGroup() {
        // send notification
    }
    
    
    
    func reloadWeather(date: Date, completionCache: @escaping (WeatherDay) -> (), completionUpdated: @escaping (WeatherDay) -> () ) {
        
        // Запрос к серверу -> запись в БД
        OperationQueue.main.addOperation {
            completionUpdated( WeatherDay() )
        }
        
        
        
    }
    
    func getWeather(date: Date, completionCache: @escaping (WeatherDay) -> (), completionUpdated: @escaping (WeatherDay) -> () ) {
        
        // Запрос БД
        OperationQueue.main.addOperation {
            completionCache( WeatherDay() )
        }
        
        //self.reloadWeather(date: date, completionCache: <#T##(WeatherDay) -> ()#>, completionUpdated: <#T##(WeatherDay) -> ()#>)
        
        //
        //        // Запрос к серверу -> запись в БД
        //        OperationQueue.main.addOperation {
        //            completionUpdated( WeatherDay() )
        //        }
        //
        //
        
    }
}

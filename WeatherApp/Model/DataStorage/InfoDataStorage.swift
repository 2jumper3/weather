//
//  InfoDataStorage.swift
//  WeatherApp
//
//  Created by Sergey on 18/03/2019.
//  Copyright © 2019 Sergey. All rights reserved.
//

import Foundation

class InfoDataStorage {
    
    init() {}
    
    private let userDefaults = UserDefaults.standard
    
    static let shared = InfoDataStorage()
    
    let hintsKey = "hintsKey"
    
    func wasHintShown() -> Bool {
        return self.userDefaults.bool(forKey: self.hintsKey)
    }
    
    func hintWasShown() {
        self.userDefaults.set(true, forKey: self.hintsKey)
        self.userDefaults.synchronize()
    }
}

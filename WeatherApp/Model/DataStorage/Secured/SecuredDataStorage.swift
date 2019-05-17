//
//  SecuredDataStorage.swift
//  WeatherApp
//
//  Created by Sergey on 18/03/2019.
//  Copyright © 2019 Sergey. All rights reserved.
//

import Foundation


class SecuredDataStorage {
    
    private let item = KeychainPasswordItem(service: KeychainConfiguration.serviceName, account: "accessToken")
    
    static let shared = SecuredDataStorage()
    
    func getAccessToken() -> String? {
        do {
            let accessToken = try item.readPassword()
            return accessToken
        } catch {
            print("getAccessToken exception \(#file) \(#function) \(#line) \(error)")
        }
        
        return nil
    }
    
    func saveAccessToken(accessToken: String) {
        do {
            try self.item.savePassword(accessToken)
        } catch {
            print("getAccessToken exception \(#file) \(#function) \(#line) \(error)")
        }
    }
}

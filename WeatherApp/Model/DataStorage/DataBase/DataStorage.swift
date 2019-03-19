//
//  DataStorage.swift
//  WeatherApp
//
//  Created by Stanislav Ivanov on 15/03/2019.
//  Copyright © 2019 Stanislav Ivanov. All rights reserved.
//


import Foundation



// SOLID
// O - open\close
// I - interface


// VIPER, Entity


protocol IDataStorage {
    func save(userInfoMainResponse: UserInfoMainResponse, completion: @escaping () -> () )
    func load(completion: @escaping ([UserInfoMainResponse]) -> () )
}


class DataStorage {
    private init() {}
#if DEBUG
//    static let shared: IDataStorage = RealmDataStorage()
#else
    static let shared: IDataStorage = FakeDataStorage()
#endif
}


class FakeDataStorage: IDataStorage {
    
    let delayDispathQueue = DispatchQueue(label: "FakeDataStorage delayDispathQueue")
    
    func save(userInfoMainResponse: UserInfoMainResponse, completion: @escaping () -> () ) {
        self.delayDispathQueue.asyncAfter(deadline: .now() + 1) {
            DispatchQueue.main.async {
                completion()
            }
        }
    }
    
    func load(completion: @escaping ([UserInfoMainResponse]) -> () ) {
        self.delayDispathQueue.asyncAfter(deadline: .now() + 1) {
            DispatchQueue.main.async {
                completion([])
            }
        }
    }
}

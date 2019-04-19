////
////  DataStorage.swift
////  WeatherApp
////
////  Created by Sergey Udalov on 15/03/2019.
////  Copyright © 2019 Sergey Udalov. All rights reserved.
////
//
//
import Foundation



// SOLID
// O - open\close
// I - interface


// VIPER, Entity


protocol IDataStorage {
    func save(friendsInfoResponse: FriendsInfoResponse, completion: @escaping () -> () )
    func load(completion: @escaping ([FriendsInfoResponse]) -> () )
}
//
//
//class DataStorage {
//    private init() {}
//#if DEBUG
////    static let shared: IDataStorage = RealmDataStorage()
//#else
//    static let shared: IDataStorage = FakeDataStorage()
//#endif
//}
//
//
//class FakeDataStorage: IDataStorage {
//    
//    let delayDispathQueue = DispatchQueue(label: "FakeDataStorage delayDispathQueue")
//    
//    func save(userInfoMainResponse: UserInfoMainResponse, completion: @escaping () -> () ) {
//        self.delayDispathQueue.asyncAfter(deadline: .now() + 1) {
//            DispatchQueue.main.async {
//                completion()
//            }
//        }
//    }
//    
//    func load(completion: @escaping ([UserInfoMainResponse]) -> () ) {
//        self.delayDispathQueue.asyncAfter(deadline: .now() + 1) {
//            DispatchQueue.main.async {
//                completion([])
//            }
//        }
//    }
//}

////
////  RealmDataStorage.swift
////  WeatherApp
////
////  Created by Sergey on 19/03/2019.
////  Copyright © 2019 Sergey. All rights reserved.
////
//
//import Foundation
////import Realm
//
//class UserInfoResponseObject: Object {
//      @objc dynamic var id: Int = 0
//      @objc dynamic var first_name: String = ""
//      @objc dynamic var last_name: String = ""
//}
//
//
//class UserInfoMainResponseObject: Object {
//
//    let response = List<UserInfoResponseObject>()
//    
//    static func createFrom(userInfoMainResponse: UserInfoMainResponse) -> UserInfoMainResponseObject {
//        let object = UserInfoMainResponseObject()
//        
//        object.cod = weatherResponse.cod
//        object.message = weatherResponse.message
//        object.count = weatherResponse.count
//        
//        for item in weatherResponse.list {
//            let itemObject = WeatherItemResponseObject()
//            itemObject.dtString = item.dtString
//            itemObject.temp = item.main.temp
//            
//            object.list.append(itemObject)
//        }
//        
//        return object
//    }
//    
//    func create() -> WeatherResponse {
//        let weatherResponse = WeatherResponse()
//        
//        weatherResponse.cod = self.cod
//        weatherResponse.message = self.message
//        weatherResponse.count = self.count
//        
//        for itemObject in self.list {
//            let item = WeatherItemResponse()
//            item.dtString = itemObject.dtString
//            item.main.temp = itemObject.temp
//            
//            weatherResponse.list.append(item)
//        }
//        
//        return weatherResponse
//    }
//}
//
//class RealmDataStorage: IDataStorage {
//    
//    let dispathQueue = DispatchQueue(label: "RealmDataStorage")
//    
//    var realm: Realm?
//    
//    init() {
//        self.dispathQueue.sync {
//            do {
//                self.realm = try Realm()
//            } catch {
//                print("RealmDataStorage init exception \(#file) \(#function) \(#line) \(error)")
//            }
//        }
//    }
//    
//    func save(weatherResponse: WeatherResponse, completion: @escaping () -> () ) {
//        
//        self.dispathQueue.sync {
//            guard let realm = self.realm else {
//                completion()
//                return
//            }
//            
//            let object = WeatherResponseObject.createFrom(weatherResponse: weatherResponse)
//            do {
//                try realm.write {
//                    realm.add(object)
//                }
//            } catch {
//                print("save WeatherResponse exception \(#file) \(#function) \(#line) \(error)")
//            }
//            
//            DispatchQueue.main.async {
//                completion()
//            }
//        }
//    }
//    
//    func load(completion: @escaping ([WeatherResponse]) -> () ) {
//        self.dispathQueue.sync {
//            guard let realm = self.realm else {
//                completion([])
//                return
//            }
//            
//            var responses: [WeatherResponse] = []
//            
//            let objects = realm.objects(WeatherResponseObject.self)
//            for object in objects {
//                let response = object.create()
//                responses.append(response)
//            }
//            
//            DispatchQueue.main.async {
//                completion(responses)
//            }
//        }
//    }
//    
//}
//
////*

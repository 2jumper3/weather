//
//  RealmDataStorage.swift
//  WeatherApp
//
//  Created by Sergey on 19/03/2019.
//  Copyright © 2019 Sergey. All rights reserved.
//

import Foundation
import RealmSwift

class FriendsInfoResponseObject: Object {
      @objc dynamic var id: Int = 0
      @objc dynamic var first_name: String = ""
      @objc dynamic var last_name: String = ""


    
    static func createFrom(friendsInfoResponse: FriendsInfoResponse) -> FriendsInfoResponseObject {
        let object = FriendsInfoResponseObject()
        
        object.id           = friendsInfoResponse.id
        object.first_name   = friendsInfoResponse.first_name
        object.last_name    = friendsInfoResponse.last_name
        
        
        return object
    }
    
    func create() -> FriendsInfoResponse {
        let friendsResponse = FriendsInfoResponse()
        
        friendsResponse.id           = self.id
        friendsResponse.last_name    = self.last_name
        friendsResponse.first_name   = self.first_name
        
        
        return friendsResponse
    }
}

class RealmDataStorage: IDataStorage {
    
    let dispathQueue = DispatchQueue(label: "RealmDataStorage")
    
    var realm: Realm?
    
    

    init() {
        self.dispathQueue.sync {
            
//            let config = Realm.Configuration (
//                // Set the new schema version. This must be greater than the previously used
//                // version (if you've never set a schema version before, the version is 0).
//                schemaVersion: 1,
//                migrationBlock: { migration, oldSchemaVersion in
//                    if oldSchemaVersion < 1 {
//                        migration.enumerateObjects(ofType: FriendsInfoResponseObject.className()) { (oldItem, newItem) in
//                            newItem?["first_name"] = false
//                        }
//                    }
//            })
//            
//            Realm.Configuration.defaultConfiguration = config
            
//            do {
//                self.realm = try Realm()
//                realm?.beginWrite()
//                try realm?.commitWrite()
//            } catch {
//                print("RealmDataStorage init exception \(#file) \(#function) \(#line) \(error)")
//            }
        }
    }
    
    func save(friendsInfoResponse: FriendsInfoResponse, completion: @escaping () -> () ) {
        
        self.dispathQueue.sync {
            guard let realm = try? Realm() else {
//            guard let realm = self.realm else {
                completion()
                return
            }
            
            let object = FriendsInfoResponseObject.createFrom(friendsInfoResponse: friendsInfoResponse)
            do {
                try realm.write {
                    realm.add(object, update: true)
                }
            } catch {
                print("save FriendsInfoResponse exception \(#file) \(#function) \(#line) \(error)")
            }
            
            DispatchQueue.main.async {
                completion()
            }
        }
    }
    
    func load(completion: @escaping ([FriendsInfoResponse]) -> () ) {
        self.dispathQueue.sync {
            guard let realm = self.realm else {
                completion([])
                return
            }
            
            var responses: [FriendsInfoResponse] = []
            
            let objects = realm.objects(FriendsInfoResponseObject.self)
            for object in objects {
                let response = object.create()
                responses.append(response)
            }
            
            DispatchQueue.main.async {
                completion(responses)
            }
        }
    }
    
    func delete(friendsInfoResponse: [FriendsInfoResponse], completion: @escaping () -> () ) {
        self.dispathQueue.sync {
            guard let realm = try? Realm() else {
                completion()
                return
            }
            
            var objects: [FriendsInfoResponseObject] = []
            for response in friendsInfoResponse {
                let object = FriendsInfoResponseObject.createFrom(friendsInfoResponse: response)
                objects.append(object)
            }
            
            do {
                try realm.write {
                    realm.delete(objects)
                }
            } catch {
                print("save FriendsInfoResponse exception \(#file) \(#function) \(#line) \(error)")
            }
            
            
            DispatchQueue.main.async {
                completion()
            }
        }
    }
    
}

//*

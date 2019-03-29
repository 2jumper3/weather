//
//  CoreDataDataStorage.swift
//  WeatherApp
//
//  Created by Sergey Udalov on 15/03/2019.
//  Copyright © 2019 Sergey Udalov. All rights reserved.
//

import Foundation
import CoreData

class CoreDataDataStorage: IDataStorage {
    
    var allItems = [Any]()
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Model")
        
        container.loadPersistentStores(completionHandler: { (_, error) in
            guard let error = error as NSError? else { return }
            fatalError("Unresolved error: \(error), \(error.userInfo)")
        })
        
        container.viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        container.viewContext.undoManager = nil
        container.viewContext.shouldDeleteInaccessibleFaults = true
        
        container.viewContext.automaticallyMergesChangesFromParent = true
        
        return container
    }()
    
    func save(friendsInfoMainResponse: FriendsInfoMainResponse, completion: @escaping () -> () ) {
        
        self.persistentContainer.performBackgroundTask { (context: NSManagedObjectContext) in
            self.addNewFrom(friendsResponse: friendsInfoMainResponse, context: context)
            do {
                try context.save()
            } catch {
                print("save friendsInfoMainResponse exception \(#file) \(#function) \(#line) \(error)")
            }
            
            DispatchQueue.main.async {
                completion()
            }
        }
    }
    
    func load(completion: @escaping ([FriendsInfoMainResponse]) -> () ) {
        
        self.persistentContainer.performBackgroundTask { (context: NSManagedObjectContext) in
            var responses: [FriendsInfoMainResponse] = []
            
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "WeatherResponseEntity")
            
            do {
                let entities = try context.fetch(fetchRequest)
                
                for entity in entities {
                    guard let entity = entity as? FriendsInfoMainResponseEntity else {
                        continue
                        
                    }
                    
                    let response = self.createFrom(entity: entity)
                    responses.append(response)
                }
                
            } catch {
                print("load FriendsInfoMainResponse exception \(#file) \(#function) \(#line) \(error)")
            }
            
            DispatchQueue.main.async {
                completion(responses)
            }
        }
    }
    
    
    func addNewFrom(friendsResponse: FriendsInfoMainResponse, context: NSManagedObjectContext) {
        guard let entity = NSEntityDescription.insertNewObject(forEntityName: "FriendsInfoMainResponseEntity", into: context) as? FriendsInfoMainResponseEntity else {
            return
        }

        entity.response = friendsResponse.response.items

        for item in friendsResponse.response.items {
            guard let itemEntity = NSEntityDescription.insertNewObject(forEntityName: "FriendsInfoResponse", into: context) as? FriendsInfoResponseEntity
                else {
                continue
            }

            itemEntity.first_name   = item.first_name
            itemEntity.last_name    = item.first_name
            itemEntity.id           = Int64(item.id)
            allItems = friendsResponse.response.items
        
            
            entity.addToResponse(allItems)

    }
        
}
    
    
    func createFrom(entity: FriendsInfoMainResponseEntity) -> FriendsInfoMainResponse {
        let friendsResponse = FriendsInfoMainResponse()
        
        allItems = entity.response
     
        
        if let list = entity.response {
            for itemEntity in list {
                guard let itemEntity = itemEntity as? FriendsInfoResponseEntity else {
                    continue
                }
                
                let item = FriendsInfoResponse()
                
                item.first_name = itemEntity.first_name ?? ""
                item.last_name  = itemEntity.last_name ?? ""
                item.id         = Int(itemEntity.id)
             
                friendsResponse.response.items.append(item)
                
            }
        }
        
        
        return friendsResponse
    }
}


//
//  CoreDataStorage.swift
//  WeatherApp
//
//  Created by Sergey on 19/03/2019.
//  Copyright © 2019 Sergey. All rights reserved.
//

import Foundation
import CoreData

class CoreDataStorage: IDataStorage {
    
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
    
    func save(userInfoMainResponse: UserInfoMainResponse, completion: @escaping () -> () ) {
        
        self.persistentContainer.performBackgroundTask { (context: NSManagedObjectContext) in
            self.addNewFrom(userInfoMainResponse: userInfoMainResponse, context: context)
            do {
                try context.save()
            } catch {
                print("save userInfoMainResponse exception \(#file) \(#function) \(#line) \(error)")
            }
            
            DispatchQueue.main.async {
                completion()
            }
        }
    }
    
    func load(completion: @escaping ([UserInfoMainResponse]) -> () ) {
        
        self.persistentContainer.performBackgroundTask { (context: NSManagedObjectContext) in
            var responses: [UserInfoMainResponse] = []
            
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "UserInfoMainResponse")
            
            do {
                let entities = try context.fetch(fetchRequest)
                
                for entity in entities {
                    guard let entity = entity as? UserInfoMainResponse else {
                        continue
                    }
                    
                    let response = self.createFrom(entity: entity)
                    responses.append(response)
                }
                
            } catch {
                print("load UserInfoMainResponse exception \(#file) \(#function) \(#line) \(error)")
            }
            
            DispatchQueue.main.async {
                completion(responses)
            }
        }
    }
    
    // MARK: -
    
    func addNewFrom(userInfoMainResponse: UserInfoMainResponse, context: NSManagedObjectContext) {
        guard let entity = NSEntityDescription.insertNewObject(forEntityName: "UserInfoMainResponse", into: context) as? UserInfoMainResponse else {
            return
        }
        
    
        for item in userInfoMainResponse.response {
            guard let itemEntity = NSEntityDescription.insertNewObject(forEntityName: "UserInfoResponseEntity", into: context) as? UserInfoMainResposeEntity else {
                continue
            }
            itemEntity.dtString = item.dtString
            itemEntity.temp = item.main.temp
            
            entity.addToList(itemEntity)
        }
    }
    
    func createFrom(entity: UserInfoMainResponseEntity) -> UserInfoMainResponse {
        let userInfoMainResponse = UserInfoMainResponse()
        
        if let response = entity.response {
            for itemEntity in response {
                guard let itemEntity = itemEntity as? UserInfoResponseEntity else {
                    continue
                }
                
                let item = UserInfoResponseEntity()
                item.first_name = itemEntity.first_name ?? ""
                item.last_name = itemEntity.last_name
                item.id = itemEntity.id
                
                userInfoMainResponse.response.append(item)
            }
        }
        
        
        return userInfoMainResponse
    }
}



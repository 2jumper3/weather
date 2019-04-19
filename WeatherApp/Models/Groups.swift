//
//  File.swift
//  WeatherApp
//
//  Created by Sergey on 31/01/2019.
//  Copyright © 2019 Sergey. All rights reserved.
//

import Foundation
import RealmSwift

class Group {
    var name: String?
}
class Friend {
    var first_name: String?
    var last_name: String?
    
    init(first_name: String, last_name: String) {
        self.first_name = first_name
        self.last_name = last_name
    }
}

class FriendObject: Object {
    @objc dynamic var first_name: String = ""
    
    @objc dynamic var last_name: Bool = false
    
    override static func primaryKey() -> String? {
        return "first_name"
    }
}


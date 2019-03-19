//
//  Parser.swift
//  WeatherApp
//
//  Created by Sergey on 14/03/2019.
//  Copyright © 2019 Sergey. All rights reserved.
//

import Foundation


class FriendsVK: Decodable {
    var friendID: Int = 0
    
    init () {}
    
    enum CodingKeys: String, CodingKey {
        case friendID = "friendID"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        friendID = try container.decode(Int.self, forKey: .friendID)
    }
}
//
//class FriendsVKResponse: Decodable {
//    var list = [FriendsVK]
//}
//
////https://api.vk.com/method/users.get?user_id=210700286&v=5.52

class UserInfoResponse: Decodable {
//{"response":[{"id":210700286,"first_name":"Lindsey","last_name":"Stirling"}]}
    var id: Int = 0
    var first_name: String = ""
    var last_name: String = ""
    
    init () {}

    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case first_name = "first_name"
        case last_name = "last_name"
    }
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        first_name = try container.decode(String.self, forKey: .first_name)
        last_name = try container.decode(String.self, forKey: .last_name)
    }
    }
    


class UserInfoMainResponse: Decodable {
    var response: [UserInfoResponse] = []
    
    init () {}
    
    enum CodingKeys: String, CodingKey {
        case response = "response"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        response = try container.decode([UserInfoResponse].self, forKey: .response)
}
}


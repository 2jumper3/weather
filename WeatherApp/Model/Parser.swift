//
//  Parser.swift
//  WeatherApp
//
//  Created by Sergey on 14/03/2019.
//  Copyright © 2019 Sergey. All rights reserved.
//

import Foundation


class FriendsVK: Decodable {
    var friendID: Int
    
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

class UserInfo: Decodable {
//{"response":[{"id":210700286,"first_name":"Lindsey","last_name":"Stirling"}]}
    var id: Int
    var first_name: String
    var last_name: String
    
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
    


class UserInfoResponse: Decodable {
    var response: [UserInfo]
    
    enum CodingKeys: String, CodingKey {
        case response = "response"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        response = try container.decode([UserInfo].self, forKey: .response)
}
}


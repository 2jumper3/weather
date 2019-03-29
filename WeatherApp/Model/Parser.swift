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
//https://api.vk.com/method/friends.get?order=name&fields=nickname&access_token=f2af025ca36f42d75d140048677e7d4185f0c1a1aea36c26084c7466131b36f3608391692d6922a5d6790&v=5.52

class FriendsInfoResponse: Decodable {

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

class FriendsInfoItemsResponse: Decodable {
    
    var items: [FriendsInfoResponse] = []
    
    init () {}
    
    enum CodingKeys: String, CodingKey {
        case items = "items"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        items = try container.decode([FriendsInfoResponse].self, forKey: .items)
    }
}

class FriendsInfoMainResponse: Decodable {
    
    var response: FriendsInfoItemsResponse = FriendsInfoItemsResponse()
    
    init () {}
    
    enum CodingKeys: String, CodingKey {
        case response = "response"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        response = try container.decode(FriendsInfoItemsResponse.self, forKey: .response)
    }
}

class Parser {
    
    static func parse(data: Data?) -> FriendsInfoMainResponse? {
        guard let data = data else {
            return nil
        }
        do {
            let decoder = JSONDecoder()
            let response: FriendsInfoMainResponse = try decoder.decode(FriendsInfoMainResponse.self, from: data)
            return response
        } catch {
            print("JSONDecoder exception \(#file) \(#function) \(#line) \(error)")
        }
        return nil
    }
}


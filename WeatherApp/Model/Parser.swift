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
    
    static func parseFriends(data: Data?) -> FriendsInfoMainResponse? {
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
    
    static func parseNews(data: Data?) -> NewsFeedMainResponse? {
        guard let data = data else {
            return nil
        }
        do {
            let decoder = JSONDecoder()
            let response: NewsFeedMainResponse = try decoder.decode(NewsFeedMainResponse.self, from: data)
            return response
        } catch {
            print("JSONDecoder exception \(#file) \(#function) \(#line) \(error)")
        }
        return nil
    }

}

//https://api.vk.com/method/newsfeed.get?count=1&filter=post&v=5.92&access_token=e1ac3ee28f34d4ac9ab99d8e947525ec386c34d1cfc9f4056d7be8b2ffa1659d8a565651ed2523433e3d7

class NewsFeedMainResponse: Decodable {
    var response: NewsFeedResponse
    
    enum CodingKeys: String, CodingKey {
        case response
    }
    
    init () {}
    
    required init (from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        response = try container.decode(NewsFeedResponse.self, forKey: .response)
    }
}

class NewsFeedResponse: Decodable {
    
    var items: [NewsFeedResponseItems] = []
    var profiles: [NewsFeedResponseProfiles] = []
    var groups: [NewsFeedResponseGroups] = []
    
    enum CodingKeys: String, CodingKey {
        case items
        case profiles
        case groups
    }
    
    required init (from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        items = try container.decode([NewsFeedResponseItems].self, forKey: .items)
        profiles = try container.decode([NewsFeedResponseProfiles].self, forKey: .profiles)

    }
    
}

class NewsFeedResponseItems: Decodable {
    var type: String
    var source_id: Int
    var date: TimeInterval
    var text: String
    var marked_as_ads: Int?
    var comments: NewsFeedResponseItemsComments
    var likes: NewsFeedResponseItemsLikes
    var reposts: NewsFeedResponseItemsReposts
    var views: NewsFeedResponseItemsRepostsViews
    var is_favorite: Bool
    var post_id: Int
    
    enum CodingKeys: String, CodingKey {
        case type
        case source_id
        case date
        case text
        case marked_as_ads
        case attachments
        case comments
        case likes
        case reposts
        case views
        case is_favorite
        case post_id
    }
    
    
    required init (from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        type = try container.decode(String.self, forKey: .type)
        source_id = try container.decode(Int.self, forKey: .source_id)
        date = try container.decode(TimeInterval.self, forKey: .date)
        text = try container.decode(String.self, forKey: .text)
        marked_as_ads = try? container.decode(Int.self, forKey: .marked_as_ads)
        comments = try container.decode(NewsFeedResponseItemsComments.self, forKey: .comments)
        likes = try container.decode(NewsFeedResponseItemsLikes.self, forKey: .likes)
        reposts = try container.decode(NewsFeedResponseItemsReposts.self, forKey: .reposts)
        views = try container.decode(NewsFeedResponseItemsRepostsViews.self, forKey: .views)
        is_favorite = try container.decode(Bool.self, forKey: .is_favorite)
        post_id = try container.decode(Int.self, forKey: .post_id)
    }
    
    
}



class NewsFeedResponseItemsComments: Codable {
    var count: Int
    var can_post: Int
    
    enum CodingKeys: String, CodingKey {
        case count
        case can_post
    }

    required init (from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        count = try container.decode(Int.self, forKey: .count)
        can_post = try container.decode(Int.self, forKey: .can_post)
    }
}

class NewsFeedResponseItemsLikes: Codable {
    var count: Int
    var user_likes: Int
    var can_like: Int
    var can_publish: Int
    
    enum CodingKeys: String, CodingKey {
        case count
        case user_likes
        case can_like
        case can_publish
    }

    required init (from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        count = try container.decode(Int.self, forKey: .count)
        user_likes = try container.decode(Int.self, forKey: .user_likes)
        can_like = try container.decode(Int.self, forKey: .can_like)
        can_publish = try container.decode(Int.self, forKey: .can_publish)
    }
}

class NewsFeedResponseItemsReposts: Codable {
    var count: Int
    var user_reposted: Int
    
    enum CodingKeys: String, CodingKey {
        case count
        case user_reposted
    }
    
    required init (from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        count = try container.decode(Int.self, forKey: .count)
        user_reposted = try container.decode(Int.self, forKey: .user_reposted)
    }
}

class NewsFeedResponseItemsRepostsViews: Codable {
    var count: Int
    
    enum CodingKeys: String, CodingKey {
        case count
    }

    required init (from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        count = try container.decode(Int.self, forKey: .count)
    }
}

class NewsFeedResponseGroups: Codable {
    var id: Int
    var name: String
    var photo_100: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case photo_100
    }

    required init (from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        photo_100 = try container.decode(String.self, forKey: .photo_100)
    }
}

class NewsFeedResponseProfiles: Codable {
    var id: Int
    var first_name: String
    var last_name: String
    var photo_100: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case first_name
        case last_name
        case photo_100
    }

    required init (from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        first_name = try container.decode(String.self, forKey: .first_name)
        last_name = try container.decode(String.self, forKey: .last_name)
        photo_100 = try container.decode(String.self, forKey: .photo_100)
    }
}



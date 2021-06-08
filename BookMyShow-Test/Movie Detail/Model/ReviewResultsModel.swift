//
//  ReviewResultsModel.swift
//  BookMyShow-Test
//
//  Created by Prathamesh Mestry on 08/06/21.
//

import Foundation

class ReviewResultsModel: Codable {
    
    let author: String?
    let authorDetails: [AuthorDetailsModel]?
    let content: String?
    let createdAt: String?
    let id: String?
    let updatedAt: String?
    let url: String?

    enum CodingKeys: String, CodingKey {
        case author = "author"
        case authorDetails = "author_details"
        case content = "content"
        case createdAt = "created_at"
        case id = "id"
        case updatedAt = "updated_at"
        case url = "url"
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.author = try values.decodeIfPresent(String.self, forKey: .author)
        self.authorDetails = try values.decodeIfPresent([AuthorDetailsModel].self, forKey: .authorDetails)
        self.content = try values.decodeIfPresent(String.self, forKey: .content)
        self.createdAt = try values.decodeIfPresent(String.self, forKey: .createdAt)
        self.id = try values.decodeIfPresent(String.self, forKey: .id)
        self.updatedAt = try values.decodeIfPresent(String.self, forKey: .updatedAt)
        self.url = try values.decodeIfPresent(String.self, forKey: .url)
    }
}



class AuthorDetailsModel: Codable {
    
    let name: String?
    let username: String?
    let avatarPath: String?
    let rating: Int?

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case username = "username"
        case avatarPath = "avatar_path"
        case rating = "rating"
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try values.decodeIfPresent(String.self, forKey: .name)
        self.username = try values.decodeIfPresent(String.self, forKey: .username)
        self.avatarPath = try values.decodeIfPresent(String.self, forKey: .avatarPath)
        self.rating = try values.decodeIfPresent(Int.self, forKey: .rating)
    }
}

//
//  MovieCreditModel.swift
//  BookMyShow-Test
//
//  Created by Prathamesh Mestry on 08/06/21.
//

import Foundation

class MovieCreditModel: Codable {
    
    let id: Int?
    let cast: [MovieCastDetailModel]?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case cast = "cast"
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try values.decodeIfPresent(Int.self, forKey: .id)
        self.cast = try values.decodeIfPresent([MovieCastDetailModel].self, forKey: .cast)
    }
    
}

class MovieCastDetailModel: Codable {

    let adult: Bool?
    let gender: Int?
    let id: Int?
    let knownDepartment: String?
    let name: String?
    let originalName: String?
    let popularity: Double?
    let profilePath: String?
    let castId: Int?
    let character: String?
    let creditId: String?
    let order: Int?

    enum CodingKeys: String, CodingKey {
        case adult = "adult"
        case gender = "gender"
        case id = "id"
        case knownDepartment = "known_for_department"
        case name = "name"
        case originalName = "original_name"
        case popularity = "popularity"
        case profilePath = "profile_path"
        case castId = "cast_id"
        case character = "character"
        case creditId = "credit_id"
        case order = "order"
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.adult = try values.decodeIfPresent(Bool.self, forKey: .adult)
        self.gender = try values.decodeIfPresent(Int.self, forKey: .gender)
        self.id = try values.decodeIfPresent(Int.self, forKey: .id)
        self.knownDepartment = try values.decodeIfPresent(String.self, forKey: .knownDepartment)
        self.name = try values.decodeIfPresent(String.self, forKey: .name)
        self.originalName = try values.decodeIfPresent(String.self, forKey: .originalName)
        self.popularity = try values.decodeIfPresent(Double.self, forKey: .popularity)
        self.profilePath = try values.decodeIfPresent(String.self, forKey: .profilePath)
        self.castId = try values.decodeIfPresent(Int.self, forKey: .castId)
        self.character = try values.decodeIfPresent(String.self, forKey: .character)
        self.creditId = try values.decodeIfPresent(String.self, forKey: .creditId)
        self.order = try values.decodeIfPresent(Int.self, forKey: .order)
    }
}

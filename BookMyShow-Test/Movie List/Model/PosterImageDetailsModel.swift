//
//  PosterImageDetailsModel.swift
//  BookMyShow-Test
//
//  Created by Prathamesh Mestry on 09/06/21.
//

import Foundation

class PosterImageDetailsModel : Codable {
    
    let baseURL: String?
    let secureBaseURL: String?
    let backdropSizes: [String]?
    let logoSizes: [String]?
    let posterSizes: [String]?
    let profileSizes: [String]?
    let stillSizes: [String]?
    
    enum CodingKeys: String, CodingKey {
        case baseURL = "base_url"
        case secureBaseURL = "secure_base_url"
        case backdropSizes = "backdrop_sizes"
        case logoSizes = "logo_sizes"
        case posterSizes = "poster_sizes"
        case profileSizes = "profile_sizes"
        case stillSizes = "still_sizes"
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.baseURL = try values.decodeIfPresent(String.self, forKey: .baseURL)
        self.secureBaseURL = try values.decodeIfPresent(String.self, forKey: .secureBaseURL)
        self.backdropSizes = try values.decodeIfPresent([String].self, forKey: .backdropSizes)
        self.logoSizes = try values.decodeIfPresent([String].self, forKey: .logoSizes)
        self.posterSizes = try values.decodeIfPresent([String].self, forKey: .posterSizes)
        self.profileSizes = try values.decodeIfPresent([String].self, forKey: .profileSizes)
        self.stillSizes = try values.decodeIfPresent([String].self, forKey: .stillSizes)
    }
    
}

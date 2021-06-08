//
//  SimilarMoviesDetailModel.swift
//  BookMyShow-Test
//
//  Created by Prathamesh Mestry on 08/06/21.
//

import Foundation

class SimilarMoviesDetailModel: Codable {
    
    let adult: Bool?
    let backdropPath: String?
    let id: Int?
    let originalLanguage: String?
    let originalTitle: String?
    let overview: String?
    let releaseDate: String?
    let posterPath: String?
    let popularity: Double?
    let title: String?
    let video: Bool?
    let voteAverage: Int?
    let voteCount: Int?

    enum CodingKeys: String, CodingKey {
        case adult = "adult"
        case backdropPath = "backdrop_path"
        case id = "id"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview = "overview"
        case releaseDate = "release_date"
        case posterPath = "poster_path"
        case popularity = "popularity"
        case title = "title"
        case video = "video"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.adult = try values.decodeIfPresent(Bool.self, forKey: .adult)
        self.backdropPath = try values.decodeIfPresent(String.self, forKey: .backdropPath)
        self.id = try values.decodeIfPresent(Int.self, forKey: .id)
        self.originalLanguage = try values.decodeIfPresent(String.self, forKey: .originalLanguage)
        self.originalTitle = try values.decodeIfPresent(String.self, forKey: .originalTitle)
        self.overview = try values.decodeIfPresent(String.self, forKey: .overview)
        self.releaseDate = try values.decodeIfPresent(String.self, forKey: .releaseDate)
        self.posterPath = try values.decodeIfPresent(String.self, forKey: .posterPath)
        self.popularity = try values.decodeIfPresent(Double.self, forKey: .popularity)
        self.title = try values.decodeIfPresent(String.self, forKey: .title)
        self.video = try values.decodeIfPresent(Bool.self, forKey: .video)
        self.voteAverage = try values.decodeIfPresent(Int.self, forKey: .voteAverage)
        self.voteCount = try values.decodeIfPresent(Int.self, forKey: .voteCount)
    }
    
}

//
//  MovieDetailModel.swift
//  BookMyShow-Test
//
//  Created by Prathamesh Mestry on 04/06/21.
//

import Foundation

class MovieDetailModel: Codable {

    let posterUrl: String?
    let isMovieAdult: Bool?
    let movieOverview: String?
    let releaseDate: String?
    let id: Int?
    let movieOriginalTitle: String?
    let language: String?
    let title: String?
    let backdropPath: String?
    let popularity: Double?
    let voteCount: Int?
    let isVideo: Bool?
    let voteAverage: Double?
    
    enum CodingKeys: String, CodingKey {
        case posterUrl = "poster_path"
        case isMovieAdult = "adult"
        case movieOverview = "overview"
        case releaseDate = "release_date"
        case id = "id"
        case movieOriginalTitle = "original_title"
        case language = "original_language"
        case title = "title"
        case backdropPath = "backdrop_path"
        case popularity = "popularity"
        case voteCount = "vote_count"
        case isVideo = "video"
        case voteAverage = "vote_average"
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.posterUrl = try values.decodeIfPresent(String.self, forKey: .posterUrl)
        self.isMovieAdult = try values.decodeIfPresent(Bool.self, forKey: .isMovieAdult)
        self.movieOverview = try values.decodeIfPresent(String.self, forKey: .movieOverview)
        self.releaseDate = try values.decodeIfPresent(String.self, forKey: .releaseDate)
        self.id = try values.decodeIfPresent(Int.self, forKey: .id)
        self.movieOriginalTitle = try values.decodeIfPresent(String.self, forKey: .movieOriginalTitle)
        self.language = try values.decodeIfPresent(String.self, forKey: .language)
        self.title = try values.decodeIfPresent(String.self, forKey: .title)
        self.backdropPath = try values.decodeIfPresent(String.self, forKey: .backdropPath)
        self.popularity = try values.decodeIfPresent(Double.self, forKey: .popularity)
        self.voteCount = try values.decodeIfPresent(Int.self, forKey: .voteCount)
        self.isVideo = try values.decodeIfPresent(Bool.self, forKey: .isVideo)
        self.voteAverage = try values.decodeIfPresent(Double.self, forKey: .popularity)
    }
    
}

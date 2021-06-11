//
//  MovieSynopsisModel.swift
//  BookMyShow-Test
//
//  Created by Prathamesh Mestry on 05/06/21.
//

import Foundation

class MovieSynopsisModel: Codable {
    
    let isMovieAdult: Bool?
    let backdropPath: String?
    let budget: Int?
    let homePage: String?
    let id: Int?
    let imdbId: String?
    let language: String?
    let movieOriginalTitle: String?
    let movieOverview: String?
    let popularity: Double?
    let posterPath: String?
    let productionCompanies: [ProductionCompaniesModel]?
    let productionCountries: [ProductionCountriesModel]?
    let releaseDate: String?
    let movieStatus: String?
    let tagLine: String?
    let title: String?
    let isVideo: Bool?
    let voteAverage: Double?
    let voteCount: Int?

    enum CodingKeys: String, CodingKey {
        case isMovieAdult = "adult"
        case backdropPath = "backdrop_path"
        case budget = "budget"
        case homePage = "homepage"
        case id = "id"
        case imdbId = "imdb_id"
        case language = "original_language"
        case movieOriginalTitle = "original_title"
        case movieOverview = "overview"
        case popularity = "popularity"
        case posterPath = "poster_path"
        case productionCompanies = "production_companies"
        case productionCountries = "production_countries"
        case releaseDate = "release_date"
        case movieStatus = "status"
        case tagLine = "tagline"
        case title = "title"
        case isVideo = "video"
        case voteCount = "vote_count"
        case voteAverage = "vote_average"
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.isMovieAdult = try values.decodeIfPresent(Bool.self, forKey: .isMovieAdult)
        self.backdropPath = try values.decodeIfPresent(String.self, forKey: .backdropPath)
        self.budget = try values.decodeIfPresent(Int.self, forKey: .budget)
        self.homePage = try values.decodeIfPresent(String.self, forKey: .homePage)
        self.id = try values.decodeIfPresent(Int.self, forKey: .id)
        self.imdbId = try values.decodeIfPresent(String.self, forKey: .imdbId)
        self.language = try values.decodeIfPresent(String.self, forKey: .language)
        self.movieOriginalTitle = try values.decodeIfPresent(String.self, forKey: .movieOriginalTitle)
        self.movieOverview = try values.decodeIfPresent(String.self, forKey: .movieOverview)
        self.popularity = try values.decodeIfPresent(Double.self, forKey: .popularity)
        self.posterPath = try values.decodeIfPresent(String.self, forKey: .posterPath)
        self.productionCompanies = try values.decodeIfPresent([ProductionCompaniesModel].self, forKey: .productionCompanies)
        self.productionCountries = try values.decodeIfPresent([ProductionCountriesModel].self, forKey: .productionCountries)
        self.releaseDate = try values.decodeIfPresent(String.self, forKey: .releaseDate)
        self.movieStatus = try values.decodeIfPresent(String.self, forKey: .movieStatus)
        self.tagLine = try values.decodeIfPresent(String.self, forKey: .tagLine)
        self.title = try values.decodeIfPresent(String.self, forKey: .title)
        self.isVideo = try values.decodeIfPresent(Bool.self, forKey: .isVideo)
        self.voteCount = try values.decodeIfPresent(Int.self, forKey: .voteCount)
        self.voteAverage = try values.decodeIfPresent(Double.self, forKey: .voteAverage)
    }
    
}

//
//  MoviePlayingModel.swift
//  BookMyShow-Test
//
//  Created by Prathamesh Mestry on 04/06/21.
//

import Foundation

class MoviePlayingModel: Codable {

    let pageNumber: Int?
    let movieResult: [MovieDetailModel]?
    let totalPages: Int?
    let totalResults: Int?
    
    enum CodingKeys: String, CodingKey {
        case pageNumber = "page"
        case movieResult = "results"
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.pageNumber = try values.decodeIfPresent(Int.self, forKey: .pageNumber)
        self.movieResult = try values.decodeIfPresent([MovieDetailModel].self, forKey: .movieResult)
        self.totalPages = try values.decodeIfPresent(Int.self, forKey: .totalPages)
        self.totalResults = try values.decodeIfPresent(Int.self, forKey: .totalResults)
    }

}

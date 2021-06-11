//
//  SimilarMoviesModel.swift
//  BookMyShow-Test
//
//  Created by Prathamesh Mestry on 08/06/21.
//

import Foundation

class SimilarMoviesModel: Codable {

    let page: Int?
    let results: [SimilarMoviesDetailModel]?
    let totalPages: Int?
    let totalResults: Int?
    
    enum CodingKeys: String, CodingKey {
        case page = "page"
        case results = "results"
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.page = try values.decodeIfPresent(Int.self, forKey: .page)
        self.results = try values.decodeIfPresent([SimilarMoviesDetailModel].self, forKey: .results)
        self.totalPages = try values.decodeIfPresent(Int.self, forKey: .totalPages)
        self.totalResults = try values.decodeIfPresent(Int.self, forKey: .totalResults)
    }
}

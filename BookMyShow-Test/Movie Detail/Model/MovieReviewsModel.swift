//
//  MovieReviewsModel.swift
//  BookMyShow-Test
//
//  Created by Prathamesh Mestry on 08/06/21.
//

import Foundation

class MovieReviewsModel: Codable {

    let id: Int?
    let page: Int?
    let results: [ReviewResultsModel]?
    let totalPages: Int?
    let totalResults: Int?
 
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case page = "page"
        case results = "results"
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try values.decodeIfPresent(Int.self, forKey: .id)
        self.page = try values.decodeIfPresent(Int.self, forKey: .page)
        self.results = try values.decodeIfPresent([ReviewResultsModel].self, forKey: .results)
        self.totalPages = try values.decodeIfPresent(Int.self, forKey: .totalPages)
        self.totalResults = try values.decodeIfPresent(Int.self, forKey: .totalResults)
    }
}

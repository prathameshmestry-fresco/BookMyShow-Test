//
//  MoviePosterImageModel.swift
//  BookMyShow-Test
//
//  Created by Prathamesh Mestry on 09/06/21.
//

import Foundation

class MoviePosterImageModel: Codable {
    
    let images: PosterImageDetailsModel?

    enum CodingKeys: String, CodingKey {
        case images = "images"
    }

    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.images = try values.decodeIfPresent(PosterImageDetailsModel.self, forKey: .images)
    }
    
}

//
//  ProductionCompaniesModel.swift
//  BookMyShow-Test
//
//  Created by Prathamesh Mestry on 05/06/21.
//

import Foundation

class ProductionCompaniesModel: Codable {
    
    let id: Int?
    let logoPath: String?
    let name: String?
    let originalCountry: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case logoPath = "logo_path"
        case name = "name"
        case originalCountry = "origin_country"
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try values.decodeIfPresent(Int.self, forKey: .id)
        self.logoPath = try values.decodeIfPresent(String.self, forKey: .logoPath)
        self.name = try values.decodeIfPresent(String.self, forKey: .name)
        self.originalCountry = try values.decodeIfPresent(String.self, forKey: .originalCountry)
    }
}

class ProductionCountriesModel: Codable {
    
    let isoCountry: String?
    let name: String?
    
    enum CodingKeys: String, CodingKey {
        case isoCountry = "iso_3166_1"
        case name = "name"
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.isoCountry = try values.decodeIfPresent(String.self, forKey: .isoCountry)
        self.name = try values.decodeIfPresent(String.self, forKey: .name)
    }
}

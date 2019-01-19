//
//  Model.swift
//  Sample
//
//  Created by Rajanikant Hole on 1/16/19.
//  Copyright © 2019 rajnikant. All rights reserved.
//

import Foundation

struct Model : Codable {
    let title : String?
    let rows : [Rows]?
    
    enum CodingKeys: String, CodingKey {
        
        case title = "title"
        case rows = "rows"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        rows = try values.decodeIfPresent([Rows].self, forKey: .rows)
    }
    
}

struct Rows : Codable {
    let title : String?
    let description : String?
    let imageHref : String?
    
    enum CodingKeys: String, CodingKey {
        
        case title = "title"
        case description = "description"
        case imageHref = "imageHref"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        description = try values.decodeIfPresent(String.self, forKey: .description)
        imageHref = try values.decodeIfPresent(String.self, forKey: .imageHref)
    }
    
}


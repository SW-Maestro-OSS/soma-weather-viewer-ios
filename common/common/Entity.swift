//
//  Entity.swift
//  common
//
//  Created by 김민령 on 2022/09/05.
//

import Foundation

struct Weather: Codable {
    let id: Int
    let status: String
    let icon: String
    
    enum CodingKeys: String, CodingKeys {
        case list
        case weather
        case id
        case description
        case icon
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
//        let response = try values.nestedContainer(keyedBy: CodingKeys.self, forKey: .list)
//        let weather = try values.nestedContainer(keyedBy: CodingKeys.self, forKey: .weather)
        
        self.id = try container.decode(Int.self, forKey: .id)
        self.status = try container.decode(String.self, forKey: .description)
        self.icon = try container.decode(String.self, forKey: .icon)
        
    }
}

struct ForecastWeather: Codable {
    let weather: [Weather]
    
    enum CodingKeys: String, CodingKeys {
        case list
        case weather
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let response = try values.nestedContainer(keyedBy: CodingKeys.self, forKey: .list)
        
        let weather = try response.decode(Weather.self, forKey: .weather)
        
    }
}

Decoder.([Weather])

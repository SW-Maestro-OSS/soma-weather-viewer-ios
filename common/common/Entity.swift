//
//  Entity.swift
//  common
//
//  Created by 김민령 on 2022/09/05.
//

import Foundation

struct Weather: Decodable {
    let id: Int
    let status: String
    let icon: String

    enum CodingKeys: String, CodingKey {
        case weather
        case id
        case description
        case icon
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        let response = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .weather)
        
        self.id = try response.decode(Int.self, forKey: .id)
        self.status = try response.decode(String.self, forKey: .description)
        self.icon = try response.decode(String.self, forKey: .icon)

    }
}

struct ForecastWeather: Decodable {
    let weather: [Weather]

    enum CodingKeys: String, CodingKey {
        case list
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.weather = try container.decode([Weather].self, forKey: .list)
        
//        weather = try response.decode([Weather].self, forKey: .weather)

    }
}

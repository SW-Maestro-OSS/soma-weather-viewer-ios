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
    let temp: Float
    let minTemp: Float
    let maxTemp: Float
    let humidity: Int

    enum CodingKeys: String, CodingKey {
        case weather
        case main
        case id
        case description
        case icon
        case temp
        case temp_min
        case temp_max
        case humidity
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        let weather = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .weather)
        let main = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .main)
        
        self.id = try weather.decode(Int.self, forKey: .id)
        self.status = try weather.decode(String.self, forKey: .description)
        self.icon = try weather.decode(String.self, forKey: .icon)
        self.temp = try main.decode(Float.self, forKey: .temp)
        self.minTemp = try main.decode(Float.self, forKey: .temp_min)
        self.maxTemp = try main.decode(Float.self, forKey: .temp_max)
        self.humidity = try main.decode(Int.self, forKey: .humidity)
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

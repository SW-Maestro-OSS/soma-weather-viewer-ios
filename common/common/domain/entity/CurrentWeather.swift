//
//  CurrentWeather.swift
//  home
//
//  Created by 김상우 on 2022/09/22.
//

import Foundation

// 현재 날씨
public struct CurrentWeather: Decodable {
    let weatherInfo: WeatherInfo
    let tempInfo: TempInfo
    
    enum CodingKeys: String, CodingKey {
        case weather
        case main
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let weatherList = try container.decode([WeatherInfo].self, forKey: .weather)
        self.weatherInfo = weatherList.first!
        self.tempInfo = try container.decode(TempInfo.self, forKey: .main)
        
    }
}


struct WeatherInfo: Decodable {
    let id: Int
    let status: String
    let icon: String
    
    
    enum CodingKeys: String, CodingKey {
        case id
        case description
        case icon
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id = try container.decode(Int.self, forKey: .id)
        self.status = try container.decode(String.self, forKey: .description)
        self.icon = try container.decode(String.self, forKey: .icon)
    }
    
    
}

struct TempInfo: Decodable{
    let temp: Float
    let minTemp: Float
    let maxTemp: Float
    let humidity: Int
    
    enum CodingKeys: String, CodingKey {
        case temp
        case temp_min
        case temp_max
        case humidity
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.temp = try container.decode(Float.self, forKey: .temp)
        self.minTemp = try container.decode(Float.self, forKey: .temp_min)
        self.maxTemp = try container.decode(Float.self, forKey: .temp_max)
        self.humidity = try container.decode(Int.self, forKey: .humidity)
    }
    
}
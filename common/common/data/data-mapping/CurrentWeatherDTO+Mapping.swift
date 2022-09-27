//
//  CurrentWeatherDTO+Mapping.swift
//  common
//
//  Created by 김상우 on 2022/09/27.
//

import Foundation

// MARK: - Data Transfer Object

public struct CurrentWeatherDTO: Decodable {
    let weatherInfo: [WeatherInfoDTO]
    let mainInfo: MainInfoDTO
    let dataText: String
    
    enum CodingKeys: String, CodingKey {
        case weatherInfo = "weather"
        case mainInfo = "main"
        case dataText = "dt_txt"
    }
}


//// status 수정하기
//struct WeatherInfoDTO: Decodable {
//    let detail: WeatherInfoDetailDTO
//}


struct WeatherInfoDTO: Decodable {
    let id: Int
    let description: String
    let icon: String
}


struct MainInfoDTO: Decodable {
    let temp: Float
    let tempMin: Float
    let tempMax: Float
    let humidity: Int
    
    enum CodingKeys: String, CodingKey {
        case temp
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case humidity
    }
}

// MARK: - Mapping to Domain

extension CurrentWeatherDTO {
    public func toDomain() -> CurrentWeather {
        let urlStringPreffix = "https://openweathermap.org/img/wn/"
        let urlStringSuffix = "@2x.png"
        let iconURL = urlStringPreffix + weatherInfo[0].icon + urlStringSuffix
        
        return .init(date: DateParser.shared.getCurrentDate(),
                     weatherStatus: WeatherParser.shared.mappingStatus(status: weatherInfo[0].description),
                     weatherIcon: iconURL,
                     temp: mainInfo.temp,
                     tempMax: mainInfo.tempMax,
                     tempMin: mainInfo.tempMax,
                     humidity: mainInfo.humidity)
    }
}

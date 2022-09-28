//
//  CurrentWeatherDTO+Mapping.swift
//  common
//
//  Created by 김상우 on 2022/09/27.
//

import Foundation

// MARK: - Data Transfer Object

public struct CurrentWeatherDTO: Decodable {
    let weatherInfo: [WeatherInfoDTO]?
    let mainInfo: MainInfoDTO?
    let dataText: String?
    
    enum CodingKeys: String, CodingKey {
        case weatherInfo = "weather"
        case mainInfo = "main"
        case dataText = "dt_txt"
    }
}


struct WeatherInfoDTO: Decodable {
    let id: Int?
    let description: String?
    let icon: String?
}


struct MainInfoDTO: Decodable {
    let temp: Float?
    let tempMin: Float?
    let tempMax: Float?
    let humidity: Int?
    
    enum CodingKeys: String, CodingKey {
        case temp
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case humidity
    }
}

// MARK: - Mapping to Domain

extension CurrentWeatherDTO {
    public func toDomain() -> CurrentWeather? {
        let urlStringPreffix = "https://openweathermap.org/img/wn/"
        let urlStringSuffix = "@2x.png"
        guard let icon = weatherInfo?[0].icon else { return nil }
        let iconURL = urlStringPreffix + icon + urlStringSuffix
        
        guard let _weatherState = WeatherParser.shared.mappingStatus(status: weatherInfo?[0].description),
              let _temp = mainInfo?.temp,
              let _tempMax = mainInfo?.tempMax,
              let _tempMin = mainInfo?.tempMin,
              let _humidity = mainInfo?.humidity else {
            return nil
        }
        
        return .init(date: DateParser.getCurrentDate(),
                     weatherStatus: _weatherState,
                     weatherIcon: iconURL,
                     temp: _temp,
                     tempMax: _tempMax,
                     tempMin: _tempMin,
                     humidity: _humidity)
    }
}

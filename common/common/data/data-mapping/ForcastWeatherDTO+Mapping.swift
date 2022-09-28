//
//  ForecastWeatherDTO+Mapping.swift
//  common
//
//  Created by 김상우 on 2022/09/27.
//

import Foundation

// MARK: - Data Transfer Object

public struct ForecastWeatherDTO: Decodable {
    let list: [CurrentWeatherDTO]?
}


// MARK: - Mapping to Domain

extension ForecastWeatherDTO {
    func toDomain() -> ForecastWeather? {
        guard let weatherList = list else { return nil }
        var fiveDaysWeather = [CurrentWeather]()
        
        for weather in weatherList {
            if (fiveDaysWeather.count) >= 5 {
                break
            }
            if (DateParser.dtoToParsedTime(weather.dataText) == "12:00:00") {
                guard let mappedCurrentWeather = weather.toDomain() else { return nil }
                fiveDaysWeather.append(mappedCurrentWeather)
            }
        }
        return ForecastWeather(list: fiveDaysWeather)
    }
}

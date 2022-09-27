//
//  ForecastWeatherDTO+Mapping.swift
//  common
//
//  Created by 김상우 on 2022/09/27.
//

import Foundation

// MARK: - Data Transfer Object

public struct ForecastWeatherDTO: Decodable {
    let list: [CurrentWeatherDTO]
}


// MARK: - Mapping to Domain

extension ForecastWeatherDTO {
    func toDomain() -> ForecastWeather {
        let weatherList = list
        var fiveDaysWeather = [CurrentWeather]()
        
        for weather in weatherList {
            if (fiveDaysWeather.count) >= 5 {
                break
            }
            if (DateParser.shared.dtoToParsedTime(weather.dataText) == "12:00:00") {
                fiveDaysWeather.append(weather.toDomain())
            }
        }
        return ForecastWeather(list: fiveDaysWeather)
    }
}

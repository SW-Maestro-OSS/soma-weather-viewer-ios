//
//  ForecastWeather.swift
//  home
//
//  Created by 김상우 on 2022/09/22.
//

import Foundation

public struct ForecastWeather {
    public let list: [CurrentWeather]?
    
    public func toCelsius() -> ForecastWeather {
        guard let list = self.list else { return ForecastWeather(list: [])}
        var result = [CurrentWeather]()
        for currentWeather in list {
            result.append(currentWeather.toCelsius())
        }
        return ForecastWeather(list: result)
    }
    
    public func toFahrenheit() -> ForecastWeather {
        guard let list = self.list else { return ForecastWeather(list: [])}
        var result = [CurrentWeather]()
        for currentWeather in list {
            result.append(currentWeather.toFahrenheit())
        }
        return ForecastWeather(list: result)
    }
}

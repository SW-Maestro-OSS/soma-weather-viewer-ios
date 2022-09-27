//
//  WeatherParser.swift
//  common
//
//  Created by 김상우 on 2022/09/27.
//

import Foundation

open class WeatherParser {
    static let shared = WeatherParser()
    
    private init(){}
    
    func parseWeatherStatus(_ weatherStatus: String) -> String {
        return mappingStatus(status: weatherStatus)
    }
    
    func mappingStatus(status: String) -> String{
        var returnValue = ""
        for idx in 0..<StatusEnglish.arr.count {
            if StatusEnglish.arr[idx].rawValue == status{
                returnValue = StatusKorean.arr[idx].rawValue
            }
        }
        return returnValue
    }
}

enum StatusEnglish: String{
    case clearSky = "clear sky"
    case fewClouds = "few coluds"
    case scatteredClouds = "scattered clouds"
    case brokenClouds = "broken clouds"
    case showerRain = "shower rain"
    case rain = "rain"
    case thunderstorm = "thunderstorm"
    case snow = "snow"
    case mist = "mist"
    
    static let arr = [clearSky, fewClouds, scatteredClouds, brokenClouds, showerRain, rain, thunderstorm, snow, mist]
    
}

enum StatusKorean: String{
    case clearSky = "맑음"
    case fewClouds = "구름 약간"
    case scatteredClouds = "퍼진 구름"
    case brokenClouds = "많음 구름"
    case showerRain = "많은 비 옴"
    case rain = "비 옴"
    case thunderstorm = "천둥번개"
    case snow = "눈 옴"
    case mist = "안개 낌"
    
    static let arr = [clearSky, fewClouds, scatteredClouds, brokenClouds, showerRain, rain, thunderstorm, snow, mist]
}


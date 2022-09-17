////
////  WeatherData.swift
////  common
////
////  Created by 김민령 on 2022/09/05.
////
//
//import Foundation
//import UIKit
//
//enum StatusEnglish: String{
//    case clearSky = "clear sky"
//    case fewClouds = "few coluds"
//    case scatteredClouds = "scattered clouds"
//    case brokenClouds = "broken clouds"
//    case showerRain = "shower rain"
//    case rain = "rain"
//    case thunderstorm = "thunderstorm"
//    case snow = "snow"
//    case mist = "mist"

//    static let arr = [clearSky, fewClouds, scatteredClouds, brokenClouds, showerRain, rain, thunderstorm, snow, mist]

//}
//
//enum StatusKorean: String{
//    case clearSky = "맑음"
//    case fewClouds = "구름 약간"
//    case scatteredClouds = "퍼진 구름"
//    case brokenClouds = "많음 구름"
//    case showerRain = "많은 비 옴"
//    case rain = "비 옴"
//    case thunderstorm = "천둥번개"
//    case snow = "눈 옴"
//    case mist = "안개 낌"
//    static let arr = [clearSky, fewClouds, scatteredClouds, brokenClouds, showerRain, rain, thunderstorm, snow, mist]
//}
//
//func mappingStatus(status: String) -> String{
//    var returnValue = ""

//    for idx in 0..<StatusEnglish.arr.count {
//        if StatusEnglish.arr[idx].rawValue == status{
//            returnValue = StatusKorean.arr[idx].rawValue
//        }
//    }
//    return returnValue
//}
//
//
//public struct WeatherData {
////    let icon: UIImage
////    let date: String
//    let status: String
//    let avarageTemp: String
//    let minTemp: String
//    let maxTemp: String
//    let humidity: String

//    public init(weather: Weather){
//        self.status = mappingStatus(status: weather.weatherInfo.status)
//        self.avarageTemp = "평균 온도 : \(weather.tempInfo.temp)"
//        self.maxTemp = "최고 온도 : \(weather.tempInfo.maxTemp)"
//        self.minTemp = "최저 온도 : \(weather.tempInfo.minTemp)"
//        self.humidity = "습도: \(weather.tempInfo.humidity)%"
//    }
//}
//

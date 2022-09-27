//
//  TemperatureConverter.swift
//  common
//
//  Created by 김민령 on 2022/09/18.
//

import Foundation

open class TemperatureConverter {
    public static let shared = TemperatureConverter()
    
    private init(){}
    
    public func fahrenheitToCelsius(temper: Float) -> Int{
        // 섭씨온도 = (화씨온도 - 32) ÷ 1.8
        return Int((temper - 32) / 1.8)
    }
    
    public func celsiusToFahrenheit(temper: Float) -> Int{
        // 화씨온도 = (섭씨온도 × 1.8) + 32
        return Int((temper * 1.8) + 32)
    }
    
    public func kelvinToCelsius(temper: Float) -> Int {
        // 섭씨온도 = 절대온도 - 273.15
        return Int(temper - 273.15)
    }
    
    public func kelvinToFahrenheit(temper: Float) -> Int {
        // 화씨온도 = 섭씨로 바꿔서 계산
        let celsius = Float(kelvinToCelsius(temper: temper))
        return celsiusToFahrenheit(temper: celsius)
    }
    
}

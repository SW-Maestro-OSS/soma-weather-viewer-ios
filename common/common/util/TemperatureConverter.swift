//
//  TemperatureConverter.swift
//  common
//
//  Created by 김민령 on 2022/09/18.
//

import Foundation

open class TemperatureConverter {
    private init(){}
    
    public static func fahrenheitToCelsius(temp: Float) -> Float{
        // 섭씨온도 = (화씨온도 - 32) ÷ 1.8
        return (temp - 32) / 1.8
    }
    
    public static func celsiusToFahrenheit(temp: Float) -> Float{
        // 화씨온도 = (섭씨온도 × 1.8) + 32
        return (temp * 1.8) + 32
    }
    
    public static func kelvinToCelsius(temp: Float) -> Float {
        // 섭씨온도 = 절대온도 - 273.15
        return temp - 273.15
    }
    
    public static func kelvinToFahrenheit(temp: Float) -> Float {
        // 화씨온도 = 섭씨로 바꿔서 계산
        let celsius = Float(kelvinToCelsius(temp: temp))
        return celsiusToFahrenheit(temp: celsius)
    }
    
}

//
//  TemperatureConverter.swift
//  common
//
//  Created by 김민령 on 2022/09/18.
//

import Foundation

class TemperatureConverter {
    
    func fahrenheitToCelsius(temper: Float) -> Float{
        // 섭씨온도 = (화씨온도 - 32) ÷ 1.8
        return (temper - 32) / 1.8
    }
    
    func celsiusToFahrenheit(temper: Float) -> Float{
        // 화씨온도 = (섭씨온도 × 1.8) + 32
        return (temper * 1.8) + 32
    }
    
    func kelvinToCelsius(temper: Float) -> Float {
        // 섭씨온도 = 절대온도 - 273.15
        return temper - 273.15
    }
    
    func kelvinToFahrenheit(temper: Float) -> Float {
        // 화씨온도 = 섭씨로 바꿔서 계산
        let celsius = kelvinToCelsius(temper: temper)
        return celsiusToFahrenheit(temper: celsius)
    }
    
}

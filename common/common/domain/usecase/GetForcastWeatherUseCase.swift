//
//  GetForecastWeatherUseCase.swift
//  home
//
//  Created by 김상우 on 2022/09/22.
//

import Foundation
import RxSwift

open class GetForcastWeatherUseCase: WeatherUseCaseProtocol {
    typealias T = ForecastWeather
    
    public init() {}
    
    public var weatherRepository: WeatherRepositoryProtocol!
    
    public func excute(lat: Float, lon: Float) -> Single<ForecastWeather> {
        return weatherRepository.getForecastWeather(lat: lat, lon: lon)
    }
}

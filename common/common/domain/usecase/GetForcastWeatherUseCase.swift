//
//  GetForecastWeatherUseCase.swift
//  home
//
//  Created by 김상우 on 2022/09/22.
//

import Foundation
import RxSwift

open class GetForcastWeatherUseCase: WeatherUseCaseProtocol {

    public var weatherRepository: WeatherRepositoryProtocol
    
    public init(weatherRepository: WeatherRepositoryProtocol) {
        self.weatherRepository = weatherRepository
    }
    
    public func excute(lat: Float, lon: Float) -> Single<ForecastWeather> {
        return weatherRepository.getForecastWeather(lat: lat, lon: lon)
    }
}

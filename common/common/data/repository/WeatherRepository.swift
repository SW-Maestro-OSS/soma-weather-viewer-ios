//
//  WeatherRepository.swift
//  home
//
//  Created by 김상우 on 2022/09/22.
//

import Foundation
import Moya
import RxMoya
import RxSwift

open class WeatherRepository: WeatherRepositoryProtocol {
    let provider = MoyaProvider<WeatherAPI>()
    
    public init() {}
    
    public func getCurrentWeather(lat: Float, lon: Float) -> Single<CurrentWeather> {
        return provider.rx.request(.current(lat: lat, lon: lon))
            .map(CurrentWeatherDTO.self)
            .map {$0.toDomain()}
    }
    
    public func getForecastWeather(lat: Float, lon: Float) -> Single<ForecastWeather> {
        return provider.rx.request(.forecast(lat: lat, lon: lon))
            .map(ForecastWeatherDTO.self)
            .map {$0.toDomain()}
    }
}

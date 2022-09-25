//
//  GetCurrentWeatherUseCase.swift
//  home
//
//  Created by 김상우 on 2022/09/22.
//

import Foundation
import RxSwift

open class GetCurrentWeatherUseCase: WeatherUseCaseProtocol {
    typealias T = CurrentWeather
    
    public init() {}
    
    public var weatherRepository: WeatherRepositoryProtocol!
    
    public func excute(lat: Float, lon: Float) -> Single<CurrentWeather> {
        return weatherRepository.getCurrentWeather(lat: lat, lon: lon)
    }
}

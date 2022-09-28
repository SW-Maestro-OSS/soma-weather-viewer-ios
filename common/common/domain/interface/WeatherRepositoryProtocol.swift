//
//  WeatherRepositoryInterface.swift
//  home
//
//  Created by 김상우 on 2022/09/22.
//

import Foundation
import RxSwift

public protocol WeatherRepositoryProtocol {
    func getCurrentWeather(lat: Float, lon: Float) -> Single<CurrentWeather?>
    func getForecastWeather(lat: Float, lon: Float) -> Single<ForecastWeather?>
}

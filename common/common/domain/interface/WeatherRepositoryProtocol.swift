//
//  WeatherRepositoryInterface.swift
//  home
//
//  Created by 김상우 on 2022/09/22.
//

import Foundation
import RxSwift

public protocol WeatherRepositoryProtocol {
    func getCurrentWeather(lat: Float, lon: Float, completion: @escaping (Result<CurrentWeather,Error>) -> Void)
    func getForecastWeather(lat: Float, lon: Float, completion: @escaping (Result<ForecastWeather,Error>) -> Void)
}

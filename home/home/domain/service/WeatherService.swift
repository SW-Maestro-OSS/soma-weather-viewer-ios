//
//  WeatherService.swift
//  home
//
//  Created by 김상우 on 2022/09/17.
//

import Foundation
import Moya
import RxMoya
import RxSwift


final class WeatherService {
    static let shared = WeatherService()
    let provider = MoyaProvider<WeatherAPI>()
    
    private init() { }
    
    func get5dayWeahter(lat: Float, lon: Float) -> Single<ForecastWeather> {
        // 더미 위경도
        provider.rx.request(.forecast(lat: lat, lon: lon))
            .map(ForecastWeather.self)
    }
}

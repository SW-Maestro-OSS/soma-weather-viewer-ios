//
//  GetForecastWeatherUseCase.swift
//  home
//
//  Created by 김상우 on 2022/09/22.
//

import Foundation
import RxSwift

open class GetForcastWeatherUseCase: WeatherUseCaseProtocol {
    public func excute(lat: Float, lon: Float, completaion: @escaping (Result<ForecastWeather, Error>) -> Void) {
        weatherRepository.getForecastWeather(lat: lat, lon: lon) { result in
            switch result {
            case .success(let data):
                print("유즈 케이스 : \(data)")
                completaion(.success(data))
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

    private var weatherRepository: WeatherRepositoryProtocol
    
    public init(weatherRepository: WeatherRepositoryProtocol) {
        self.weatherRepository = weatherRepository
    }
    
//    public func excute(lat: Float, lon: Float) -> Single<ForecastWeather?> {
//        return weatherRepository.getForecastWeather(lat: lat, lon: lon)
//    }
}

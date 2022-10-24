//
//  GetForecastWeatherUseCase.swift
//  home
//
//  Created by 김상우 on 2022/09/22.
//

import Foundation
import RxSwift
import RxCocoa

open class GetForcastWeatherUseCase: WeatherUseCaseProtocol {
    private var weatherRepository: WeatherRepositoryProtocol
    private let disposeBag = DisposeBag()

    public init(weatherRepository: WeatherRepositoryProtocol) {
        self.weatherRepository = weatherRepository
    }
    
    public func excute(lat: Float, lon: Float, completion: @escaping (Result<ForecastWeather, Error>) -> Void) {
        
        UserDefaults.temperatureTypeRelay.bind { [weak self] type in
            guard let self = self else { return }

            self.weatherRepository.getForecastWeather(lat: lat, lon: lon) { result in
                switch result {
                case .success(let data):
                    switch type {
                    case .celsius:
                        completion(.success(data.toCelsius()))
                        
                    case .fahrenheit:
                        completion(.success(data.toFahrenheit()))
                    }

                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }.disposed(by: disposeBag)
    }
}

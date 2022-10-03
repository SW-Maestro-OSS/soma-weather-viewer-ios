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
    
    public func getCurrentWeather(lat: Float, lon: Float, completion: @escaping (Result<CurrentWeather, Error>) -> Void) {
        //network
    }
    
    public func getForecastWeather(lat: Float, lon: Float, completion: @escaping (Result<ForecastWeather, Error>) -> Void) {
        provider.request(.forecast(lat: lat, lon: lon)) { result in
            switch result {
            case .success(let response):
                do {
                    let data = try JSONDecoder()
                        .decode(ForecastWeatherDTO.self, from: response.data).toDomain()
                    completion(.success(data!))
                }
                catch(let error){
                    print(error.localizedDescription)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    

    
    let provider = MoyaProvider<WeatherAPI>()
    
    public init() {}
    
//    public func getCurrentWeather(lat: Float, lon: Float) -> Single<CurrentWeather?> {
//        return provider.rx.request(.current(lat: lat, lon: lon))
//            .map(CurrentWeatherDTO.self)
//            .map {$0.toDomain()}
//    }
//
//    public func getForecastWeather(lat: Float, lon: Float) -> Single<ForecastWeather?> {
//        return provider.rx.request(.forecast(lat: lat, lon: lon))
//            .map(ForecastWeatherDTO.self)
//            .map {$0.toDomain()}
//    }
}

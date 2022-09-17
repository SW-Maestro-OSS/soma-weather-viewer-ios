//
//  HomeViewModel.swift
//  home
//
//  Created by 김상우 on 2022/09/05.
//

import Foundation
import Moya
import common

open class HomeViewModel {
    var todayWeatherData: WeatherData?
    var forecastWeatherData: [WeatherData]?
    
    public init() { }

    
    // Test Mock
    let provider = MoyaProvider<WeatherAPI>()
    
    func today(lat: Float, lon: Float){
        provider.request(.today(lat: lat, lon: lon)) { response in
            switch response {
            case .success(let result):
                do{
                    print(result.statusCode)
                    let today = try JSONDecoder().decode(Weather.self, from: result.data)
                    print("today weather data: \(today)")
                    self.todayWeatherData = WeatherData(weather: today)
                    
                }catch(let err){
                    print("💡today parse error: \(err.localizedDescription)")
                }
            case .failure(let err):
                print("💡today request fail: \(err.localizedDescription)")
            }
        }
    }
    
    func forecast(lat: Float, lon: Float){
        provider.request(.forecast(lat: lat, lon: lon)) { response in
            switch response {
            case .success(let result):
                do{
                    print(result.data)
                    let today = try JSONDecoder().decode(ForecastWeather.self, from: result.data)
                    print("forcast weather data: \(today)")

                }catch(let err){
                    print("💡forecast parse error: \(err.localizedDescription)")
                }
            case .failure(let err):
                print("💡forecast request fail: \(err.localizedDescription)")
            }
        }
    }
    
}

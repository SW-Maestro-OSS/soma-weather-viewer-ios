//
//  AppDIContainer.swift
//  soma-weather-viewer-ios
//
//  Created by 김상우 on 2022/09/26.
//

import Foundation
import home
import common

final class AppDIContainer {
    init() { }
    
    func makeHomeViewController() -> HomeViewController {
        return HomeViewController(viewModel: makeHomeViewModel())
    }
    
    func makeHomeViewModel() -> HomeViewModelProtocol {
        return HomeViewModel(weatherUseCase: makeForcastWeahterUseCase())
    }
    
    func makeForcastWeahterUseCase() -> WeatherUseCaseProtocol {
        return GetForcastWeatherUseCase(weatherRepository: makeWeatherRepository())
    }
    
    func makeWeatherRepository() -> WeatherRepositoryProtocol {
        return WeatherRepository()
    }
    
}

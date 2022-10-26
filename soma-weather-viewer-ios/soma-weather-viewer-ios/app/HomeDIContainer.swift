//
//  HomeDIContainer.swift
//  soma-weather-viewer-ios
//
//  Created by 김상우 on 2022/09/26.
//

import Foundation
import home
import setting
import common
import common_ui
import UIKit

final class HomeDIContainer {
    func makeHomeViewController() -> HomeViewController {
        let viewModel = makeHomeViewModel()
        return HomeViewController(viewModel: viewModel,
                                  weatherViewController: makeWeatherViewController(viewModel: viewModel),
                                  weatherCollectionView: makeWeatherCollectionView(),
                                  weatherTableView: makeWeatherTableView(),
                                  settingViewController: makeSettingViewController())
    }
    
    func makeWeatherViewController(viewModel: HomeViewModelProtocol) -> WeatherViewController {
        return WeatherViewController(viewModel: viewModel,
                                     weatherCollectionView: makeWeatherCollectionView(),
                                     weatherTableView: makeWeatherTableView())
    }
    
    func makeWeatherCollectionView() -> UICollectionView {
        return WeatherCollectionView(frame: CGRect.zero,
                                     collectionViewLayout: makeWeatherCollectionViewFlowLayout())
    }
    
    func makeWeatherCollectionViewFlowLayout() -> UICollectionViewFlowLayout {
        return WeatherCollectionViewFlowLayout()
    }
    
    func makeWeatherTableView() -> UITableView {
        return WeatherTableView()
    }
    
    func makeSettingViewController() -> SettingViewController {
        return SettingViewController()
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

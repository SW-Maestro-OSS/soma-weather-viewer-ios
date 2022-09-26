//
//  HomeViewModel.swift
//  home
//
//  Created by 김상우 on 2022/09/05.
//

import Foundation
import Moya
import common
import RxSwift


public protocol HomeViewModelProtocol {
    func getWeather(lat: Float, lon: Float) -> Void
}


open class HomeViewModel: HomeViewModelProtocol {
    
    let disposeBag = DisposeBag()
    private let getForcastWeatherUseCase: WeatherUseCaseProtocol
    
    public init(weatherUseCase: WeatherUseCaseProtocol) {
        self.getForcastWeatherUseCase = weatherUseCase
    }

    public func getWeather(lat: Float, lon: Float){
        getForcastWeatherUseCase.excute(lat: lat, lon: lon)
            .subscribe(onSuccess: { response in
                print("뷰모델 response = \(response)")
            }, onFailure: { err in
                print("뷰모델 err = \(err)")
            }).disposed(by: disposeBag)
        
    }
    
}

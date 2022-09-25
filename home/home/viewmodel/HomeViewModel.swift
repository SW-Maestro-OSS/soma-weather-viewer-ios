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


protocol HomeViewModelProtocol {
    func getWeather(lat: Float, lon: Float) -> Void
}


open class HomeViewModel: HomeViewModelProtocol {
    let disposeBag = DisposeBag()
    
    public init() {
        
    }

    func getWeather(lat: Float, lon: Float){

        // 이제 이걸 dependencies 로 묶어서 DI 주입해주자 !
        let usecase = GetForcastWeatherUseCase()
        usecase.weatherRepository = WeatherRepository()
        
        usecase.excute(lat: lat, lon: lon)
            .subscribe(onSuccess: { response in
                print("뷰모델 response = \(response)")
            }, onFailure: { err in
                print("뷰모델 err = \(err)")
            }).disposed(by: disposeBag)
        
    }
    
}

//
//  HomeViewModel.swift
//  home
//
//  Created by 김상우 on 2022/09/05.
//

import Foundation
import Moya
import RxSwift

open class HomeViewModel {
    let disposeBag = DisposeBag()
    
    public init() {
        getWeather(lat: 36, lon: 128)
    }

    func getWeather(lat: Float, lon: Float){
        WeatherService.shared.get5dayWeahter(lat: lat, lon: lon)
            .subscribe(onSuccess: { response in
                print("뷰모델 결과 = \(response)")
            }, onFailure: { err in
                print("뷰모델 에러 = \(err)")
            }).disposed(by: disposeBag)
    }
    
}

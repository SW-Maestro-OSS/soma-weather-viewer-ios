//
//  HomeViewModel.swift
//  home
//
//  Created by 김상우 on 2022/09/05.
//

import Foundation
import Moya
import common
//import RxSwift
//import RxCocoa
import soma_foundation


//public protocol HomeViewModelProtocol {
//    func getWeather(lat: Float, lon: Float) -> Void
//    var weatherRelay: BehaviorRelay<ForecastWeather?> { get }
//}

public protocol HomeViewModelProtocol {
    func getWeather(lat: Float, lon: Float) -> Void
    var weatherRelay: Observable<[CurrentWeather]?> { get }

}



open class HomeViewModel: HomeViewModelProtocol {
    
//    let disposeBag = DisposeBag()
    private let getForcastWeatherUseCase: WeatherUseCaseProtocol
//    public let weatherRelay = BehaviorRelay<ForecastWeather?>(value: nil)
    public let weatherRelay = Observable<[CurrentWeather]?>(nil)
    
    public init(weatherUseCase: WeatherUseCaseProtocol) {
        self.getForcastWeatherUseCase = weatherUseCase
    }

    public func getWeather(lat: Float, lon: Float){
        
        getForcastWeatherUseCase.excute(lat: lat, lon: lon) { result in
            switch result {
            case .success(let data):
                guard let list = data.list else {return}
                print("뷰모델도착 \(data)")
                self.weatherRelay.value = list
            case .failure(let error):
                print(error)
            }
        }

//        getForcastWeatherUseCase.excute(lat: lat, lon: lon)
//            .subscribe(onSuccess: { [weak self] response in
//                guard let list = response?.list else { return }
//                self?.weatherRelay.accept(list)
//            }, onFailure: { err in
//                print("HomeViewModel err = \(err)")
//            }).disposed(by: disposeBag)
        
    }
    
}

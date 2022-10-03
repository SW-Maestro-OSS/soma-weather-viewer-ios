//
//  UseCaseProtocol.swift
//  home
//
//  Created by 김상우 on 2022/09/22.
//

import Foundation
//import RxSwift
import soma_foundation

public protocol WeatherUseCaseProtocol {
    func excute(lat: Float, lon: Float, completaion: @escaping (Result<ForecastWeather,Error>) -> Void)
}

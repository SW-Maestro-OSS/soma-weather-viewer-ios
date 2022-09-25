//
//  UseCaseProtocol.swift
//  home
//
//  Created by 김상우 on 2022/09/22.
//

import Foundation
import RxSwift

protocol WeatherUseCaseProtocol {
    associatedtype T
    func excute(lat: Float, lon: Float) -> Single<T>
}

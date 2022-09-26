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
    
    func makeHomeDIContainer() -> HomeDIContainer {
        return HomeDIContainer()
    }
    
}

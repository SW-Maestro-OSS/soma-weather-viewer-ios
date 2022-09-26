//
//  AppFlowCoordinator.swift
//  soma-weather-viewer-ios
//
//  Created by 김상우 on 2022/09/25.
//

import Foundation
import UIKit
import home
import common

final class AppFlowCoordinator {
    
    var navigationController: UINavigationController
    private let appDIContainer: AppDIContainer
    
    init(navigationController: UINavigationController,
         appDIContainer: AppDIContainer) {
        self.navigationController = navigationController
        self.appDIContainer = appDIContainer
    }
    
    func start() {
        // In App Flow we can check if user needs to login, if yes we would run login flow
        let homeDIContainer = appDIContainer.makeHomeDIContainer()
        let homeViewController = homeDIContainer.makeHomeViewController()
        
        navigationController.pushViewController(homeViewController, animated: false)
    }
    
}

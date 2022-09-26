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
        let homeViewController = appDIContainer.makeHomeViewController()
        navigationController.pushViewController(homeViewController, animated: false)
    }
    
}

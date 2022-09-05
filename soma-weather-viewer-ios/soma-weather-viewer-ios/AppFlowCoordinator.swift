//
//  AppFlowCoordinator.swift
//  soma-weather-viewer-ios
//
//  Created by Ace Kim on 2022/09/05.
//
import UIKit

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
        let flow = homeDIContainer.makeHomeFlowCoordinator(navigationController: navigationController)
        flow.start()
    }
}

//
//  AppFlowCoordinator.swift
//  soma-weather-viewer-ios
//
//  Created by 김상우 on 2022/09/25.
//

import Foundation
import UIKit
import Swinject
import home

final class AppFlowCoordinator {
    
    var navigationController: UINavigationController
    private let appDIContainer: Container
    
    init(navigationController: UINavigationController,
         appDIContainer: Container) {
        self.navigationController = navigationController
        self.appDIContainer = appDIContainer
    }
    
    func regiter() {
        appDIContainer.register(HomeViewModel.self) { _ in
            HomeViewModel()
        }
        
        appDIContainer.register(HomeViewController.self) { r in
            let dependencies = HomeViewController.Dependencies(viewModel: r.resolve(HomeViewModel.self)!)
            let homeViewController = HomeViewController()
            homeViewController.dependencies = dependencies
            return homeViewController
        }
    }
    
    func start() {
        regiter()
        
        navigationController.pushViewController(appDIContainer.resolve(HomeViewController.self)!, animated: false)
    }
    
}

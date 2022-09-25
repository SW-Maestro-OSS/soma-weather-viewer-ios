//
//  AppDelegate.swift
//  soma-weather-viewer-ios
//
//  Created by 김상우 on 2022/09/05.
//

// 주입해야할 것
// 1. Network module 주입
// 2. data store module 주입
// 3. view model 주입

import UIKit
import Swinject

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    let appDIConatiner = Container()
    var appFlowCoordinator: AppFlowCoordinator?
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let navigationController = UINavigationController()
        
        window?.rootViewController = navigationController
        appFlowCoordinator = AppFlowCoordinator(navigationController: navigationController, appDIContainer: appDIConatiner)
        
        appFlowCoordinator?.start()
        window?.makeKeyAndVisible()
        
        return true
    }


}


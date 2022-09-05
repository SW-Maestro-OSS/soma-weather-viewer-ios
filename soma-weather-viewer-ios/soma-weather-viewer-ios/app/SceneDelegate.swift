//
//  SceneDelegate.swift
//  soma-weather-viewer-ios
//
//  Created by 김상우 on 2022/09/05.
//

import UIKit
import home

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        setRootViewController(windowScene)
    }

    
    func setRootViewController(_ windowScene: UIWindowScene) {
        window = UIWindow(windowScene: windowScene)
        window?.overrideUserInterfaceStyle = .light
 
        let homeViewController = HomeViewController()
        let navigationViewController = UINavigationController(rootViewController: homeViewController)

        window?.makeKeyAndVisible()
        window?.rootViewController = navigationViewController
    }
    
}


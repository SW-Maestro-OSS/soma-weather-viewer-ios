//
//  HomeFlowCoordinator.swift
//  home
//
//  Created by Ace Kim on 2022/09/05.
//


import UIKit

protocol HomeFlowCoordinatorDependencies  {
    func makeHomeViewController(actions: HomeViewModelActions) -> HomeViewController
}

final class HomeFlowCoordinator {
    
    private weak var navigationController: UINavigationController?
    private let dependencies: HomeFlowCoordinatorDependencies

    private weak var homeVC: HomeViewController?

    init(navigationController: UINavigationController,
         dependencies: HomeFlowCoordinatorDependencies) {
        self.navigationController = navigationController
        self.dependencies = dependencies
    }
    
    func start() {
        // Note: here we keep strong reference with actions, this way this flow do not need to be strong referenced
        let actions = HomeViewModelActions() // MARK: - From Ace. Please make HomeViewModel and HomeViewModelAction HomeViewModelAction(struct)
        let vc = dependencies.makeHomeViewController(actions: actions)

        navigationController?.pushViewController(vc, animated: false)
        homeVC = vc
    }
}

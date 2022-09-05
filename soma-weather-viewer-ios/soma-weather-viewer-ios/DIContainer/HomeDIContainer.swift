//
//  HomeDIContainer.swift
//  soma-weather-viewer-ios
//
//  Created by Ace Kim on 2022/09/05.
//

import UIKit
import soma_foundation

final class MoviesSceneDIContainer {
    
    struct Dependencies {
        let apiDataTransferService: DataTransferService
        let imageDataTransferService: DataTransferService
    }
    
    private let dependencies: Dependencies

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
    
    // MARK: - Please make HomeViewModel and HomeViewModelAction
//    func makeHomeViewModel(actions: HomeViewModelActions) -> HomeViewModel {
//        return DefaultHomeViewModel(searchMoviesUseCase: makeSearchMoviesUseCase(),
//                                    actions: actions)
//
//    }
    
    // MARK: - Please make HomeUseCase and HomeRepository
//    func makeSearchMoviesUseCase() -> SearchMoviesUseCase {
//        return DefaultSearchMoviesUseCase(moviesRepository: makeMoviesRepository(),
//                                          moviesQueriesRepository: makeMoviesQueriesRepository())
//    }
}

extension HomeDIContainer: HomeFlowCoordinatorDependencies {}

//
//  MoviesSceneConfigurator.swift
//  Movies
//
//  Created by hany karam on 3/31/22.
//

import Foundation
class MoviesSceneConfigurator {
    
    static func configure() -> MoviesVC {
        let viewController = MoviesVC()
        let presenter = MoviesScenePresenter(displayView: viewController)
        let interactor = MoviesSceneInteractor(presenter: presenter)
        let router = MoviesSceneRouter(viewController: viewController, dataStore: interactor)
        viewController.interactor = interactor
        viewController.dataStore = interactor
        viewController.router = router
        return viewController
    }
    
}

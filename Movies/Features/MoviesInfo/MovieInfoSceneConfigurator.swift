//
//  MovieInfoSceneConfigurator.swift
//  Movies
//
//  Created by hany karam on 3/31/22.
//

import Foundation
class MovieInfoSceneConfigurator {
    
    static func configure() -> MovieInfoVC {
        
        let viewController = MovieInfoVC()
        let presenter = MovieInfoScenePresenter(displayView: viewController)
        let interactor = MovieInfoSceneInteractor(presenter: presenter)
        viewController.interactor = interactor
        viewController.dataStore = interactor
        return viewController
    }
    
}

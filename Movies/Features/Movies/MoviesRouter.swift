//
//  MoviesRouter.swift
//  Movies
//
//  Created by hany karam on 3/31/22.
//

import UIKit

final class MoviesSceneRouter: MoviesSceneRoutingLogic {
    internal weak var viewController: (UIViewController & MoviesSceneDisplayView)?
    internal  weak var dataStore: MoviesSceneDataStore?
    
    // MARK: Initializers
    required init(viewController: (UIViewController & MoviesSceneDisplayView), dataStore: MoviesSceneDataStore) {
        self.viewController = viewController
        self.dataStore = dataStore
    }
}

extension MoviesSceneRouter {
    func routeToMovieInfoScene(movie: Movie) {
        let viewController = MovieInfoSceneConfigurator.configure()
        viewController.dataStore.movie = movie
        self.viewController?.present(viewController, animated: true, completion: nil)
    }
}

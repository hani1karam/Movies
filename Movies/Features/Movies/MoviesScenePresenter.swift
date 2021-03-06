//
//  MovieInfoScenePresenter.swift
//  Movies
//
//  Created by hany karam on 3/31/22.
//

import Foundation
class MoviesScenePresenter: MoviesScenePresentingLogic {
    weak var displayView: MoviesSceneDisplayView?
    required init(displayView: MoviesSceneDisplayView) {
        self.displayView = displayView
    }
}
extension MoviesScenePresenter {
    func presentFetchedMovies(_ response: MoviesScene.Fetch.Response) {
        switch response {
        case .success(let movies):
            let viewModel = MoviesScene.ViewModel(movies: movies)
            displayView?.display(viewModel: viewModel)
        case .error(let error):
            displayView?.display(error: error)
        }
    }
    func presentFetchedSearchMovies(_ response: MoviesScene.Filter.Response) {
        switch response {
        case .success(let groupedMovies):
            let viewModel = MoviesScene.FilteredViewModel(groupedMovies: groupedMovies)
            displayView?.display(filteredViewModel: viewModel)
        case .error(let error):
            displayView?.display(error: error)
        }
    }
}

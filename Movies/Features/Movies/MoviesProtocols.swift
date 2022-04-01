//
//  MoviesProtocols.swift
//  Movies
//
//  Created by hany karam on 3/31/22.
//

import UIKit

// MARK: - View
protocol MoviesSceneDisplayView: AnyObject {
    func display(viewModel: MoviesScene.ViewModel)
    func display(filteredViewModel: MoviesScene.FilteredViewModel)
    func display(error: CustomError)
}

// MARK: - Interactor
protocol MoviesSceneBusinessLogic: AnyObject {
    func fetchMovies()
    func filterMovies(_ request: MoviesScene.Filter.Request)
}

// MARK: - Presenter
protocol MoviesScenePresentingLogic: AnyObject {
    func presentFetchedMovies(_ response: MoviesScene.Fetch.Response)
    func presentFetchedSearchMovies(_ response: MoviesScene.Filter.Response)
}

// MARK: - Router
protocol MoviesSceneRoutingLogic: AnyObject {
    var viewController: (MoviesSceneDisplayView & UIViewController)? { get set }
    var dataStore: MoviesSceneDataStore? { get set }
    
    func routeToMovieInfoScene(movie: Movie)
}

// MARK: - DataStore
protocol MoviesSceneDataStore: AnyObject {
    var movies: [Movie] { get set }
    var searchResults: [[Int: [Movie]]] { get set }
    var searchEnabled: Bool { get set }
}

// MARK: - Functionalities
enum MoviesScene {
    struct ViewModel {
        let movies: [Movie]
    }
    
    struct FilteredViewModel {
        let groupedMovies: [[Int: [Movie]]]
    }
}

extension MoviesScene {
    enum Fetch {}
    enum Filter {}
}

extension MoviesScene.Fetch {
    typealias Response = Result<[Movie], CustomError>
}

extension MoviesScene.Filter {
    struct Request {
        let query: String
    }
    
    typealias Response = Result<[[Int: [Movie]]], CustomError>
}

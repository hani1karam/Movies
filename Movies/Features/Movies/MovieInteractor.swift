//
//  MovieInfoInteractor.swift
//  Movies
//
//  Created by hany karam on 3/31/22.
//

import Foundation
final class MoviesSceneInteractor: MoviesSceneBusinessLogic, MoviesSceneDataStore {
    private let presenter: MoviesScenePresentingLogic
    internal var worker = MovieWorker()
    internal var movies: [Movie]
    internal var searchEnabled: Bool = false
    internal var searchResults: [[Int : [Movie]]] = []
    required init(presenter: MoviesScenePresentingLogic) {
        self.presenter = presenter
        movies = []
    }
}

extension MoviesSceneInteractor {
    func fetchMovies() {
        
        if !movies.isEmpty {
            let response = MoviesScene.Fetch.Response.success(movies)
            self.presenter.presentFetchedMovies(response)
            return
        }
        worker.fetchMovies { [weak self] (movies, error) in
            guard let self = self else { return }
            if let error = error {
                let response = MoviesScene.Fetch.Response.error(error)
                self.presenter.presentFetchedMovies(response)
            } else {
                self.movies = movies.sorted { $0.year > $1.year }
                let response = MoviesScene.Fetch.Response.success(self.movies)
                self.presenter.presentFetchedMovies(response)
            }
        }
    }
    
    func filterMovies(_ request: MoviesScene.Filter.Request) {
        var filteredMovies = [Movie]()
        filteredMovies = movies.filter { $0.title.lowercased().contains(request.query.lowercased()) ||
            String(describing: $0.year).contains(request.query) }.sorted { $0.rating > $1.rating }
        
        let grouped = Dictionary(grouping: filteredMovies, by: { $0.year })
        
        var results: [ [Int: [Movie]] ] = []
        grouped.forEach { (key, value) in
            results.append([key: Array(value.prefix(5))])
        }
        let response = MoviesScene.Filter.Response.success(results)
        presenter.presentFetchedSearchMovies(response)
    }
}

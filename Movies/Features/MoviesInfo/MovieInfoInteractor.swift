//
//  MovieInfoInteractor.swift
//  Movies
//
//  Created by hany karam on 3/31/22.
//

class MovieInfoSceneInteractor: MovieInfoSceneBusinessLogic, MovieInfoSceneDataStore {
    
    // MARK: Stored Properties
    let presenter: MovieInfoScenePresentingLogic
    var worker = MovieInfoWorker()
    
    var photos: [Photo] = []
    
    var movie = Movie()
    
    // MARK: Initializers
    required init(presenter: MovieInfoScenePresentingLogic) {
        self.presenter = presenter
    }
}

extension MovieInfoSceneInteractor {
    
    func fetchMoviePhotos(title: String) {
        worker.fetchMoviePhotos(title: title) { [weak self] (photos, error) in
            
            guard let self = self else { return }
            
            if let error = error {
                let response = MovieInfoScene.Fetch.Response.error(error)
                self.presenter.presentFetchedPhotos(response)
            } else {
                let response = MovieInfoScene.Fetch.Response.success(photos)
                self.presenter.presentFetchedPhotos(response)
            }
        }
    }
}

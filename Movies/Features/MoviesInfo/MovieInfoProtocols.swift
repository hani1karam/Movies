//
//  MovieInfoProtocols.swift
//  Movies
//
//  Created by hany karam on 3/31/22.
//

import Foundation

// MARK: - View
protocol MovieInfoSceneDisplayView: AnyObject {
    func display(photos: MovieInfoScene.Fetch.ViewModel)
    func display(error: CustomError)
}

// MARK: - Interactor
protocol MovieInfoSceneBusinessLogic: AnyObject {
    func fetchMoviePhotos(title: String)
}

// MARK: - Presenter
protocol MovieInfoScenePresentingLogic: AnyObject {
    func presentFetchedPhotos(_ response: MovieInfoScene.Fetch.Response)
}

// MARK: - Data Store
protocol MovieInfoSceneDataStore: AnyObject {
    var movie: Movie { get set }
    var photos: [Photo] { get set }
}

// MARK: - Functionalities
enum MovieInfoScene {
    struct ViewModel {
        let title: String
        let year: Int
        let cast: [String]
        let genres: [String]
        let rating: Int
    }
}

extension MovieInfoScene {
    enum Fetch {}
}

extension MovieInfoScene.Fetch {
    struct ViewModel {
        let photos: [Photo]
    }
    
    typealias Response = Result<[Photo], CustomError>
}

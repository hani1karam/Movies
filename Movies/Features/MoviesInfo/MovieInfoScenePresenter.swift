//
//  MovieInfoScenePresenter.swift
//  Movies
//
//  Created by hany karam on 3/31/22.
//

import Foundation
class MovieInfoScenePresenter: MovieInfoScenePresentingLogic {
    
    // MARK: Stored Properties
    weak var displayView: MovieInfoSceneDisplayView?
    
    // MARK: Initializers
    required init(displayView: MovieInfoSceneDisplayView) {
        self.displayView = displayView
    }
}

extension MovieInfoScenePresenter {
    func presentFetchedPhotos(_ response: MovieInfoScene.Fetch.Response) {
        switch response {
        case .success(let photos):
            let viewModel = MovieInfoScene.Fetch.ViewModel(photos: photos)
            displayView?.display(photos: viewModel)
        case .error(let error):
            displayView?.display(error: error)
        }
    }
}

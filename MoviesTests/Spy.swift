//
//  Spy.swift
//  MoviesTests
//
//  Created by hany karam on 3/31/22.
//

import Foundation
@testable import Movies
extension MoviesTests {
    
    class PresenterSpy: MoviesScenePresentingLogic {
        var fetchedMoviesResponse: MoviesScene.Fetch.Response?
        var fetchedSearchedMoviesResponse: MoviesScene.Filter.Response?
        
        func presentFetchedMovies(_ response: MoviesScene.Fetch.Response) {
            fetchedMoviesResponse = response
        }
        
        func presentFetchedSearchMovies(_ response: MoviesScene.Filter.Response) {
            fetchedSearchedMoviesResponse = response
        }
    }
    
    class Worker: MovieWorker {
        
        override func fetchMovies(_ completionHandler: @escaping ([Movie], CustomError?) -> Void) {
            let movies = [Movie(title: "2012", year: 2009),
                          Movie(title: "(500) Days of Summer", year: 2009),
                          Movie(title: "12 Rounds", year: 2009),
                          Movie(title: "Dead Before Dawn", year: 2012),
                          Movie(title: "Dead Man's Burden", year: 2012),
                          Movie(title: "Admission", year: 2013),
                          Movie(title: "Gravity", year: 2013),
                          Movie(title: "The Green Inferno", year: 2013),
                          Movie(title: "Unfriended: Dark Web", year: 2018),
                          Movie(title: "Mission: Impossible – Fallout", year: 2018),
                          Movie(title: "Destroyer", year: 2018)]
            completionHandler(movies, nil)
        }
    }
}

//
//  MoviesTests.swift
//  MoviesTests
//
//  Created by hany karam on 3/31/22.
//

import XCTest
@testable import Movies

class MoviesTests: XCTestCase {
    func testSearchQueryMission() {
        let presentSpy = PresenterSpy()
        let interactor = MoviesSceneInteractor(presenter: presentSpy)
        interactor.worker = Worker()
        
        let request = MoviesScene.Filter.Request(query: "mission")
        interactor.fetchMovies()
        interactor.filterMovies(request)
        
        let responsesMovies = presentSpy.fetchedSearchedMoviesResponse?.value ?? []
        XCTAssertEqual(responsesMovies.count, 2)
    }
    
    func testSearchQuery2012() {
        let presentSpy = PresenterSpy()
        let interactor = MoviesSceneInteractor(presenter: presentSpy)
        interactor.worker = Worker()
        
        let request = MoviesScene.Filter.Request(query: "2012")
        interactor.fetchMovies()
        interactor.filterMovies(request)
        
        let responsesMovies = presentSpy.fetchedSearchedMoviesResponse?.value ?? []
        XCTAssertEqual(responsesMovies.count, 2)
    }
    
    func testSearchQueryEmpty() {
        let presentSpy = PresenterSpy()
        let interactor = MoviesSceneInteractor(presenter: presentSpy)
        interactor.worker = Worker()
        
        let request = MoviesScene.Filter.Request(query: "testemptylist")
        interactor.fetchMovies()
        interactor.filterMovies(request)
        
        let responsesMovies = presentSpy.fetchedSearchedMoviesResponse?.value ?? []
        XCTAssertEqual(responsesMovies.count, 0)
    }
    
    func testSearchQueryCaseInsensitivity() {
        let presentSpy = PresenterSpy()
        let interactor = MoviesSceneInteractor(presenter: presentSpy)
        interactor.worker = Worker()
        
        interactor.fetchMovies()
        let requestlowerCase = MoviesScene.Filter.Request(query: "mission")
        interactor.filterMovies(requestlowerCase)
        let lowercaseMovieCount = presentSpy.fetchedSearchedMoviesResponse?.value?.count ?? 0
        
        let requestUpperCase = MoviesScene.Filter.Request(query: "MISSION")
        interactor.filterMovies(requestUpperCase)
        let uppercaseMovieCount = presentSpy.fetchedSearchedMoviesResponse?.value?.count ?? 0
        
        XCTAssertEqual(lowercaseMovieCount, uppercaseMovieCount)
    }
    
}

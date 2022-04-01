//
//  MoviesModel.swift
//  Movies
//
//  Created by hany karam on 3/31/22.
//

import Foundation
struct Movies: Decodable {
    let movies: [Movie]
}

struct Movie: Decodable {
    let title: String
    let year: Int
    let cast: [String]
    let genres: [String]
    let rating: Int
    
    init() {
        title = ""
        year = 0
        cast = []
        genres = []
        rating = 0
    }
    init(title: String, year: Int) {
        self.title = title
        self.year = year
        self.cast = []
        self.genres = []
        self.rating = 0
    }
}

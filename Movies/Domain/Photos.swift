//
//  Photos.swift
//  Movies
//
//  Created by hany karam on 3/31/22.
//

import Foundation
struct Photos: Decodable {
    let photos: PhotoModel
}

struct PhotoModel: Decodable {
    let photo: [Photo]
}

struct Photo: Decodable {
    let id: String
    let owner: String
    let secret: String
    let server: String
    let farm: Int
    let title: String
}

//
//  CutomError.swift
//  Movies
//
//  Created by hany karam on 3/31/22.
//

import Foundation
enum CustomError: Error {
    case
        custom(String)
    var localizedDescription: String {
        switch self {
        case .custom(let message): return message
        }
    }
    
}

//
//  Result.swift
//  Movies
//
//  Created by hany karam on 4/1/22.
//

import Foundation
public enum Result<T, E: Error> {
    case
        success(T),
        error(E)
    
    public var isSuccess: Bool {
        switch self {
        case .success: return true
        default: return false
        }
    }
    
    public var isError: Bool {
        return !isSuccess
    }
    
    public var value: T? {
        switch self {
        case .success(let value): return value
        default: return nil
        }
    }
    
    public var error: E? {
        switch self {
        case .error(let error): return error
        default: return nil
        }
    }
}

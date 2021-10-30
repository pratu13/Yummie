//
//  AppError.swift
//  Yummie
//
//  Created by Pratyush  on 10/28/21.
//

import UIKit

enum AppError: LocalizedError {
    case errorDecoding
    case unknown
    case invalidURL
    case serverError(String)
    
    var errorDescription: String? {
        switch self {
        case .errorDecoding:
            return "Respinse could not be decoded"
        case .unknown:
            return "I dont know what happened"
        case .invalidURL:
            return "Invalid URL"
        case .serverError(let error):
            return error
        }
    }
}

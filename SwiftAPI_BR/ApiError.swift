//
//  ApiError.swift
//  SwiftAPI_BR
//
//  Created by Bruno Rivera on 25/08/25.
//

import Foundation

enum APIError: LocalizedError {
    case invalidURL
    case noInternet
    case serverError(statusCode: Int)
    case decodingError
    case unknownError

    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "The server address is not valid."
        case .noInternet:
            return "No internet connection available. Please try again later"
        case .serverError(let code):
            return "Server error (\(code)). Please try again later."
        case .decodingError:
            return "An error occurred while processing the data."
        case .unknownError:
            return "An unexpected error occurred."
        }
    }
}

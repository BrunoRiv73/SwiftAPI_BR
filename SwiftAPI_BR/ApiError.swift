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
            return "La dirección del servidor no es válida."
        case .noInternet:
            return "No hay conexión a Internet. Intenta de nuevo."
        case .serverError(let code):
            return "Error del servidor (\(code)). Intenta más tarde."
        case .decodingError:
            return "Hubo un problema al procesar los datos."
        case .unknownError:
            return "Ocurrió un error inesperado."
        }
    }
}

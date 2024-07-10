//
//  NetworkingService+NetworkError.swift
//  SessionManagment
//
//  Created by Miguel Hernandez on 4/30/24.
//

import Foundation

extension NetworkingService {
    enum NetworkError: Error {
        case invalidURL
        case requestFailed(statusCode: Int)
        case invalidResponse
        case dataConversionFailure
    }
}



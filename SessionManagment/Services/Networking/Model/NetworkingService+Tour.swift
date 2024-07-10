//
//  NetworkingService+Tour.swift
//  SessionManagment
//
//  Created by Miguel Hernandez on 4/30/24.
//

import Foundation

extension NetworkingService {
    
    struct Tour: Codable {
        let id: Int
        let type: String
        let name: String
        let description: String
        let rating: Double
        let price: Double
        let imageURL: String
    }
}

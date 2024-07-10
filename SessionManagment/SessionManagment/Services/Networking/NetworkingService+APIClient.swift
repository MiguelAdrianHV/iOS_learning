//
//  NetworkingService+APIClient.swift
//  SessionManagment
//
//  Created by Miguel Hernandez on 4/30/24.
//

import Foundation

extension NetworkingService {
    
    class APIClient: BaseAPICLient<TourRouter>, NetworkingServiceProtocol {
        func fetchTours() async throws -> [NetworkingService.Tour] {
            return try await request([Tour].self, router: .fetchTours)
        }
        
        func fetchTourDetails(tourId: String) async throws -> NetworkingService.Tour {
            return try await request(Tour.self, router: .fetchTourDetails(tourId: tourId))
        }
    }
}

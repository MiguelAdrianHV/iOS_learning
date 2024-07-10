//
//  NetworkRepository.swift
//  SessionManagment
//
//  Created by Miguel Hernandez on 4/30/24.
//

import Foundation

class NetworkRepository: NetworkRepositoryProtocol {
    
    private let networkingService: NetworkingServiceProtocol
    
    init(networkingService: NetworkingServiceProtocol) {
        self.networkingService = networkingService
    }
    
    func fetchTours() async throws -> [NetworkingService.Tour] {
        return try await networkingService.fetchTours()
    }
    
    func fetchTourDetails(tourId: String) async throws -> NetworkingService.Tour {
        return try await networkingService.fetchTourDetails(tourId: tourId)
    }
    
    
}

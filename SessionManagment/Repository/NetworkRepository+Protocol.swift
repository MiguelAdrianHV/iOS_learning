//
//  NetworkRepository+Protocol.swift
//  SessionManagment
//
//  Created by Miguel Hernandez on 4/30/24.
//

import Foundation

protocol NetworkRepositoryProtocol {
    func fetchTours() async throws -> [NetworkingService.Tour]
    func fetchTourDetails(tourId: String) async throws -> NetworkingService.Tour
}

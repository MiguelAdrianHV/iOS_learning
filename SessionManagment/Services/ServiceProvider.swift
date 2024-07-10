//
//  ServiceProvider.swift
//  SessionManagment
//
//  Created by Miguel Hernandez on 11/22/23.
//

import Foundation

/// Conforms to this protocol to prove access to different services
protocol ServiceProvider {
    
    // Manages the alert views
    var alertsService: AlertsService { get }
    
    // Manage the Login HTTP Request
    var networkService: NetworkService { get }
    
    // Manages all the HTTP request
    var networkRepository: NetworkRepository { get }
    
    // Manages the user defaults values
    var userDefaultsService: UserDefaultsService { get }
}

class AppServiceProvider: ServiceProvider {
    
    lazy var alertsService: AlertsService = {
        return AlertsService()
    }()
    
    lazy var networkService: NetworkService = {
        return NetworkService()
    }()
    
    lazy var userDefaultsService: UserDefaultsService = {
        return UserDefaultsService()
    }()
    
    var networkRepository: NetworkRepository {
        return NetworkRepository(networkingService: NetworkingService.APIClient())
    }
    
    
}

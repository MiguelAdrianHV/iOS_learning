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
}

class AppServiceProvider: ServiceProvider {
    
    lazy var alertsService: AlertsService = {
        return AlertsService()
    }()
}

//
//  UserDefaultsService.swift
//  SessionManagment
//
//  Created by Miguel Hernandez on 6/6/24.
//

import Foundation

class UserDefaultsService {
    
    private lazy var userDefaults = UserDefaults.standard
    
    var dataTours: Data? {
        return userDefaults.value(forKey: Self.favorites) as? Data
    }
    
    var tours: [NetworkingService.Tour] {
        guard let data = dataTours else {
            return []
        }
        return try! PropertyListDecoder().decode([NetworkingService.Tour].self, from: data)
    }
    
    func addTour(tour: NetworkingService.Tour) {
        
        if tours.isEmpty {
            userDefaults.setValue(try? PropertyListEncoder().encode([tour]), forKey: Self.favorites)
        } else {
            
            // This validates that the tour does not exist in the userDefaults.
            let filterTour = tours.filter {
                $0.id == tour.id
            }
            
            if filterTour.isEmpty {
                var savedTours = self.tours
                savedTours.append(tour)
                userDefaults.setValue(try? PropertyListEncoder().encode(savedTours), forKey: Self.favorites)
            }
        }
    }
    
    func removeTour(tour: NetworkingService.Tour) {
        let savedTours = tours.filter {
            $0.id == tour.id
        }
        userDefaults.setValue(try? PropertyListEncoder().encode(savedTours), forKey: Self.favorites)
    }
    
    func validateTour(tour: NetworkingService.Tour) -> Bool{
        return tours.contains(where: { element in
            element.id == tour.id
        })
    }
}

// MARK: - Constance
private extension UserDefaultsService {
    static let favorites = "favoritesArray"
}

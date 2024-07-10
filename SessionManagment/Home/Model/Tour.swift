//
//  Tour.swift
//  SessionManagment
//
//  Created by Miguel Hernandez on 2/16/24.
//

import Foundation

struct Tour: Codable {
    let id: String
    let name: String
    let shortDescription: String
    let descriptoin: String
    let stars: Double
    let reviews: String
    let image: String
}

extension Tour {
    static let tours = [
        Tour(id: "1", name: "Alley Palace", shortDescription: "Hot Deal", descriptoin: "", stars: 4.7, reviews: "335", image: ""),
        Tour(id: "2", name: "Coeurdes Alpes", shortDescription: "Hot Deal", descriptoin: "", stars: 4.6, reviews: "250", image: ""),
        Tour(id: "3", name: "Explore Aspen", shortDescription: "", descriptoin: "", stars: 4.4, reviews: "260", image: ""),
        Tour(id: "4", name: "Luxurious Aspen", shortDescription: "Hot Deal", descriptoin: "", stars: 4.3, reviews: "190", image: ""),
        Tour(id: "5", name: "Alley Palace", shortDescription: "Hot Deal", descriptoin: "", stars: 4.2, reviews: "500", image: ""),
        Tour(id: "6", name: "Coeurdes Alpes", shortDescription: "Hot Deal", descriptoin: "", stars: 4.1, reviews: "290", image: ""),
        Tour(id: "7", name: "Explore Aspen", shortDescription: "Hot Deal", descriptoin: "", stars: 4.1, reviews: "401", image: ""),
        Tour(id: "8", name: "Luxurious Aspen", shortDescription: "Hot Deal", descriptoin: "", stars: 4.2, reviews: "345", image: ""),
        
    ]
        
}

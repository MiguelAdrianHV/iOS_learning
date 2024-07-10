//
//  RecommendedTourViewModel.swift
//  SessionManagment
//
//  Created by Miguel Hernandez on 2/20/24.
//

import Foundation
import Combine
import UIKit

protocol RecommendedTourCellViewModelDelegate: AnyObject {
    // Nothing to do yet.
}

class RecommendedTourCellViewModel {
    
    /// Binding
    @Published private(set) var titleText: String?
    @Published private(set) var shortDescriptionText: String?
    @Published private(set) var imageURL: URL?
    
    private let serviceProvider: ServiceProvider
    private let Tour: NetworkingService.Tour
    weak var delegate: RecommendedTourCellViewModelDelegate?
    
    init(serviceProvider: ServiceProvider,
         Tour: NetworkingService.Tour) {
        self.serviceProvider = serviceProvider
        self.Tour = Tour
        applyBindings()
    }
}

// MARK: - Private Methods
private extension RecommendedTourCellViewModel {
    
    func applyBindings() {
        titleText = Tour.name
        shortDescriptionText = Tour.description
        imageURL = URL(string: Tour.imageURL)
    }
}

// MARK: - CellViewModel
extension RecommendedTourCellViewModel: CellViewModel {
    var cellIdentifier: String {
        return "RecommendedTourCell"
    }
}

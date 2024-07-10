//
//  RecommendedToursViewModel.swift
//  SessionManagment
//
//  Created by Miguel Hernandez on 2/20/24.
//

import Foundation
import Combine
import UIKit

protocol RecommendedToursCellViewModelDelegate: AnyObject {
    // Nothing to do yet.
}

class RecommendedToursCellViewModel {
    
    private var serviceProvider: ServiceProvider
    private var cellViewModels = [RecommendedTourCellViewModel]()
    private var tours: [NetworkingService.Tour]
    
    /// Binding
    @Published private(set) var titleText: String?
    
    let reloadData = Command<Void>()
    
    weak var delegate: RecommendedToursCellViewModelDelegate?
    
    init(serviceProvider: ServiceProvider,
         tours: [NetworkingService.Tour]) {
        self.serviceProvider = serviceProvider
        self.tours = tours
        applyBindings()
        generateCellViewModels()
    }
}

// MARK: - Private Methods
private extension RecommendedToursCellViewModel {
    
    func applyBindings() {
        titleText = "Recommended"
    }
    
    func generateCellViewModels() {
        cellViewModels = tours.map({
            let cellViewModel = RecommendedTourCellViewModel(serviceProvider: serviceProvider, Tour: $0)
            cellViewModel.delegate = self
            return cellViewModel
        })
        reloadData.send()
    }
}

// MARK: - Public Methods
extension RecommendedToursCellViewModel {
    
    var totalCellViewModels: Int {
        return cellViewModels.count
    }
    
    func cellViewModel(at indexPath: IndexPath) -> RecommendedTourCellViewModel? {
        let indexRow = indexPath.row
        guard cellViewModels.indices.contains(indexRow) else {
            return nil
        }
        return cellViewModels[indexRow]
    }
}

//MARK: -
extension RecommendedToursCellViewModel: RecommendedTourCellViewModelDelegate {
    
}

// MARK: - CellViewModel
extension RecommendedToursCellViewModel: CellViewModel {
    var cellIdentifier: String {
        return "RecommendedToursCell"
    }
}

//
//  ToursCellViewModel.swift
//  SessionManagment
//
//  Created by Miguel Hernandez on 2/16/24.
//

import Foundation
import Combine
import UIKit

protocol ToursCellViewModelDelegate: AnyObject {
    func viewModel(_ viewModel: ToursCellViewModel, didSelectTour tour: NetworkingService.Tour)
}

class ToursCellViewModel {
    
    private var serviceProvider: ServiceProvider
    private var cellViewModels = [TourCellViewModel]()
    private let tours: [NetworkingService.Tour]
    
    
    /// Binding
    @Published private(set) var titleText: String?
    @Published private(set) var buttonText: String?
    
    let reloadData = Command<Void>()
    
    weak var delegate: ToursCellViewModelDelegate?
    
    init(serviceProvider: ServiceProvider,
         tours: [NetworkingService.Tour],
         titleText: String,
         buttonText: String) {
        self.serviceProvider = serviceProvider
        self.tours = tours
        self.titleText = titleText
        self.buttonText = buttonText
        generateCellViewModels()
        
    }
}

// MARK: - Private Methods
private extension ToursCellViewModel {
    
    func appllyBindings() {
        titleText = "Popular"
        buttonText = "See All"
    }
    
    func generateCellViewModels() {
        cellViewModels = tours.map({
            let cellViewModel = TourCellViewModel(serviceProvider: serviceProvider, tour: $0)
            cellViewModel.delegate = self
            return cellViewModel
        })
        reloadData.send()
    }
}

// MARK: - Public Methods
extension ToursCellViewModel {
    
    var totalCellViewModels: Int {
        return cellViewModels.count
    }
    
    func cellViewModel(at indexPath: IndexPath) -> TourCellViewModel? {
        let indexRow = indexPath.row
        guard cellViewModels.indices.contains(indexRow) else {
            return nil
        }
        return cellViewModels[indexRow]
    }
}

// MARK: - TourCellViewModelDelegate
extension ToursCellViewModel: TourCellViewModelDelegate {
    func viewModel(_ viewModel: TourCellViewModel, didSelectTour tour: NetworkingService.Tour) {
        delegate?.viewModel(self, didSelectTour: tour)
    }
}

// MARK: - CellViewModel
extension ToursCellViewModel: CellViewModel {
    var cellIdentifier: String {
        return "ToursCell"
    }
}


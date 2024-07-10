//
//  CategoryCellsViewModel.swift
//  SessionManagment
//
//  Created by Miguel Hernandez on 2/13/24.
//

import Foundation
import Combine
import UIKit

protocol CategoriesCellViewModelDelegate: AnyObject {
    // Nothing to do yet.
}

class CategoriesCellViewModel: CategoryCellViewModelDelegate {
    /// Binding
    @Published private(set) var title: String?
    
    private let serviceProvider: ServiceProvider
    private let categories: [Category]
    private var cellViewModels = [CategoryCellViewModel]()
    
    let reloadData = Command<Void>()
    
    weak var delegate: CategoriesCellViewModelDelegate?
    
    init(serviceProvider: ServiceProvider,
         categories: [Category]) {
        
        self.serviceProvider = serviceProvider
        self.categories = categories
        generateViewModels()
    }
}

// MARK: - Private Methods
private extension CategoriesCellViewModel {
    
    func generateViewModels() {
        cellViewModels = categories.map({
            let cellViewModel = CategoryCellViewModel(serviceProvider: serviceProvider, categories: $0)
            cellViewModel.delegate = self
            return cellViewModel
        })
        
        reloadData.send()
    }
}

// MARK: - Public Methods
extension CategoriesCellViewModel {
    
    var totalCellViewModels: Int {
        return cellViewModels.count
    }
    
    func cellViewModel(at indexPath: IndexPath) -> CategoryCellViewModel? {
        let indexRow = indexPath.row
        guard cellViewModels.indices.contains(indexRow) else {
            return nil
        }
        return cellViewModels[indexRow]
    }
}

extension CategoriesCellViewModel: CategoriesCellViewModelDelegate {
    
}

// MARK: - CellViewModel
extension CategoriesCellViewModel: CellViewModel {
    var cellIdentifier: String {
        return "CategoriesCell"
    }
}

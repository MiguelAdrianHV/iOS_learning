//
//  CategoryViewModel.swift
//  SessionManagment
//
//  Created by Miguel Hernandez on 2/13/24.
//

import Foundation
import Combine
import UIKit

protocol CategoryCellViewModelDelegate: AnyObject {
    // Nothing to do yet.
}

class CategoryCellViewModel {
    
    /// Binding
    @Published private(set) var title: String?
    @Published private(set) var isSelected: Bool = false
    
    private let serviceProvider: ServiceProvider
    private let categories: Category
    
    weak var delegate: CategoryCellViewModelDelegate?
    
    init(serviceProvider: ServiceProvider,
         categories: Category) {
        
        self.serviceProvider = serviceProvider
        self.categories = categories
        applyBindings()
    }
}

// MARK: - Private Methods
private extension CategoryCellViewModel {
    
    func applyBindings() {
        title = categories.title
    }
}

// MARK: - CellViewModel
extension CategoryCellViewModel: CellViewModel {
    var cellIdentifier: String {
        return "CategoryCell"
    }
}

// MARK: - Handler Methods

extension CategoryCellViewModel {
    
    func handleCellSelection(with state: Bool) {
        isSelected = state
    }
}

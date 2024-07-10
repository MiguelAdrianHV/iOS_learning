//
//  CellViewModel.swift
//  SessionManagment
//
//  Created by Miguel Hernandez on 2/13/24.
//

import Foundation

// Generic viewModel file for cells to work with
protocol CellViewModel: CellIdentifier {
    
}

// For cellView to configure varius view models in a generic way
protocol CellViewModelConfigurable {
    
    // Called from 'tableView: cellForRowAt' or 'tableView: cellForItemAtIndexPath'
    func configure(cellViewModel: CellViewModel)
}

// MARK: - Default implementation
extension CellViewModelConfigurable {
    func configure(cellViewModel: CellViewModel) {}
}

//
//  RecommendedToursCell.swift
//  SessionManagment
//
//  Created by Miguel Hernandez on 2/20/24.
//

import Foundation
import UIKit

class RecommendedToursCell: UICollectionViewCell {
    
    @IBOutlet private var collectionView: UICollectionView!
    @IBOutlet private var titleLable: UILabel!
    
    private var bindings = Bindings()
    private var viewModel: RecommendedToursCellViewModel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        bindings.removeAll()
    }
    
}

// MARK: - UICollectionViewDataSource
extension RecommendedToursCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.totalCellViewModels
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cellViewModel = viewModel.cellViewModel(at: indexPath) else {
            return UICollectionViewCell()
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellViewModel.cellIdentifier, for: indexPath)
        if let configurable = cell as? CellViewModelConfigurable {
            configurable.configure(cellViewModel: cellViewModel)
        }
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension RecommendedToursCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 180, height: 150)
    }
}

// MARK: - CellViewModelConfigurable
extension RecommendedToursCell: CellViewModelConfigurable {
    
    func configure(cellViewModel: CellViewModel) {
        guard let cellViewModel = cellViewModel as? RecommendedToursCellViewModel else {
            return
        }
        
        self.viewModel = cellViewModel;
        bindings.removeAll()
        
        viewModel.$titleText
            .assign(to: \.text, on: titleLable)
            .store(in: &bindings)
        
        viewModel.reloadData
            .sink { [collectionView] in
                collectionView?.reloadData()
            }
            .store(in: &bindings)
    }
}

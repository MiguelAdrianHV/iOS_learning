//
//  RecommendedTourCell.swift
//  SessionManagment
//
//  Created by Miguel Hernandez on 2/20/24.
//

import Foundation
import UIKit

class RecommendedTourCell: UICollectionViewCell {
    
    @IBOutlet private var wrapperview: UIView!
    @IBOutlet private var backgroundImage: UIImageView!
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var shortDescriptionLabel: UILabel!
    
    private var bindings = Bindings()
    private var viewModel: RecommendedTourCellViewModel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        wrapperview.applyShadow()
        wrapperview.layer.cornerRadius = 10
        backgroundImage.layer.cornerRadius = 10
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        bindings.removeAll()
    }
    
}

// MARK: - CellViewModelConfigurable
extension RecommendedTourCell: CellViewModelConfigurable {
    
    func configure(cellViewModel: CellViewModel) {
        guard let cellViewModel = cellViewModel as? RecommendedTourCellViewModel else {
            return
        }
        
        self.viewModel = cellViewModel;
        bindings.removeAll()
        
        viewModel.$titleText
            .assign(to: \.text, on: titleLabel)
            .store(in: &bindings)
        
        viewModel.$shortDescriptionText
            .assign(to: \.text, on: shortDescriptionLabel)
            .store(in: &bindings)
        
        viewModel.$imageURL
            .sink{ [backgroundImage] in
                backgroundImage?.kf.setImage(with: $0, options: [.cacheOriginalImage, .transition(.fade(1))])
                backgroundImage?.kf.indicatorType = .activity
            }
            .store(in: &bindings)
    }
}

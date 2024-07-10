//
//  TourCell.swift
//  SessionManagment
//
//  Created by Miguel Hernandez on 2/16/24.
//

import Foundation
import UIKit

class WishlistCell: UITableViewCell {
    
    @IBOutlet private var wrapperview: UIView!
    @IBOutlet private var backgroundImage: UIImageView!
    @IBOutlet private var reviewView: UIView!
    @IBOutlet private var reviewLabel: UILabel!
    @IBOutlet private var titleView: UIView!
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var favoriteView: UIView!
    @IBOutlet private var favoriteImage: UIImageView!
    @IBOutlet private var favoritebutton: UIButton!
    
    
    private var bindings = Bindings()
    private var viewModel: WishlistCellViewModel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        titleView.layer.cornerRadius = 10
        reviewView.layer.cornerRadius = 10
        wrapperview.layer.cornerRadius = 10
        backgroundImage.layer.cornerRadius = 10
        favoriteView.layer.cornerRadius = favoriteView.bounds.width / 2
        favoriteView.clipsToBounds = true
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        bindings.removeAll()
    }
    
}

// MARK: - CellViewModelConfigurable
extension WishlistCell: CellViewModelConfigurable {
    
    func configure(cellViewModel: CellViewModel) {
        guard let cellViewModel = cellViewModel as? WishlistCellViewModel else {
            return
        }
        
        self.viewModel = cellViewModel;
        bindings.removeAll()
        
        viewModel.$titleText
            .assign(to: \.text, on: titleLabel)
            .store(in: &bindings)
        
        viewModel.$reviewText
            .assign(to: \.text, on: reviewLabel)
            .store(in: &bindings)
        
        viewModel.$imageURL
            .sink{ [backgroundImage] in
                backgroundImage?.kf.setImage(with: $0, options: [.cacheOriginalImage, .transition(.fade(1))])
                backgroundImage?.kf.indicatorType = .activity
            }
            .store(in: &bindings)
        
        viewModel.$isFavoriteButtonSelected
            .sink{ [favoriteImage] in
                favoriteImage?.image = UIImage(named: "Favorite")
                favoriteImage?.tintColor = $0 ? .red : .lightGray
            }
            .store(in: &bindings)
    }
}

    // MARK: - ACTIONS
private extension WishlistCell {
    
    @IBAction func didTapFavoriteButton(_ sender: Any) {
        viewModel.handleFavoriteSelection()
    }
}

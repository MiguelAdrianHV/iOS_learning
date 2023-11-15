//
//  MovieCollectionViewCell.swift
//  CollectionViewa
//
//  Created by Miguel Hernandez on 11/9/23.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private var bodyView: UIView!
    @IBOutlet private var nameLable: UILabel!
    @IBOutlet private var actorLabel: UILabel!
    @IBOutlet private var typeLable: UILabel!
    @IBOutlet private var movieImage: UIImageView!
    @IBOutlet private var downloadImage: UIImageView!
    @IBOutlet private var circleImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        movieImage.layer.cornerRadius = 10
        bodyView.applyShadow()
    }
    
    func configureCell(with movie: Movie) {
        nameLable.text = movie.name
        actorLabel.text = movie.actor
        typeLable.text = movie.type
        movieImage.kf.setImage(with: movie.imageURL)
        downloadImage.image = UIImage(systemName: "square.and.arrow.down")?.withTintColor(.lightGray, renderingMode: .alwaysOriginal)
        circleImage.image = UIImage(systemName: "dot.circle.fill")?.withTintColor(.lightGray, renderingMode: .alwaysOriginal)
    }
}

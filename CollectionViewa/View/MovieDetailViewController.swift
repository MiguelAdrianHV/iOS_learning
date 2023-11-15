//
//  MovieDetailViewController.swift
//  CollectionViewa
//
//  Created by Miguel Hernandez on 11/9/23.
//

import UIKit
import Kingfisher

class MovieDetailViewController: UIViewController {

    @IBOutlet private var movieImage: UIImageView!
    @IBOutlet private var movieTitleLable: UILabel!
    @IBOutlet private var movieCategoryLable: UILabel!
    
    var movie: Movie!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard movie != nil else {
            assertionFailure("Movie is required for \(Self.self) to work")
            return
        }
        
        configureView()
    }
}

private extension MovieDetailViewController {
    
    func configureView() {
        self.title = movie.name
        movieImage.kf.setImage(with: movie.imageURL)
        
        movieTitleLable.text = movie.name
        
        movieCategoryLable.text = movie.type
    }
}

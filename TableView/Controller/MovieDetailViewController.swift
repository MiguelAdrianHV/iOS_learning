//
//  MovieDetailViewController.swift
//  TableView
//
//  Created by Miguel Hernandez on 10/24/23.
//

import UIKit



class MovieDetailViewController: UIViewController {

    @IBOutlet private var movieView: UIView!
    @IBOutlet private var movieImage: UIImageView!
    
    @IBOutlet private var movieTitleView: UIView!
    @IBOutlet private var movieTitleLable: UILabel!
    
    @IBOutlet private var movieCategoryView: UIView!
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
        movieView.layer.cornerRadius = 12
        movieImage.image = UIImage(named: movie.imageURL)
        
        movieTitleView.layer.cornerRadius = 12
        movieTitleLable.text = movie.name
        
        movieCategoryView.layer.cornerRadius = 12
        movieCategoryLable.text = movie.type
    }
}

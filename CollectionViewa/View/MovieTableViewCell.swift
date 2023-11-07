//
//  MovieCollectionViewCell.swift
//  CollectionViewa
//
//  Created by Miguel Hernandez on 11/6/23.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    @IBOutlet private var collectionView: UICollectionView!
    
    private var movies = [Movie]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.dataSource = self
        collectionView.reloadData()
    }
    
    func configCell(with movies: [Movie]) {
        self.movies = movies
        collectionView.reloadData()
    }
}

// MARK: UICOllectionViewDataSource
extension MovieTableViewCell: UICollectionViewDataSource {
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionView", for: indexPath) as! UICollectionView
            cell.configureCell(with: movies[indexPath.row])
        }
    }


// MARK: UICollectionViewDelegate
extension MovieTableViewCell: UICollectionViewDelegate {
    
}

// MARK: UICollectionViewDelegateFlowLayout
extension MovieTableViewCell: UICollectionViewDelegateFlowLayout {
    
    // Metodo para configurar el tamaño de las letras en ek cik
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let lay = collectionViewLayout as! UICollectionViewFlowLayout
            let numberOfItems: CGFloat = 2
            let widthPerItem = collectionView.frame.width / numberOfItems - lay.minimumInteritemSpacing
            return CGSize(width: widthPerItem, height: 210)
    }
}

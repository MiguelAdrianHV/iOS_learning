//
//  MovieCollectionViewCell.swift
//  CollectionViewa
//
//  Created by Miguel Hernandez on 11/6/23.
//

import UIKit

protocol MovieTableViewCellDelegate: AnyObject {
    
    func tableViewCell(_ tableViewCell: MovieTableViewCell, didSelectMovie movie: Movie)
}

class MovieTableViewCell: UITableViewCell {
    
    @IBOutlet private var collectionView: UICollectionView!
    
    weak var delegate: MovieTableViewCellDelegate?
    
    private var movies = [Movie]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.dataSource = self
        collectionView.delegate = self
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
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCollectionViewCell", for: indexPath) as! MovieCollectionViewCell
        cell.configureCell(with: movies[indexPath.row])
        return cell
    }
    
}


// MARK: UICollectionViewDelegate
extension MovieTableViewCell: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let movieSelected = movies[indexPath.row]
        delegate?.tableViewCell(self, didSelectMovie: movieSelected)

    }
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

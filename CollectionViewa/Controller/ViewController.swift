//
//  ViewController.swift
//  CollectionViewa
//
//  Created by Miguel Hernandez on 11/1/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private var collectionView: UICollectionView!
    @IBOutlet private var collectionView2: UICollectionView!
    @IBOutlet private var collectionView3: UICollectionView!
    
    private let movies: [Movie] = {
        var movies = [Movie]()
        movies.append(contentsOf: Movie.moviesWithA)
        movies.append(contentsOf: Movie.moviesWithB)
        movies.append(contentsOf: Movie.moviesWithC)
        movies.append(contentsOf: Movie.moviesWithD)
        return movies
    }()
    
    private let movies2: [Movie] = {
        var movies = [Movie]()
        movies.append(contentsOf: Movie.moviesWithC)
        return movies
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    
}

// MARK: Private methods
private extension ViewController {
    
    func configureView() {
        self.title = "Movies"
        
        // Collection View
        collectionView.dataSource = self
        collectionView.delegate = self
        
        
        collectionView2.register(UINib(nibName: "MovieCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "MovieCollectionViewCell")
        // Collection View 2
        collectionView2.dataSource = self
        collectionView2.delegate = self
        
        // Collection View 3
        collectionView3.dataSource = self
        collectionView3.delegate = self
        
        // Reload Data
        collectionView.reloadData()
        collectionView2.reloadData()
        collectionView3.reloadData()
        
        
    }
}

// MARK: UICOllectionViewDataSource
extension ViewController: UICollectionViewDataSource {
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView2 == collectionView {
            return movies2.count
        } else {
            return movies.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView2 == collectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCollectionViewCell", for: indexPath) as! MovieCollectionViewCell
            cell.configureCell(with: movies2[indexPath.row])
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCollectionViewCell", for: indexPath) as! MovieCollectionViewCell
            cell.configureCell(with: movies[indexPath.row])
            return cell
        }
    }
}

// MARK: UICollectionViewDelegate
extension ViewController: UICollectionViewDelegate {
    
}

// MARK: UICollectionViewDelegateFlowLayout
extension ViewController: UICollectionViewDelegateFlowLayout {
    
    // Metodo para configurar el tamaño de las letras en ek cik
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView2 == collectionView {
            let lay = collectionViewLayout as! UICollectionViewFlowLayout
            let numberOfItems: CGFloat = 2
            let widthPerItem = collectionView.frame.width / numberOfItems - lay.minimumInteritemSpacing
            return CGSize(width: widthPerItem, height: 210)
        } else {
            let lay = collectionViewLayout as! UICollectionViewFlowLayout
            let numberOfItems: CGFloat = 2
            let widthPerItem = collectionView.frame.width / numberOfItems - lay.minimumInteritemSpacing
            return CGSize(width: widthPerItem, height: 210)
        }
    }
}

//
//  TableViewAndCollectionView_ViewController.swift
//  CollectionViewa
//
//  Created by Miguel Hernandez on 11/6/23.
//

import UIKit

class TableViewAndCollectionView_ViewController: UIViewController {

    @IBOutlet private var tableView: UITableView!
    
    private let movies: [Movie] = {
        var movies = [Movie]()
        movies.append(contentsOf: Movie.moviesWithA)
        movies.append(contentsOf: Movie.moviesWithB)
        movies.append(contentsOf: Movie.moviesWithC)
        movies.append(contentsOf: Movie.moviesWithD)
        return movies
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }

}

// MARK: Private Methods
private extension TableViewAndCollectionView_ViewController {
    
    func configureView() {
        tableView.dataSource = self
        tableView.reloadData()
    }
}

// MARK
extension TableViewAndCollectionView_ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "", for: indexPath) as! MovieTableViewCell
        cell.configCell(with: movies)
        return cell
    }
    
}

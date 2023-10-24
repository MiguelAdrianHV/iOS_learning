//
//  ViewController.swift
//  TableView
//
//  Created by Miguel Hernandez on 10/18/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private var tableView: UITableView!
    
    private var movies: [Movie] = Movie.movies
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "Movies"
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    
}

extension ViewController: UITableViewDataSource {
    
    // Metodos obligatorios para que funcione un Tableview
    // Metodo para mostrar el numero de elementos en una seccion
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // La seccion empieza como 0 en vez de 1. Donde 0 es igual a 1 y 1 es igual.
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Metodo que va a instanciar la celda con el identificador agregado
        let cell = tableView.dequeueReusableCell(withIdentifier: "RowForSectionACell") as! RowForSectionACell
        cell.configureCell(with: Movie.movies[indexPath.row])
        return cell
    }
}

// MARK: DELEGATE

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Movie Selected: \(movies[indexPath.row].name)")
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}


//
//  FirstSolutionTableViewCell.swift
//  TableView
//
//  Created by Miguel Hernandez on 10/20/23.
//

import UIKit

////
////  ViewController.swift
////  TableView
////
////  Created by Miguel Hernandez on 10/18/23.
////
//
//import UIKit
//
//class ViewController: UIViewController {
//    
//    @IBOutlet private var tableView: UITableView!
//    
//    private var movieCount = 0
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view.
//        tableView.dataSource = self
//    }
//    
//    
//}
//
//extension ViewController: UITableViewDataSource {
//    
//    //Metodo no obligatorio
//    // Metodo para indicar el numero de secciones
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 2
//    }
//    
//    // Metodos obligatorios para que funcione un Tableview
//    // Metodo para mostrar el numero de elementos en una seccion
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // La seccion empieza como 0 en vez de 1. Donde 0 es igual a 1 y 1 es igual.
//        if section == 0 {
//            // Numero de elementos
//            return Movie.movies.count
//        } else {
//            return 2
//        }
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        
//        
//        if indexPath.section == 0 {
//            // Metodo que va a instanciar la celda con el identificador agregado
//            let cell = tableView.dequeueReusableCell(withIdentifier: "RowForSectionACell") as! RowForSectionACell
//            
//            cell.configureCell(with: Movie.movies[movieCount])
//            movieCount += 1
//            return cell
//        } else {
//            // Metodo que va a instanciar la celda con el identificador agregado
//            let cell = tableView.dequeueReusableCell(withIdentifier: "RowForSectionBCell") as! RowForSectionBCell
//            return cell
//        }
//    }
//    
//    
//}
//
//

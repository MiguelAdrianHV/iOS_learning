//
//  ViewController.swift
//  TableView
//
//  Created by Miguel Hernandez on 10/18/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private var tableView: UITableView!
    
    private class Section {
        let title: String
        let movies: [Movie]
        
        init(title: String, movies: [Movie]) {
            self.title = title
            self.movies = movies
        }
    }
    
    private var sections = [Section]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "Movies"
        tableView.dataSource = self
        tableView.delegate = self
        
        generateMovies()
    }
    
    
}

private extension ViewController {
    
    func generateMovies() {
        sections.append(Section(title: "A", movies: Movie.moviesWithA))
        sections.append(Section(title: "B", movies: Movie.moviesWithB))
        sections.append(Section(title: "C", movies: Movie.moviesWithC))
        sections.append(Section(title: "D", movies: Movie.moviesWithD))
        
        // Una vex obtenido el contenido a mostrar en el TableView
        // Tenemos que decirle al TableView que el contenido esta listo para mostrarse
        tableView.reloadData()
    }
}


// MARK: DataSource
extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        sections.count // Regresar el numero de secciones disponibles.
    }
    
    // Metodos obligatorios para que funcione un Tableview
    // Metodo para mostrar el numero de elementos en una seccion
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // La seccion empieza como 0 en vez de 1. Donde 0 es igual a 1 y 1 es igual.
        let sectionIndex = section
        return sections[sectionIndex].movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Metodo que va a instanciar la celda con el identificador agregado
        let cell = tableView.dequeueReusableCell(withIdentifier: "RowForSectionACell") as! RowForSectionACell
        
        // sections[Numero de seccion].movie[Numero de pelicula en la seccion]
        let movie = sections[indexPath.section].movies[indexPath.row]
        cell.configureCell(with: movie)
        return cell
    }
    
    // 1er Paso para mostrar la seccion del titulo
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let sectionIndex = section
        return sections[sectionIndex].title
    }
}

// MARK: DELEGATE

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("Movie Selected: \(movies[indexPath.row].name)")
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    // 2ndo paso para mostrar la seccion del titulo
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 36
    }
    
    // Metodo para cambiar el tema (background, font, etc) de la seccion
    // note: Metodo opcional.
    // Tercer paso para mostrar la seccion con el titulo
    // Descomentar para ver la customizacion del section
    //    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
    //        if let headerView = view as? UITableViewHeaderFooterView {
    //            headerView.contentView.backgroundColor = .green
    //            headerView.textLabel?.textColor = .white
    //        }
    //    }
}


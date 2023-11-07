//
//  Movie.swift
//  CollectionViewa
//
//  Created by Miguel Hernandez on 11/1/23.
//

import Foundation

struct Movie {
    let name: String
    let actor: String
    let type: String
    let imageURL: String
}

extension Movie {
    static let moviesWithA: [Movie] = [
        Movie(name: "Anatomy", actor: "Viggo Mortensen", type: "Adventure", imageURL: "green_book_portada"),
        Movie(name: "Action", actor: "Woody", type: "Animation", imageURL: "toy_story_portada"),
        Movie(name: "Alexander", actor: "Ricardo Ferreti", type: "Miedo", imageURL: "dracula_portada")
    ]
    
    static let moviesWithB: [Movie] = [
        Movie(name: "Booking", actor: "Viggo Mortensen", type: "Adventure", imageURL: "green_book_portada"),
        Movie(name: "Billy Hook", actor: "Woody", type: "Animation", imageURL: "toy_story_portada"),
        Movie(name: "Belinda", actor: "Ricardo Ferreti", type: "Miedo", imageURL: "dracula_portada")
    ]
    
    static let moviesWithC: [Movie] = [
        Movie(name: "Calefaction", actor: "Viggo Mortensen", type: "Adventure", imageURL: "green_book_portada"),
        Movie(name: "Center", actor: "Woody", type: "Animation", imageURL: "toy_story_portada"),
        Movie(name: "Cars", actor: "Ricardo Ferreti", type: "Miedo", imageURL: "dracula_portada")
    ]
    
    static let moviesWithD: [Movie] = [
        Movie(name: "Diddi", actor: "Viggo Mortensen", type: "Adventure", imageURL: "green_book_portada"),
        Movie(name: "Dexter", actor: "Woody", type: "Animation", imageURL: "toy_story_portada"),
        Movie(name: "Dembest", actor: "Ricardo Ferreti", type: "Miedo", imageURL: "dracula_portada")
    ]
}

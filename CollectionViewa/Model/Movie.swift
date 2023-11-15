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
    let imageURL: URL?
}

let urlA1 = URL(string: "https://images.unsplash.com/photo-1699656861005-747d6b36b918?q=80&w=3387&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
let urlA2 = URL(string: "https://images.unsplash.com/photo-1699268077481-7c658a3b73c2?q=80&w=2160&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
let urlA3 = URL(string: "https://images.unsplash.com/photo-1522850621283-87a52b7d00e4?q=80&w=1605&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")

let urlB1 = URL(string: "https://images.unsplash.com/photo-1699900000165-a4ce52bc25e9?q=80&w=3640&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
let urlB2 = URL(string: "https://images.unsplash.com/photo-1699871066013-0e1b535dc452?q=80&w=4139&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
let urlB3 = URL(string: "https://images.unsplash.com/photo-1699803895016-72cabdd79107?q=80&w=3862&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")

let urlC1 = URL(string: "https://images.unsplash.com/photo-1682687220945-922198770e60?q=80&w=5070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
let urlC2 = URL(string: "https://images.unsplash.com/photo-1699393393208-6c25d65a4e8b?q=80&w=4160&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
let urlC3 = URL(string: "https://images.unsplash.com/photo-1699634207217-62abca6f066c?q=80&w=4000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")

let urlD1 = URL(string: "https://images.unsplash.com/photo-1698778873705-1b01e3b3574b?q=80&w=5086&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
let urlD2 = URL(string: "https://images.unsplash.com/photo-1694950888587-7dc43b3f30c8?q=80&w=4000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
let urlD3 = URL(string: "https://images.unsplash.com/photo-1699734825395-77d05df67aab?q=80&w=4350&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")

extension Movie {
    
    static let moviesWithA: [Movie] = [
        Movie(name: "Anatomy", actor: "Viggo Mortensen", type: "Adventure", imageURL: urlA1),
        Movie(name: "Action", actor: "Woody", type: "Animation", imageURL: urlA2),
        Movie(name: "Alexander", actor: "Ricardo Ferreti", type: "Miedo", imageURL: urlA3)
    ]
    
    static let moviesWithB: [Movie] = [
        Movie(name: "Booking", actor: "Viggo Mortensen", type: "Adventure", imageURL: urlB1),
        Movie(name: "Billy Hook", actor: "Woody", type: "Animation", imageURL: urlB2),
        Movie(name: "Belinda", actor: "Ricardo Ferreti", type: "Miedo", imageURL: urlB3)
    ]
    
    static let moviesWithC: [Movie] = [
        Movie(name: "Calefaction", actor: "Viggo Mortensen", type: "Adventure", imageURL: urlC1),
        Movie(name: "Center", actor: "Woody", type: "Animation", imageURL: urlC2),
        Movie(name: "Cars", actor: "Ricardo Ferreti", type: "Miedo", imageURL: urlC3)
    ]
    
    static let moviesWithD: [Movie] = [
        Movie(name: "Diddi", actor: "Viggo Mortensen", type: "Adventure", imageURL: urlD1),
        Movie(name: "Dexter", actor: "Woody", type: "Animation", imageURL: urlD2),
        Movie(name: "Dembest", actor: "Ricardo Ferreti", type: "Miedo", imageURL: urlD3)
    ]
}

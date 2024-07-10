//
//  CombineTypeAliases.swift
//  SessionManagment
//
//  Created by Miguel Hernandez on 1/24/24.
//

import Combine

typealias Bindings = Set<AnyCancellable>
typealias Command<T> = PassthroughSubject<T, Never>

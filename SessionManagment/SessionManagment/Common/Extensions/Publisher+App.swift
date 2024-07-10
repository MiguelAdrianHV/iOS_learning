//
//  Publisher+App.swift
//  SessionManagment
//
//  Created by Miguel Hernandez on 1/24/24.
//

import Combine

extension Publisher {
    func assign<Root>(to keyPath: ReferenceWritableKeyPath<Root, Self.Output>,
                      weaklyOn object: Root) -> AnyCancellable where Root: AnyObject, Failure == Never {
        sink { [weak object] in object?[keyPath: keyPath] = $0 }
    }
}

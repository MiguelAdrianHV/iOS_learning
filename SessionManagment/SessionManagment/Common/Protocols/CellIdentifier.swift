//
//  CellIdentifier.swift
//  SessionManagment
//
//  Created by Miguel Hernandez on 2/13/24.
//

import Foundation

// Provides a UITableViewCell or UICollectionViewCell reuse identifier
protocol CellIdentifier: AnyObject {
    var cellIdentifier: String { get }
}

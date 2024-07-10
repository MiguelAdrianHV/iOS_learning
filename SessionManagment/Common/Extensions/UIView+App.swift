//
//  UIView+App.swift
//  SessionManagment
//
//  Created by Miguel Hernandez on 2/20/24.
//

import Foundation
import UIKit

extension UIView {
    func applyShadow(_ borderColor: UIColor? = nil) {
       self.layer.cornerRadius = 10
        self.layer.borderWidth = 3.0
       
       if let borderColor = borderColor {
           self.layer.borderColor = borderColor.cgColor
       } else {
           self.layer.borderColor = UIColor.clear.cgColor
       }

        self.layer.backgroundColor = UIColor.white.cgColor
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowRadius = 1.0
        self.layer.shadowOpacity = 1.0
        self.layer.masksToBounds = false
   }
}


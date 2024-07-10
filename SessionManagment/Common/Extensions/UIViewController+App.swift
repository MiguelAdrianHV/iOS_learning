//
//  UIViewController+App.swift
//  SessionManagment
//
//  Created by Miguel Hernandez on 11/15/23.
//

import Foundation
import UIKit

extension UIViewController {
    
    @available(iOS 13.0, *)
    var sceneDelegate: SceneDelegate {
        return UIApplication.shared.connectedScenes.first?.delegate as! SceneDelegate
    }
}

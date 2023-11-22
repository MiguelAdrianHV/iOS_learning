//
//  LoginViewController.swift
//  SessionManagment
//
//  Created by Miguel Hernandez on 11/15/23.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func didTapPerformButton(_ sender: Any) {
        UserDefaults.standard.set(true, forKey: "isLogged")
        sceneDelegate.validateUserSession()
    }
}

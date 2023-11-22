//
//  ViewController.swift
//  SessionManagment
//
//  Created by Miguel Hernandez on 11/15/23.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func didTapPerformButton(_ sender: Any) {
        UserDefaults.standard.set(false, forKey: "isLogged")
        sceneDelegate.validateUserSession()
    }

}


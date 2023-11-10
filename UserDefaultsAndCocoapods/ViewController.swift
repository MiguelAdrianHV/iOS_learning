//
//  ViewController.swift
//  UserDefaultsAndCocoapods
//
//  Created by Miguel Hernandez on 11/10/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let userDefaults = UserDefaults.standard
        userDefaults.set("Probando userDefaults", forKey: "userDefaultTestingKey")
        
        print(userDefaults.string(forKey: "userDefaultTestingKey") ?? "No hay info")
        
        let isUserLogger = userDefaults.bool(forKey: "isUserLogged")
        
        if isUserLogger {
            print("Mostrar home")
        } else {
            print("Mostrar login")
            userDefaults.set(true, forKey: "isUserLogged")
        }
        
        
        // Como eliminar userDefaults
        userDefaults.removeObject(forKey: "isUserLogged")
    }


}


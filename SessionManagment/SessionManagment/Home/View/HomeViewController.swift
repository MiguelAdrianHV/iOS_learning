//
//  ViewController.swift
//  SessionManagment
//
//  Created by Miguel Hernandez on 11/15/23.
//

import UIKit

class HomeViewController: UIViewController {

    var viewModel: HomeViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard viewModel != nil else {
            assertionFailure("viewModel is required for \(Self.self) to work")
            return
        }    }

    @IBAction func didTapPerformButton(_ sender: Any) {
        UserDefaults.standard.set(false, forKey: "isLogged")
        sceneDelegate.validateUserSession()
    }

}

// MARK: - StoryboardInitializable
extension HomeViewController: StoryboardInitializable {
    static let storyboardName = "Home"
}


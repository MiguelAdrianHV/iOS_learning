//
//  OnBoardingViewController.swift
//  SessionManagment
//
//  Created by Miguel Hernandez on 2/7/24.
//

import UIKit

class OnBoardingViewController: UIViewController {

    @IBOutlet private var exploreButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        exploreButton.layer.cornerRadius = 15
        
    }
}

// MARK: - StoryboardIntitializable
extension OnBoardingViewController: StoryboardInitializable {
    static let storyboardName = "OnBoarding"
}

// MARK: - Action Methods
private extension OnBoardingViewController {
    
    @IBAction func didTapExploreButton() {
        sceneDelegate.validateUserSession()
    }
}



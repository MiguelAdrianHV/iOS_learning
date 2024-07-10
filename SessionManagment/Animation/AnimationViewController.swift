//
//  AnimationViewController.swift
//  SessionManagment
//
//  Created by Miguel Hernandez on 1/31/24.
//

import UIKit
import Lottie

class AnimationViewController: UIViewController {

    private var animationView: LottieAnimationView?
    override func viewDidLoad() {
        super.viewDidLoad()

        animationView = LottieAnimationView(name: "Loading")
        animationView?.frame = view.bounds
        animationView?.contentMode = .scaleAspectFit
        
        // Config to loop the animation
        animationView?.loopMode = .loop
        animationView?.animationSpeed = 0.5
        
        guard let animationView = animationView else {
            return
        }
        
        view.addSubview(animationView)
        animationView.play()
        
    }
}

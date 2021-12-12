//
//  SpashViewController.swift
//  MorAuto
//
//  Created by Manuel Moreno Cámara on 4/12/21.
//

import UIKit

class SplashViewController: UIViewController {
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        activityIndicator?.startAnimating()
        splashToMain()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        activityIndicator?.stopAnimating()
        
    }
    
    private func splashToMain() {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3)) { [weak self] in
            let storyBoardMain = UIStoryboard(name: "Main", bundle: nil)
            
            if let destination = storyBoardMain.instantiateInitialViewController() {
                self?.navigationController?.setViewControllers([destination], animated: true)
            }
        }
    }
}

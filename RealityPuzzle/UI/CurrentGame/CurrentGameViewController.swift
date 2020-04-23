//
//  CurrentGameViewController.swift
//  RealityPuzzle
//
//  Created by Oleksii Lytvynov-Bohdanov on 23.04.2020.
//  Copyright © 2020 Oleksii Lytvynov-Bohdanov. All rights reserved.
//

import UIKit

class CurrentGameViewController: ViewControllerBindable<CurrentGameModel> {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    @IBAction func mainMenuPressed(_ sender: UIButton) {
        navigateToMainScreen()
    }
    
    private func navigateToMainScreen() {
        navigationController?.setNavigationBarHidden(false, animated: false)
        navigationController?.popToRootViewController(animated: false)
    }
}

//
//  CurrentGameViewController.swift
//  RealityPuzzle
//
//  Created by Oleksii Lytvynov-Bohdanov on 23.04.2020.
//  Copyright © 2020 Oleksii Lytvynov-Bohdanov. All rights reserved.
//

import UIKit

class CurrentGameViewController: ViewControllerBindable<CurrentGameViewModel> {
    @IBOutlet weak var boardView: Board!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: false)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if boardView.subviews.count == 0 {
            boardView.gameSize = viewModel.gameSize
        }
    }

    @IBAction func mainMenuPressed(_ sender: UIButton) {
        navigateToMainScreen()
    }
    
    private func navigateToMainScreen() {
        navigationController?.setNavigationBarHidden(false, animated: false)
        navigationController?.popToRootViewController(animated: false)
    }
}

//
//  NewGameViewController.swift
//  RealityPuzzle
//
//  Created by Oleksii Lytvynov-Bohdanov on 23.04.2020.
//  Copyright © 2020 Oleksii Lytvynov-Bohdanov. All rights reserved.
//

import UIKit

class NewGameViewController: ViewControllerBindable<NewGameViewModel> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = viewModel.titleModel
    }
    
    @IBAction func gameNumberPressed(_ sender: UIButton) {
        startGame(with: sender.tag)
    }
    
    private func startGame(with size: Int) {
        let viewModel = CurrentGameViewModel(sizeGame: size)
        let viewController = CurrentGameViewController(viewModel)
        navigationController?.pushViewController(viewController, animated: false)
    }
}

//
//  MainViewController.swift
//  RealityPuzzle
//
//  Created by Oleksii Lytvynov-Bohdanov on 23.04.2020.
//  Copyright © 2020 Oleksii Lytvynov-Bohdanov. All rights reserved.
//

import UIKit

class MainViewController: ViewControllerBindable<MainViewModel> {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = viewModel.titleModel
    }
    
    // MARK: Actions
    @IBAction private func newGamePressed(_ sender: UIButton) {
        presentNewGameScreen()
    }
    
    @IBAction private func leaderboardPressed(_ sender: UIButton) {
        presentLeaderboardScreen()
    }
    
    private func presentNewGameScreen() {
        let viewModel = NewGameModel()
        let newGameController = NewGameViewController(viewModel)
        navigationController?.pushViewController(newGameController, animated: false)
    }
    
    private func presentLeaderboardScreen() {
        let viewModel = LeaderboardModel()
        let newGameController = LeaderboardViewController(viewModel)
        navigationController?.pushViewController(newGameController, animated: false)
    }
}

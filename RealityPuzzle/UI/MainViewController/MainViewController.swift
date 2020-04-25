//
//  MainViewController.swift
//  RealityPuzzle
//
//  Created by Oleksii Lytvynov-Bohdanov on 23.04.2020.
//  Copyright © 2020 Oleksii Lytvynov-Bohdanov. All rights reserved.
//

import UIKit

class MainViewController: ViewControllerBindable<MainViewModel> {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = viewModel.titleModel
    }
    
    // MARK: Actions
    @IBAction private func newGamePressed(_ sender: UIButton) {
        presentNewGameScreen()
    }
    
    @IBAction private func leaderboardPressed(_ sender: UIButton) {
        presentLeaderboardScreen()
    }

    @IBAction func changeUserPressed(_ sender: UIButton) {
        presentSelectUserScreen()
    }
    
    private func presentNewGameScreen() {
        let viewModel = NewGameViewModel()
        let newGameController = NewGameViewController(viewModel)
        navigationController?.pushViewController(newGameController, animated: false)
    }
    
    private func presentLeaderboardScreen() {
        let viewModel = LeaderboardModelView()
        let newGameController = LeaderboardViewController(viewModel)
        navigationController?.pushViewController(newGameController, animated: false)
    }
    
    private func presentSelectUserScreen() {
        let viewModel = UsersOverviewViewModel()
        let viewControlller = UsersOverviewViewController(viewModel)
        navigationController?.pushViewController(viewControlller, animated: false)
    }
}

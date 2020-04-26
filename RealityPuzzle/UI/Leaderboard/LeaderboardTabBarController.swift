//
//  LeaderboardTabBarController.swift
//  RealityPuzzle
//
//  Created by Oleksii Lytvynov-Bohdanov on 26.04.2020.
//  Copyright © 2020 Oleksii Lytvynov-Bohdanov. All rights reserved.
//

import UIKit

class LeaderboardTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        for gameSize in min_size_game...max_size_game {
            addTabBarItem(gameSize)
        }
    }
    
    private func addTabBarItem(_ gameSize: Int) {
        let viewModel = LeaderboardModelView(gameSize: gameSize)
        
        let viewController = LeaderboardViewController(viewModel)
        viewController.tabBarItem.title = String(gameSize)
        addChild(viewController)
    }
}

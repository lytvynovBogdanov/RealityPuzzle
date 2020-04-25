//
//  CurrentGameViewModel.swift
//  RealityPuzzle
//
//  Created by Oleksii Lytvynov-Bohdanov on 23.04.2020.
//  Copyright © 2020 Oleksii Lytvynov-Bohdanov. All rights reserved.
//

import Foundation

struct CurrentGameViewModel {
    let gameSize: Int
    init(sizeGame: Int) {
        if sizeGame < min_size_game {
            self.gameSize = min_size_game
        } else if sizeGame > max_size_game {
            self.gameSize = max_size_game
        } else {
            self.gameSize = sizeGame
        }
    }
}

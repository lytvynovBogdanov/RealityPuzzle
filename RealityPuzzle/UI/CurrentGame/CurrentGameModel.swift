//
//  CurrentGameModel.swift
//  RealityPuzzle
//
//  Created by Oleksii Lytvynov-Bohdanov on 23.04.2020.
//  Copyright © 2020 Oleksii Lytvynov-Bohdanov. All rights reserved.
//

import Foundation

struct CurrentGameModel {
    let sizegame: Int
    init(sizeGame: Int) {
        if sizeGame < min_size_game {
            self.sizegame = min_size_game
        } else if sizeGame > max_size_game {
            self.sizegame = max_size_game
        } else {
            self.sizegame = sizeGame
        }
    }
}

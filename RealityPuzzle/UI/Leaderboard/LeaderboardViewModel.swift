//
//  LeaderboardModelView.swift
//  RealityPuzzle
//
//  Created by Oleksii Lytvynov-Bohdanov on 23.04.2020.
//  Copyright © 2020 Oleksii Lytvynov-Bohdanov. All rights reserved.
//

import Foundation

struct LeaderboardModelView {
    let gameSize: Int
    let gameResults: [GameResult]
    
    init(gameSize: Int) {
        self.gameSize = gameSize
        self.gameResults = GameResult.all(for: gameSize) ?? []
    }
    
    var titleModel: String {
        return String(gameSize)
    }
}

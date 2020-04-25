//
//  Game.swift
//  RealityPuzzle
//
//  Created by Oleksii Lytvynov-Bohdanov on 23.04.2020.
//  Copyright © 2020 Oleksii Lytvynov-Bohdanov. All rights reserved.
//

import Foundation

struct Game {
    let pieces: [Piece]
    let blankPiece: Piece
    let gameLength: Int
    
    private enum PiecePosition {
        case left
        case right
        case top
        case bottom
        case equal
    }
    
    func movePiceIfPossible(_ piece: Piece) {
        
    }
}

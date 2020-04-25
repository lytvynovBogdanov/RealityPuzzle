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
        if isNeighbor(piece, blankPiece) {
            replace(piece, blankPiece)
        }
    }
    
    func replace(_ piece1: Piece, _ piece2: Piece) {
        let coordinate = piece1.coordinateObservable.value
        piece1.coordinateObservable.accept(piece2.coordinateObservable.value)
        piece2.coordinateObservable.accept(coordinate)
    }
    
    func isNeighbor(_ piece1: Piece, _ piece2: Piece) -> Bool {
        return ((piece1.coordinateObservable.value.0 == piece2.coordinateObservable.value.0 - 1 ||
            piece1.coordinateObservable.value.0 == piece2.coordinateObservable.value.0 + 1) &&
            piece1.coordinateObservable.value.1 == piece2.coordinateObservable.value.1) ||
        ((piece1.coordinateObservable.value.1 == piece2.coordinateObservable.value.1 - 1 ||
        piece1.coordinateObservable.value.1 == piece2.coordinateObservable.value.1 + 1) &&
        piece1.coordinateObservable.value.0 == piece2.coordinateObservable.value.0)
    }
}

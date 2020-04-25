//
//  Game.swift
//  RealityPuzzle
//
//  Created by Oleksii Lytvynov-Bohdanov on 23.04.2020.
//  Copyright © 2020 Oleksii Lytvynov-Bohdanov. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

class Game {
    let pieces: [Piece]
    let blankPiece: Piece
    let gameLength: Int
    
    let gameOverObservable = BehaviorRelay(value: false)
    
    private let disposeBag = DisposeBag()
    
    private enum PiecePosition {
        case left
        case right
        case top
        case bottom
        case equal
    }
    
    init(pieces: [Piece], blankPiece: Piece, gameLength: Int) {
        self.pieces = pieces
        self.blankPiece = blankPiece
        self.gameLength = gameLength
        
        blankPiece.coordinateObservable
            .skip(1)
            .subscribe(onNext: { [weak self] (coordinates) in
                if pieces.filter({ $0.coordinateObservable.value != $0.finalCoordinate }).count == 0 {
                    self?.gameOverObservable.accept(true)
                }
            }).disposed(by: disposeBag)
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

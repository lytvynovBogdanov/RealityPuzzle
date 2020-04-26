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
    let currentTimeObservable = BehaviorRelay(value: 0)
    let stepsObservable = BehaviorRelay(value: 0)
    
    private var timer: Timer?
    
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
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { [weak self] _ in
            guard let self = self else { return }
            self.currentTimeObservable.accept(self.currentTimeObservable.value + 1)
        })
        
        blankPiece.coordinateObservable
            .skip(1)
            .subscribe(onNext: { [weak self] (coordinates) in
                if pieces.filter({ $0.coordinateObservable.value != $0.finalCoordinate }).count == 0 {
                    self?.gameOverObservable.accept(true)
                }
            }).disposed(by: disposeBag)
        
        self.gameOverObservable
            .filter { $0 == true }
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] _ in
                self?.timer?.invalidate()
                self?.saveGameResult()
            }).disposed(by: disposeBag)
    }
    
    deinit {
        timer?.invalidate()
    }
    
    private func saveGameResult() {
        let gameResult = GameResult.newEmpty()
        gameResult.steps = Int16(stepsObservable.value)
        gameResult.time = Int16(currentTimeObservable.value)
        gameResult.gameSize = Int16(gameLength)
        gameResult.user = User.current
        CoreDataManager.shared.saveContext()
    }
    
    func movePiceIfPossible(_ piece: Piece) {
        if isNeighbor(piece, blankPiece) {
            replace(piece, blankPiece)
            stepsObservable.accept(stepsObservable.value + 1)
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

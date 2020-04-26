    //
//  Board.swift
//  RealityPuzzle
//
//  Created by Oleksii Lytvynov-Bohdanov on 23.04.2020.
//  Copyright © 2020 Oleksii Lytvynov-Bohdanov. All rights reserved.
//

import UIKit
import RxSwift

class Board: UIView {

    let distanceBetweenElements: CGFloat = 20
    var game: Game?
    
    private var disposeBag = DisposeBag()
    
    @Ranged(minimum: min_size_game, maximum: max_size_game) var gameSize: Int = min_size_game {
        didSet {
            subviews.forEach { $0.removeFromSuperview() }
            let randomArray = GameGenerator.generate(count: gameSize * gameSize)
            generatePieces(numbers: randomArray)
        }
    }
    
    private var buttonSize: CGFloat {
        return (frame.width - ((distanceBetweenElements * CGFloat(gameSize)) + 1.0)) / CGFloat(gameSize)
    }
    
    private func generatePieces(numbers: [Int]) {
        let pieceFrame = CGRect(x: distanceBetweenElements,
                                y: distanceBetweenElements,
                                width: buttonSize,
                                height: buttonSize)
        var currentPosition = (0, 0)
        var blankPiece: Piece!
        var pieces = [Piece]()
        disposeBag = DisposeBag()
        
        func subscribePieceCoordinate(piece: Piece) {
            piece.coordinateObservable
                .subscribe(onNext: { [weak self] (coordinate) in
                    guard let self = self else { return }
                    piece.frame.origin.x = CGFloat(coordinate.0) * self.buttonSize +
                        (CGFloat(coordinate.0) * self.distanceBetweenElements) +
                        (self.distanceBetweenElements / 2)
                    piece.frame.origin.y = CGFloat(coordinate.1) * self.buttonSize +
                        (CGFloat(coordinate.1) * self.distanceBetweenElements) +
                        (self.distanceBetweenElements / 2)
                }).disposed(by: disposeBag)
        }
        
        for number in numbers {
            if number > 0 {
                let finalPositionY = ((Double(number) / Double(gameSize)).rounded(.up)) - 1 // get y position. (from 0 to 2 in 3x3). For example if you have number 8. We want to find the y coordinate (from top to bottom). number 8 / 3 and take the bigger value. So it will be 3 and - 1. So coordinate is 2. For 4 it's 4 / 3 = 2 and - 1 = 1. For 2 is 2 / 3 = 1 - 1 the coordinate is 0. So we have y coordinate
                let finalPositionX = (Double(number) - ((finalPositionY) * Double(gameSize))) - 1 // get x position. The same as for y. if current number is 5, then 1 (y coordinate) * 3 (board width) after the number 5 - 3 = 2 - 1 = 1. the coordinate 1. For number one: 1 - (0 * 3) - 1. Coordinate 0. For 8: 8 - (2 * 3) - 1 = 1 etc.
                let piece = Piece(frame: pieceFrame,
                                  title: String(number),
                                  finalPosition: (Int(finalPositionX), Int(finalPositionY)))
                
                piece.coordinateObservable.accept((currentPosition.0, currentPosition.1))
                subscribePieceCoordinate(piece: piece)
                piece.isUserInteractionEnabled = true
                registerGestures(for: piece)
                pieces.append(piece)
                addSubview(piece)
            } else { // for blank piece
                blankPiece = Piece(coordinate: (currentPosition.0, currentPosition.1),
                                   finalPosition: (gameSize - 1, gameSize - 1))
                subscribePieceCoordinate(piece: blankPiece)
            }
            currentPosition.0 += 1
            if currentPosition.0 == gameSize {
                currentPosition.0 = 0
                currentPosition.1 += 1
            }
        }
        game = Game(pieces: pieces,
                    blankPiece: blankPiece,
                    gameLength: gameSize)
        game?.gameOverObservable
            .filter { $0 == true }
            .subscribe(onNext: { [weak self] (_) in
                self?.isUserInteractionEnabled = false
            }).disposed(by: disposeBag)
    }
    
    private func registerGestures(for label: UILabel) {
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture))
        label.addGestureRecognizer(tap)
    }
    
    @objc private func handleTapGesture(gesture: UISwipeGestureRecognizer) -> Void {
        guard let piece = gesture.view as? Piece else { return }
        game?.movePiceIfPossible(piece)
    }
}

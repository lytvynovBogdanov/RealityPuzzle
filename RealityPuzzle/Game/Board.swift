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
    
    var gameWonCallback: (() -> Void)?
    var userMovedPiece: (() -> Void)?
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
        // the app will select each number and will generate
        // the buttons. currentX and currentY are coordinates (pixels) for current number
//        var currentX = distanceBetweenElements
//        var currentY = distanceBetweenElements
        // the position for the button. for example in the puzzle 3x3 you'll have coordinates between (0, 0) and (2, 2)
        var currentPositionX = 0
        var currentPositionY = 0

        var blankPiece: Piece!
        var pieces = [Piece]()
        
        func subscribePieceCoordinate(piece: Piece) {
            piece.coordinateObservable
                .subscribe(onNext: { [weak self] (coordinate) in
                    guard let self = self else { return }
                    piece.frame.origin.x = CGFloat(coordinate.0) * self.buttonSize +
                        (CGFloat(coordinate.0) * self.distanceBetweenElements) +
                        self.distanceBetweenElements
                    piece.frame.origin.y = CGFloat(coordinate.1) * self.buttonSize +
                        (CGFloat(coordinate.1) * self.distanceBetweenElements) +
                        self.distanceBetweenElements
                }).disposed(by: disposeBag)
        }
        
        for number in numbers {
            if number > 0 {
                let finalPositionY = ((Double(number) / Double(gameSize)).rounded(.up)) - 1 // get y position. (from 0 to 2 in 3x3). For example if you have number 8. We want to find the y coordinate (from top to bottom). number 8 / 3 and take the bigger value. So it will be 3 and - 1. So coordinate is 2. For 4 it's 4 / 3 = 2 and - 1 = 1. For 2 is 2 / 3 = 1 - 1 the coordinate is 0. So we have y coordinate
                let finalPositionX = (Double(number) - ((finalPositionY) * Double(gameSize))) - 1 // get x position. The same as for y. if current number is 5, then 1 (y coordinate) * 3 (board width) after the number 5 - 3 = 2 - 1 = 1. the coordinate 1. For number one: 1 - (0 * 3) - 1. Coordinate 0. For 8: 8 - (2 * 3) - 1 = 1 etc.
                let piece = Piece(frame: pieceFrame,
                                  title: String(number),
                                  finalPosition: (Int(finalPositionX), Int(finalPositionY)))
                
                piece.coordinateObservable.accept((currentPositionX, currentPositionY))
                subscribePieceCoordinate(piece: piece)
                piece.isUserInteractionEnabled = true
                registerGestures(for: piece)
//                piece.frame.origin.x = currentX // set coordinate on the board in the pixels. For example we know that distance between buttons is 20.  The button size is 60, the distance from the board = 20. So the number 3 for example will be 20 + 60 + 20 + 60 + 20. For y is 20 etc.
//                piece.frame.origin.y = currentY // the same for y. from top to bottom
                pieces.append(piece)
                addSubview(piece)
            } else { // for blank piece
                blankPiece = Piece(coordinate: (currentPositionX, currentPositionY),
                                   finalPosition: (gameSize - 1, gameSize - 1))
                subscribePieceCoordinate(piece: blankPiece)
            }
            // move current x/y cooridnates on the frame.
            // we are in the loop. so we need to change current x/y position with button size and distance size
//            currentX += buttonSize + distanceBetweenElements // currentX = currentX + 60 + 20
            currentPositionX += 1 // current position X between (0, 0) - (2, 2)
            if currentPositionX == gameSize { // the app add buttons from left to right and after from top to bottom. If last added element is right element, we need to go to next line (y coordinate)
//                currentX = distanceBetweenElements // set current pixel to begin board (20)
//                currentY += buttonSize + distanceBetweenElements // currenty = currentY + 60 + 20
                currentPositionX = 0
                currentPositionY += 1
            }
        }
        game = Game(pieces: pieces,
                    blankPiece: blankPiece,
                    gameLength: gameSize)
    }
    
    private func registerGestures(for label: UILabel) {
        let tap = UITapGestureRecognizer(target: self,
                                         action: #selector(handleTapGesture))
        label.addGestureRecognizer(tap)
    }
    
    @objc private func handleTapGesture(gesture: UISwipeGestureRecognizer) -> Void {
        guard let piece = gesture.view as? Piece else { return }
        game?.movePiceIfPossible(piece)
    }
}

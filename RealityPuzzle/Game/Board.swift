    //
//  Board.swift
//  RealityPuzzle
//
//  Created by Oleksii Lytvynov-Bohdanov on 23.04.2020.
//  Copyright © 2020 Oleksii Lytvynov-Bohdanov. All rights reserved.
//

import UIKit

class Board: UIView {

    let distanceBetweenElements: CGFloat = 20
    let buttonSize: CGFloat = 60
    
    var gameWonCallback: (() -> Void)?
    var userMovedPiece: (() -> Void)?
    var game: Game?
    
//    private func registerGesture(label: UILabel, direction: UISwipeGestureRecognizer.Direction, selector: Selector
//    ) {
//        let gesture =
//            UISwipeGestureRecognizer(target: self,
//                                     action: selector)
//        gesture.direction = direction
//        label.addGestureRecognizer(gesture)
//    }
    
    private func registerGestures(for label: UILabel) {
        
//        registerGesture(label: label, direction: .left, selector: #selector(handleGesture))
//        registerGesture(label: label, direction: .right, selector: #selector(handleGesture))
//        registerGesture(label: label, direction: .up, selector: #selector(handleGesture))
//        registerGesture(label: label, direction: .down, selector: #selector(handleGesture))
        
        let tap = UITapGestureRecognizer(target: self,
                                         action: #selector(handleTapGesture))
        label.addGestureRecognizer(tap)
    }
    
    @objc private func handleTapGesture(gesture: UISwipeGestureRecognizer) -> Void {
        guard let piece = gesture.view as? Piece else { return }
//        if game.movePiceIfPossible(piece) {
            
//        }
        // TOdO: Move to blank if possible
    }
}

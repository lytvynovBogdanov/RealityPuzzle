//
//  Piece.swift
//  RealityPuzzle
//
//  Created by Oleksii Lytvynov-Bohdanov on 23.04.2020.
//  Copyright © 2020 Oleksii Lytvynov-Bohdanov. All rights reserved.
//

import UIKit
import RxCocoa

class Piece: UILabel {
    var coordinateObservable: BehaviorRelay<(Int, Int)>
    let finalCoordinate: (Int, Int)
    
    var isFinalPosition: Bool {
        return coordinateObservable.value == finalCoordinate
    }
    
    convenience init(coordinate: (Int, Int), finalPosition: (Int, Int)) {
        self.init(frame: CGRect.zero, finalPosition: finalPosition)
        self.coordinateObservable = BehaviorRelay(value: coordinate)
    }
    
    init(frame: CGRect, title: String = "", finalPosition: (Int, Int)) {
        self.finalCoordinate = finalPosition
        self.coordinateObservable = BehaviorRelay(value: (0, 0))
        super.init(frame: frame)
        self.text = title
        self.backgroundColor = .orange
        self.textColor = .white
        self.font = UIFont.systemFont(ofSize: 23)
        self.textAlignment = .center
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.finalCoordinate = (0, 0)
        self.coordinateObservable = BehaviorRelay(value: (0, 0))
        super.init(coder: aDecoder)
    }
}

//
//  Piece.swift
//  RealityPuzzle
//
//  Created by Oleksii Lytvynov-Bohdanov on 23.04.2020.
//  Copyright © 2020 Oleksii Lytvynov-Bohdanov. All rights reserved.
//

import UIKit

class Piece: UILabel {
    var coordinate = (0, 0)
    let finalCoordinate: (Int, Int)
    
    var isFinalPosition: Bool {
        return coordinate == finalCoordinate
    }
    
    convenience init(coordinate: (Int, Int), finalPosition: (Int, Int)) {
        self.init(frame: CGRect.zero, finalPosition: finalPosition)
        self.coordinate = coordinate
    }
    
    init(frame: CGRect, title: String = "", finalPosition: (Int, Int)) {
        self.finalCoordinate = finalPosition
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
        super.init(coder: aDecoder)
    }
}

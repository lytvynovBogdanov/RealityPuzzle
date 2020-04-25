//
//  GameGenerator.swift
//  RealityPuzzle
//
//  Created by Oleksii Lytvynov-Bohdanov on 23.04.2020.
//  Copyright © 2020 Oleksii Lytvynov-Bohdanov. All rights reserved.
//

import Foundation

struct GameGenerator {
    static func generate(count: Int) -> [Int] {
        var array = Array(0..<count)
        var finalArray = [Int]()
        while array.count > 0 {
            let randomNumber = Int.random(in: 0..<array.count)
            finalArray.append(array[randomNumber])
            array.remove(at: randomNumber)
        }
        return finalArray
    }
}

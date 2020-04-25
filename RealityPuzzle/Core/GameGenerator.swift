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
        var finalArray: [Int] = []
        repeat {
            finalArray = randomArray(count: count)
        } while checkValid(array: finalArray)
        
        return finalArray
    }
    
    private static func randomArray(count: Int) -> [Int] {
        var array = Array(0..<count)
        var finalArray = [Int]()
        while array.count > 0 {
            let randomNumber = Int.random(in: 0..<array.count)
            finalArray.append(array[randomNumber])
            array.remove(at: randomNumber)
        }
        return finalArray
    }
    
    private static func countOfInversions(_ array: [Int]) -> Int {
        var count = 0
        for i in 0 ..< array.count {
            let iValue = array[i]
            for j in i + 1 ..< array.count {
                if iValue > array[j] && array[j] > 0 {
                    count += 1
                }
            }
        }
        return count
    }
    
    private static func checkValid(array: [Int]) -> Bool {
        guard let blankIndex = array.firstIndex(of: 0) else { return false } // the index of blank element (0 is blank element)
        
        let countOfInversions = Double(self.countOfInversions(array))
        let gridWidth = Double(array.count).squareRoot()
        let blankIndexFromBottomEven =
        (gridWidth - ((Double(blankIndex) / gridWidth).rounded(.towardZero))).truncatingRemainder(dividingBy: 2) == 0
        
        let gridWidthEven = gridWidth.truncatingRemainder(dividingBy: 2) == 0
        let inversionsEven = countOfInversions.truncatingRemainder(dividingBy: 2) == 0
        if (!gridWidthEven && inversionsEven) ||
            (gridWidthEven && blankIndexFromBottomEven && !inversionsEven) ||
            (gridWidthEven && !blankIndexFromBottomEven && inversionsEven) {
            return true
        }
        return false
    }
}

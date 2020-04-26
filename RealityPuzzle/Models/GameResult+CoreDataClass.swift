//
//  GameResult+CoreDataClass.swift
//  
//
//  Created by Oleksii Lytvynov-Bohdanov on 26.04.2020.
//
//

import Foundation
import CoreData

@objc(GameResult)
public class GameResult: NSManagedObject {
    static func all(for gameSize: Int) -> [GameResult]? {
        let predicate = NSPredicate(format: "\(#keyPath(GameResult.gameSize)) == %d", gameSize)
        return GameResult.fetch(with: predicate, sort: [#keyPath(GameResult.time)], ascending: true) as? [GameResult]
    }
}

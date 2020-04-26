//
//  GameResult+CoreDataProperties.swift
//  
//
//  Created by Oleksii Lytvynov-Bohdanov on 26.04.2020.
//
//

import Foundation
import CoreData


extension GameResult {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<GameResult> {
        return NSFetchRequest<GameResult>(entityName: "GameResult")
    }

    @NSManaged public var steps: Int16
    @NSManaged public var time: Int16
    @NSManaged public var gameSize: Int16
    @NSManaged public var user: User?

}

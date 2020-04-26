//
//  User+CoreDataProperties.swift
//  
//
//  Created by Oleksii Lytvynov-Bohdanov on 26.04.2020.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var name: String?
    @NSManaged public var games: NSSet?

}

// MARK: Generated accessors for games
extension User {

    @objc(addGamesObject:)
    @NSManaged public func addToGames(_ value: GameResult)

    @objc(removeGamesObject:)
    @NSManaged public func removeFromGames(_ value: GameResult)

    @objc(addGames:)
    @NSManaged public func addToGames(_ values: NSSet)

    @objc(removeGames:)
    @NSManaged public func removeFromGames(_ values: NSSet)

}

//
//  User+CoreDataProperties.swift
//  
//
//  Created by Oleksii Lytvynov-Bohdanov on 25.04.2020.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: Self.classString)
    }

    @NSManaged public var name: String?
    @NSManaged public var games: NSSet?

}

// MARK: Generated accessors for metadatas
extension User {

    @NSManaged public func addToUsers(_ value: GameResult)
    @NSManaged public func removeFromUsers(_ value: GameResult)

}

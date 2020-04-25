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
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var name: String?

}

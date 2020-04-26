//
//  User+CoreDataClass.swift
//  
//
//  Created by Oleksii Lytvynov-Bohdanov on 25.04.2020.
//
//

import Foundation
import CoreData

@objc(User)
public class User: NSManagedObject {

    static func find(name: String) -> User? {
        let predicate = NSPredicate(format: "\(#keyPath(User.name)) == %@", name)
        return User.fetch(with: predicate)?.first as? User
    }
    
    static func all() -> [User]? {
        return User.fetch() as? [User]? ?? nil
    }
    
    static var current: User? {
        return find(name: UserPreferences.User.id)
    }
}

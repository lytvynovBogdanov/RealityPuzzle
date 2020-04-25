//
//  NSManagedObject+fetch.swift
//  RealityPuzzle
//
//  Created by Oleksii Lytvynov-Bohdanov on 24.04.2020.
//  Copyright © 2020 Oleksii Lytvynov-Bohdanov. All rights reserved.
//

import Foundation
import CoreData

extension NSManagedObject {
    static func fetch(with predicate: NSPredicate? = nil, sort: [String]? = nil, ascending: Bool = false) -> [NSManagedObject]? {
        
        let managedContext = CoreDataManager.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: Self.classString)
        if let predicate = predicate {
            fetchRequest.predicate = predicate
        }
        
        if let sortValues = sort {
            fetchRequest.sortDescriptors = sortValues.map { NSSortDescriptor(key: $0, ascending: ascending) }
        }

        do {
            let result = try managedContext.fetch(fetchRequest)
            return result
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
            return nil
        }
    }
    
    static func newEmpty() -> Self {
        let managedObjectContext = CoreDataManager.shared.persistentContainer.viewContext
        
        guard let entity = NSEntityDescription.entity(forEntityName: Self.classString, in: managedObjectContext),
            let newObject = NSManagedObject(entity: entity, insertInto: managedObjectContext) as? Self else {
            fatalError("Failed to create \(Self.self)")
        }

        return newObject
    }
}

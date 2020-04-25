//
//  UserDefault+Wrapper.swift
//  RealityPuzzle
//
//  Created by Oleksii Lytvynov-Bohdanov on 25.04.2020.
//  Copyright © 2020 Oleksii Lytvynov-Bohdanov. All rights reserved.
//

import Foundation

@propertyWrapper
struct UserDefault<T> {
    var key: String
    var initialValue: T
    var wrappedValue: T {
        set {
            UserDefaults.standard.set(newValue, forKey: self.key)
            UserDefaults.standard.synchronize()
        }
        get { UserDefaults.standard.object(forKey: key) as? T ?? initialValue } }
}

enum UserPreferences {
    enum User {
        @UserDefault(key: "user.id", initialValue: "") static var id: String
    }
}

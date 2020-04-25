//
//  Limitation=Wrapper.swift
//  RealityPuzzle
//
//  Created by Oleksii Lytvynov-Bohdanov on 25.04.2020.
//  Copyright © 2020 Oleksii Lytvynov-Bohdanov. All rights reserved.
//

import Foundation

@propertyWrapper
struct Ranged<T: Comparable> {
    private var minimum: T
    private var maximum: T
    private var value: T
    var wrappedValue: T {
        get { value }
        set {
            if newValue > maximum {
                value = maximum
            } else if newValue < minimum {
                value = minimum
            } else {
                value = newValue
            }
        }
    }
    init(wrappedValue: T, minimum: T, maximum: T) {
        self.minimum = minimum
        self.maximum = maximum
        self.value = wrappedValue
        self.wrappedValue = wrappedValue
    }
}

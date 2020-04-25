//
//  NSObject+Classname.swift
//  RealityPuzzle
//
//  Created by Oleksii Lytvynov-Bohdanov on 23.04.2020.
//  Copyright © 2020 Oleksii Lytvynov-Bohdanov. All rights reserved.
//

import Foundation

extension NSObject {
    
    static var classString: String {
        return String(describing: self.self)
    }
}

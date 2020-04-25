//
//  String.swift
//  RealityPuzzle
//
//  Created by Oleksii Lytvynov-Bohdanov on 25.04.2020.
//  Copyright © 2020 Oleksii Lytvynov-Bohdanov. All rights reserved.
//

import Foundation

extension String {
    var trimmedWhitspaces: String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}

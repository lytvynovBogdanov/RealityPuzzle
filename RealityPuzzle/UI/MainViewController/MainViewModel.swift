//
//  MainViewModel.swift
//  RealityPuzzle
//
//  Created by Oleksii Lytvynov-Bohdanov on 23.04.2020.
//  Copyright © 2020 Oleksii Lytvynov-Bohdanov. All rights reserved.
//

import Foundation

struct MainViewModel {
    var titleModel: String {
        return UserPreferences.User.id
    }
}

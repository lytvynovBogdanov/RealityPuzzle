//
//  UserEntryViewModel.swift
//  RealityPuzzle
//
//  Created by Oleksii Lytvynov-Bohdanov on 24.04.2020.
//  Copyright © 2020 Oleksii Lytvynov-Bohdanov. All rights reserved.
//

import Foundation

struct UserEntryViewModel {
    let titleModel = "Enter User Name"
    
    func saveNewUser(with name: String?, success: Callback?, error: ((String) -> Void)?) {
        guard let name = name,
            !name.trimmedWhitspaces.isEmpty else {
                error?("Wrong name")
            return
        }
        if User.find(name: name) != nil {
            error?("User name with same name is already exist")
            return
        }
        
        let user = User.newEmpty()
        user.name = name
        CoreDataManager.shared.saveContext()
        UserPreferences.User.id = name
        success?()
    }
}

//
//  UserEntryViewController.swift
//  RealityPuzzle
//
//  Created by Oleksii Lytvynov-Bohdanov on 24.04.2020.
//  Copyright © 2020 Oleksii Lytvynov-Bohdanov. All rights reserved.
//

import UIKit

class UserEntryViewController: ViewControllerBindable<UserEntryViewModel> {

    @IBOutlet weak var nameTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        title = viewModel.titleModel
    }
    
    // MARK: Private
    @IBAction private func savePressed(_ sender: UIButton) {
        viewModel.saveNewUser(with: nameTextField.text, success: {
            AppDelegate.shared.setMainScreen()
        }) { [weak self] message in
            self?.presentErrorAlert(message: message)
        }
    }
}

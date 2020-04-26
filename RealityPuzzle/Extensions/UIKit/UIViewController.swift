//
//  UIViewController.swift
//  RealityPuzzle
//
//  Created by Oleksii Lytvynov-Bohdanov on 25.04.2020.
//  Copyright © 2020 Oleksii Lytvynov-Bohdanov. All rights reserved.
//

import UIKit

extension UIViewController {
    func presentAlertController(title: String? = nil,
                                message: String? = nil,
                                buttons: [String]? = nil,
                                cancelTitle: String? = nil,
                                style: UIAlertController.Style = .alert,
                                didSelect: ((Int) -> Void)? = nil) {
        let alertController = UIAlertController.alertController(title: title, message: message, buttons: buttons, cancelTitle: cancelTitle, didSelect: didSelect, style: style)
        self.present(alertController, animated: true)
    }
    
    func presentErrorAlert(title: String? = "Error", message: String?) {
        presentAlertController(title: title, message: message, buttons: ["Ok"])
    }
}

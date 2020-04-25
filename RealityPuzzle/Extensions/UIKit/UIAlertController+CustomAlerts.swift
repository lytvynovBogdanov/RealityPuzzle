//
//  UIAlertController+CustomAlerts.swift
//  RealityPuzzle
//
//  Created by Oleksii Lytvynov-Bohdanov on 25.04.2020.
//  Copyright © 2020 Oleksii Lytvynov-Bohdanov. All rights reserved.
//

import UIKit

extension UIAlertController {
    
    static func alertController(title: String? = nil,
                                message: String? = nil,
                                buttons: [String]? = nil,
                                cancelTitle: String? = nil,
                                didSelect:((Int) -> Void)? = nil,
                                style: UIAlertController.Style = .alert) -> UIAlertController {
        let alertController = UIAlertController.init(title: title, message: message, preferredStyle: style)
        
        if let buttons = buttons {
            for index in 0..<buttons.count {
                let title = buttons[index]
                let alertAction = UIAlertAction(title: title, style: .default) { _ in
                    didSelect?(index)
                }
                alertController.addAction(alertAction)
            }
        }
        
        if let cancelTitle = cancelTitle {
            let cancelAction = UIAlertAction(title: cancelTitle, style: .cancel)
            alertController.addAction(cancelAction)
        }
        return alertController
    }    
}

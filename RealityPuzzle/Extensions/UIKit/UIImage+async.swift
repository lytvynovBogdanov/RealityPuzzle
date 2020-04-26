//
//  UIImage+async.swift
//  RealityPuzzle
//
//  Created by Oleksii Lytvynov-Bohdanov on 26.04.2020.
//  Copyright © 2020 Oleksii Lytvynov-Bohdanov. All rights reserved.
//

import UIKit

private let imageCache = URLCache.shared

extension UIImage {
    public static func loadAsync(from url: URL,
                                 completionHandler: @escaping ((UIImage?) -> Void),
                                 errorHandler: ((_ error: Error?) -> Void)? = nil) {
        
        URLCache.shared.loadAsync(from: url, completionHandler: { (data) in
            let image = UIImage(data: data)
            completionHandler(image)
        }, errorHandler: errorHandler)
    }
}

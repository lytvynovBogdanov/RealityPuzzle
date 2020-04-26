//
//  NSObject+Cache.swift
//  RealityPuzzle
//
//  Created by Oleksii Lytvynov-Bohdanov on 26.04.2020.
//  Copyright © 2020 Oleksii Lytvynov-Bohdanov. All rights reserved.
//

import Foundation

extension URLCache {
    
    public func loadAsync(from url: URL,
                          completionHandler: @escaping ((Data) -> Void),
                          errorHandler: ((_ error: Error?) -> Void)? = nil) {
        
        let request = URLRequest(url: url)
        
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            if let data = self?.cachedResponse(for: request)?.data {
                DispatchQueue.main.async {
                    completionHandler(data)
                }
            } else {
                URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
                    if let data = data,
                        let response = response,
                        ((response as? HTTPURLResponse)?.statusCode ?? 500) < 300,
                        let self = self {
                        
                        let cachedData = CachedURLResponse(response: response, data: data)
                        self.storeCachedResponse(cachedData, for: request)
                        
                        DispatchQueue.main.async {
                            completionHandler(data)
                        }
                    } else {
                        DispatchQueue.main.async {
                            errorHandler?(error)
                        }
                    }
                }.resume()
            }
        }
    }
}

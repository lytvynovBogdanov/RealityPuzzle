//
//  FlickrApi.swift
//  RealityPuzzle
//
//  Created by Oleksii Lytvynov-Bohdanov on 26.04.2020.
//  Copyright © 2020 Oleksii Lytvynov-Bohdanov. All rights reserved.
//

import Foundation
import FlickrKit

struct FlickrApi {
    private static let APIKey = "92111faaf0ac50706da05a1df2e85d82"
    private static let APISecret = "89ded1035d7ceb3a"

    static func fetchPhotos(with page: Int,
                            complition: @escaping (([URL]?) -> Void),
                            errorComplition: @escaping ((Error?) -> Void)) {
        
        let flickr = FlickrKit.shared()
        flickr.initialize(withAPIKey: APIKey, sharedSecret: APISecret)
        let flickrInterestingness = FKFlickrInterestingnessGetList()
        flickrInterestingness.page = String(page)

        flickr.call(flickrInterestingness) { (response, error) in
            if let error = error {
                return errorComplition(error)
            }
            guard let photos = response?["photos"] as? [String: Any],
                let photo = photos["photo"] as? [[AnyHashable : Any]] else {
                    errorComplition(nil)
                    return
            }

            var photoUrls = [URL]()
            photo.forEach {
                let url = flickr.photoURL(for: .large1024, fromPhotoDictionary: $0)
                photoUrls.append(url)
            }
            complition(photoUrls)
        }
    }
}

//
//  CurrentGameViewModel.swift
//  RealityPuzzle
//
//  Created by Oleksii Lytvynov-Bohdanov on 23.04.2020.
//  Copyright © 2020 Oleksii Lytvynov-Bohdanov. All rights reserved.
//

import UIKit
import RxCocoa

class CurrentGameViewModel {
    let gameSize: Int
    let backgroundImageObservable: BehaviorRelay<UIImage?> = BehaviorRelay(value: nil)
    init(sizeGame: Int) {
        if sizeGame < min_size_game {
            self.gameSize = min_size_game
        } else if sizeGame > max_size_game {
            self.gameSize = max_size_game
        } else {
            self.gameSize = sizeGame
        }
        loadImage()
    }
    
    private func loadImage() {
        FlickrApi.fetchPhotos(with: 1, complition: { [weak self] (urls) in
            guard let url = urls?.first else {
                self?.backgroundImageObservable.accept(nil)
                return 
            }
            UIImage.loadAsync(from: url, completionHandler: { [weak self] (image) in
                self?.backgroundImageObservable.accept(image)
            }) { [weak self] (_) in
                self?.backgroundImageObservable.accept(nil)
            }
        }) { [weak self] (error) in
            self?.backgroundImageObservable.accept(nil)
        }
    }
}

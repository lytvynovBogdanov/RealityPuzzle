//
//  LeaderboardViewController.swift
//  RealityPuzzle
//
//  Created by Oleksii Lytvynov-Bohdanov on 23.04.2020.
//  Copyright © 2020 Oleksii Lytvynov-Bohdanov. All rights reserved.
//

import UIKit

class LeaderboardViewController: ViewControllerBindable<LeaderboardModelView> {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = viewModel.titleModel
    }
}

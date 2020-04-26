//
//  LeaderboardViewController.swift
//  RealityPuzzle
//
//  Created by Oleksii Lytvynov-Bohdanov on 23.04.2020.
//  Copyright © 2020 Oleksii Lytvynov-Bohdanov. All rights reserved.
//

import UIKit

class LeaderboardViewController: ViewControllerBindable<LeaderboardModelView> {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = viewModel.titleModel
        registerCells()
    }
    
    private func registerCells() {
        let nibName = LeaderboardTableViewCell.classString
        let nib = UINib(nibName: nibName, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: nibName)
    }
}

extension LeaderboardViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.gameResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellModel = LeaderboardTableViewCellModel(gameResult: viewModel.gameResults[indexPath.row])
        let cell = tableView.dequeueReusableCell(withIdentifier: LeaderboardTableViewCell.classString, for: indexPath)
        if let cell = cell as? LeaderboardTableViewCell {
            cell.bind(cellModel)
        }
        return cell
    }
}

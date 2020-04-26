//
//  LeaderboardTableViewCell.swift
//  RealityPuzzle
//
//  Created by Oleksii Lytvynov-Bohdanov on 26.04.2020.
//  Copyright © 2020 Oleksii Lytvynov-Bohdanov. All rights reserved.
//

import UIKit

class LeaderboardTableViewCell: UITableViewCell, BaseTableViewCell {
    
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var stepsLabel: UILabel!
    
    func bind(_ viewModel: LeaderboardTableViewCellModel) {
        nameLabel.text = viewModel.nameLabelModel
        timeLabel.text = viewModel.timeLabelModel
        stepsLabel.text = viewModel.stepsLabelModel
    }
}

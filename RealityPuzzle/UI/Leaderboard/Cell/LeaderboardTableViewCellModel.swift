//
//  LeaderboardTableViewCellModel.swift
//  RealityPuzzle
//
//  Created by Oleksii Lytvynov-Bohdanov on 26.04.2020.
//  Copyright © 2020 Oleksii Lytvynov-Bohdanov. All rights reserved.
//

import Foundation

struct LeaderboardTableViewCellModel: BaseTableViewCellViewModel {
    let nameLabelModel: String
    let timeLabelModel: String
    let stepsLabelModel: String
    
    init(gameResult: GameResult) {
        nameLabelModel = gameResult.user?.name ?? ""
        stepsLabelModel = "Steps: \(gameResult.steps)"
        
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.minute, .second]
        formatter.unitsStyle = .abbreviated
        
        timeLabelModel = "Time: \(formatter.string(from: TimeInterval(gameResult.time)) ?? "0s")"
    }
}

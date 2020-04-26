//
//  BaseTableViewCell.swift
//  RealityPuzzle
//
//  Created by Oleksii Lytvynov-Bohdanov on 26.04.2020.
//  Copyright © 2020 Oleksii Lytvynov-Bohdanov. All rights reserved.
//

import Foundation

public protocol BaseTableViewCellViewModel {}

protocol BaseTableViewCell {
    associatedtype ViewModel
    func bind(_ viewModel: ViewModel)
}

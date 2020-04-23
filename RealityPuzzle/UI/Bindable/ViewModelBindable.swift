//
//  ViewModelBindable.swift
//  RealityPuzzle
//
//  Created by Oleksii Lytvynov-Bohdanov on 23.04.2020.
//  Copyright © 2020 Oleksii Lytvynov-Bohdanov. All rights reserved.
//

import Foundation

protocol ViewModelBindable {
    associatedtype ViewModel
    
    var viewModel: ViewModel { get }
    
    init(_ viewModel: ViewModel)
    
    func bind(_ viewModel: ViewModel)
}

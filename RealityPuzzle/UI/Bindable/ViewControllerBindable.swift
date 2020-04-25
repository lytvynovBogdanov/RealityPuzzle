//
//  ViewControllerBindable.swift
//  RealityPuzzle
//
//  Created by Oleksii Lytvynov-Bohdanov on 23.04.2020.
//  Copyright © 2020 Oleksii Lytvynov-Bohdanov. All rights reserved.
//

import UIKit
import RxSwift

class ViewControllerBindable<Type>: UIViewController, ViewModelBindable {
    typealias ViewModel = Type
    private(set) var disposeBag = DisposeBag()
    var viewModel: Type {
        didSet {
            disposeBag = DisposeBag()
        }
    }
    
    
    required init(_ viewModel: Type) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bind(_ viewModel: Type) {
        fatalError("init(coder:) has not been implemented")
    }
}

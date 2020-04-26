//
//  CurrentGameViewController.swift
//  RealityPuzzle
//
//  Created by Oleksii Lytvynov-Bohdanov on 23.04.2020.
//  Copyright © 2020 Oleksii Lytvynov-Bohdanov. All rights reserved.
//

import UIKit

class CurrentGameViewController: ViewControllerBindable<CurrentGameViewModel> {
    @IBOutlet private weak var boardView: Board!
    @IBOutlet private weak var timeLabel: UILabel!
    @IBOutlet weak var counterLabel: UILabel!
    
    private var timer: Timer?
    private var currentTime = 0 {
        didSet {
            updateTimeLabel()
        }
    }
    private var steps: Int = 0 {
        didSet {
            updateStepsLabel()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if boardView.subviews.count == 0 {
            startGame()
            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] (timer) in
                self?.currentTime += 1
            }
        }
    }
    
    deinit {
        timer?.invalidate()
    }
    
    private func updateTimeLabel() {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.minute, .second]
        formatter.unitsStyle = .abbreviated
        timeLabel.text = formatter.string(from: TimeInterval(currentTime))
    }
    
    private func updateStepsLabel() {
        counterLabel.text = "Steps: \(steps)"
    }
    
    private func startGame() {
        boardView.gameSize = viewModel.gameSize
        bindGame()
    }
    
    private func bindGame() {
        boardView.game?.gameOverObservable
            .filter { $0 == true }
            .subscribe(onNext: { [weak self] (_) in
                self?.timer?.invalidate()
                self?.presentWonView()
            }).disposed(by: disposeBag)
        boardView.game?.blankPiece.coordinateObservable
            .skip(1)
            .subscribe(onNext: { [weak self] _ in
                self?.steps += 1
            }).disposed(by: disposeBag)
    }

    @IBAction func mainMenuPressed(_ sender: UIButton) {
        navigateToMainScreen()
    }
    
    private func navigateToMainScreen() {
        navigationController?.setNavigationBarHidden(false, animated: false)
        navigationController?.popToRootViewController(animated: false)
    }
    
    private func presentWonView() {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 400, height: 100))
        label.text = "CONGARTS"
        label.textColor = .green
        label.font = UIFont.systemFont(ofSize: 60)
        label.center = boardView.center
        label.textAlignment = .center
        view.addSubview(label)
    }
}

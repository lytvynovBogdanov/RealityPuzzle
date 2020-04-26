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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if boardView.subviews.count == 0 {
            startGame()
        }
    }
    
    private func updateTimeLabel(currentTime: Int) {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.minute, .second]
        formatter.unitsStyle = .abbreviated
        timeLabel.text = formatter.string(from: TimeInterval(currentTime))
    }
    
    private func updateStepsLabel(steps: Int) {
        counterLabel.text = "Steps: \(steps)"
    }
    
    private func startGame() {
        boardView.gameSize = viewModel.gameSize
        bindGame()
    }
    
    private func bindGame() {
        guard let game = boardView.game else { return }
        game.gameOverObservable
            .filter { $0 == true }
            .subscribe(onNext: { [weak self] (_) in
                self?.presentWonView()
            }).disposed(by: disposeBag)
        game.stepsObservable
            .subscribe(onNext: { [weak self] steps in
                self?.updateStepsLabel(steps: steps)
            }).disposed(by: disposeBag)
        game.currentTimeObservable
            .subscribe(onNext: { [weak self] currentTime in
                self?.updateTimeLabel(currentTime: currentTime)
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

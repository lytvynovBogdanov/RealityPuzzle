//
//  UsersOverviewViewController.swift
//  RealityPuzzle
//
//  Created by Oleksii Lytvynov-Bohdanov on 24.04.2020.
//  Copyright © 2020 Oleksii Lytvynov-Bohdanov. All rights reserved.
//

import UIKit

class UsersOverviewViewController: ViewControllerBindable<UsersOverviewViewModel> {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addNavigationItems()
        registerCells()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    private func registerCells() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: UITableViewCell.classString)
    }
    
    private func addNavigationItems() {
        let tabBar = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(navigateToNewUser))
        navigationItem.rightBarButtonItem = tabBar
    }
    
    @objc
    private func navigateToNewUser() {
        let viewModel = UserEntryViewModel()
        let viewController = UserEntryViewController(viewModel)
        navigationController?.pushViewController(viewController, animated: false)
    }
}

extension UsersOverviewViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.users?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UITableViewCell.classString, for: indexPath)
        cell.textLabel?.text = viewModel.users?[indexPath.row].name ?? ""
        return cell
    }
}

extension UsersOverviewViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let name = viewModel.users?[indexPath.row].name {
            UserPreferences.User.id = name
        }
        
        navigationController?.popViewController(animated: true)
    }
}

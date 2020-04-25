//
//  AppDelegate.swift
//  RealityPuzzle
//
//  Created by Oleksii Lytvynov-Bohdanov on 23.04.2020.
//  Copyright © 2020 Oleksii Lytvynov-Bohdanov. All rights reserved.
//

import UIKit

@UIApplicationMain
    class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    static var shared: AppDelegate {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            fatalError("App delegate is not found")
        }
        return appDelegate
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        if UserPreferences.User.id.isEmpty {
            setUserEnryScreen()
        } else {
            setMainScreen()
        }
        
        return true
    }

    // MARK: - Private
    func setMainScreen() {
        let mainViewModel = MainViewModel()
        let navigationController = UINavigationController()
        navigationController.viewControllers = [MainViewController(mainViewModel)]
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
    
    func setUserEnryScreen() {
        let userEntryViewModel = UserEntryViewModel()
        let navigationController = UINavigationController()
        navigationController.viewControllers = [UserEntryViewController(userEntryViewModel)]
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}


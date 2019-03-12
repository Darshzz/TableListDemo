//
//  AppDelegate.swift
//  TableListDemo
//
//  Created by Darshan on 09/03/19.
//  Copyright © 2019 Darshan. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow(frame: UIScreen.main.bounds)
        initialSetup()
        window?.makeKeyAndVisible()
        
        return true
    }
    
    private func initialSetup() {
        let listVC = ListViewController()
        listVC.view.backgroundColor = .white
        let navigationController = UINavigationController(rootViewController: listVC)
        navigationController.navigationBar.barTintColor = .orange
        navigationController.navigationBar.isTranslucent = false
        self.window?.rootViewController = navigationController
    }
}

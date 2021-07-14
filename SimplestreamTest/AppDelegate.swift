//
//  AppDelegate.swift
//  SimplestreamTest
//
//  Created by Ivan Tsanev on 14/07/2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow()
        window?.makeKeyAndVisible()
        
        window?.rootViewController = CustomNavigationController(rootViewController: MoviesTableVC(with: MoviesViewModel()))

        return true
    }

}


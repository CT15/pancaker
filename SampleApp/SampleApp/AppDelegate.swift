//
//  AppDelegate.swift
//  SampleApp
//
//  Created by Calvin Tantio on 24/4/18.
//  Copyright © 2018 Calvin Tantio. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        Database.database().isPersistenceEnabled = true

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()

        let rootViewController = MainViewController()
        window?.rootViewController = rootViewController
        return true
    }
}


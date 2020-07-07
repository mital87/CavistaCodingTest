//
//  AppDelegate.swift
//  CavistaCodingTest
//
//  Created by Mital Solanki on 6/7/20.
//  Copyright © 2020 Mital Solanki. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // Setup Database
        do {
            try DatabaseManager.setupDatabase(application)
        } catch  {
            print(error.localizedDescription)
        }
        debugPrint(getDocumentsDirectory())
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let listingVC = ListingVC()
        listingVC.view.backgroundColor = .systemBackground
        let rootNC = UINavigationController(rootViewController: listingVC)
        rootNC.navigationBar.prefersLargeTitles = true
        rootNC.navigationItem.largeTitleDisplayMode = .always
        self.window?.rootViewController = rootNC
        self.window!.makeKeyAndVisible()
        
        return true
    }
}


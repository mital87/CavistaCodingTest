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
        self.window?.rootViewController = rootNC
        self.window!.makeKeyAndVisible()
        
        
//        navController = UINavigationController()
//        var viewController: ViewController = ViewController()
//        self.navController!.pushViewController(viewController, animated: false)
//
//        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
//
//        self.window!.rootViewController = navController
//
//        self.window!.backgroundColor = UIColor.whiteColor()
//
//        self.window!.makeKeyAndVisible()


        return true
    }
}


//
//  AppDelegate.swift
//  CavistaCodingTest
//
//  Created by Mital Solanki on 6/7/20.
//  Copyright © 2020 Mital Solanki. All rights reserved.
//

import UIKit
import Reachability

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var isNetworkAvailable: Bool = false
    var reachability : Reachability!
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // Setup Database
        do {
            try DatabaseManager.setupDatabase(application)
        } catch  {
            debugPrint(error.localizedDescription)
        }
        debugPrint(getDocumentsDirectory())
        
        setupNetworkReachability()
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let listingVC = ListingVC()
        listingVC.view.backgroundColor = Colors.appBGColor
        let rootNC = UINavigationController(rootViewController: listingVC)
        rootNC.navigationBar.prefersLargeTitles = true
        rootNC.navigationItem.largeTitleDisplayMode = .always
        self.window?.rootViewController = rootNC
        self.window!.makeKeyAndVisible()
        
        return true
    }
    
    //MARK: - Setup Network Reachability
    func setupNetworkReachability()
    {
        self.reachability = try! Reachability()
        
        self.reachability.whenReachable = { reachability in
            self.isNetworkAvailable = true
        }
        self.reachability.whenUnreachable = { _ in
            self.isNetworkAvailable = false
        }
        
        do {
            try self.reachability.startNotifier()
        }
        catch {
            debugPrint("Unable to start notifier")
        }
    }
}


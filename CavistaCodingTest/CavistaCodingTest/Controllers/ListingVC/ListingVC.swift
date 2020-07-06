//
//  ListingVC.swift
//  CavistaCodingTest
//
//  Created by Mital Solanki on 6/7/20.
//  Copyright © 2020 Mital Solanki. All rights reserved.
//

import UIKit

class ListingVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Coding Test"
        
        DatabaseManager.getSharedWriteCurrentDatabase { (db) in
            AxxessTech.truncateTable(db)
        }
        importDataForAxxessTechAPI()
        
    }
}
    
//MARK:- Products Group API Manager
extension ListingVC {
    func importDataForAxxessTechAPI() {
        
        AxxessTechApiManager.getSampleData { (error) in
            
            if error == nil {
                debugPrint("AxxessTech Data imported.")
            } else {
                debugPrint(error.debugDescription)
            }
        }
    }
}

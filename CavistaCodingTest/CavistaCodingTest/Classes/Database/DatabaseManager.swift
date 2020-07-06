//
//  DatabaseManager.swift
//  CavistaCodingTest
//
//  Created by Mital Solanki on 6/7/20.
//  Copyright © 2020 Mital Solanki. All rights reserved.
//

import Foundation
import UIKit
import GRDB

// Holds the reference for the Database file location
class DatabaseManager{
    static let shared = DatabaseManager()
    static let sharedProducts = DatabaseManager()
    // The shared database queue
    var dbQueue: DatabasePool!

    // Simple database connection
    class func setupDatabase(_ application: UIApplication) throws {
        let databaseURL = try FileManager.default
            .url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            .appendingPathComponent("db.sqlite")
        DatabaseManager.shared.dbQueue = try AppDatabase.openDatabase(atPath: databaseURL.path)
    }
    
    //MARK:- Fetch Readable DB Instance
    class func getSharedCurrentDatabase(_ completion: @escaping (_ database: Database) -> Void){
        let dbQueue = self.shared.dbQueue
        _ = try? dbQueue?.read({ db in
            completion(db)
        })
    }
    
    //MARK:- Fetch Writable DB Instance
    class func getSharedWriteCurrentDatabase(_ completion: @escaping (_ database: Database) -> Void){
        let dbQueue = self.shared.dbQueue
        _ = dbQueue?.writeWithoutTransaction({ db in
            completion(db)
        })
    }
}

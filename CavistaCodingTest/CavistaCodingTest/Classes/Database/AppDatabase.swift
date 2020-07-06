//
//  AppDatabase.swift
//  CavistaCodingTest
//
//  Created by Mital Solanki on 6/7/20.
//  Copyright © 2020 Mital Solanki. All rights reserved.
//

import Foundation
import UIKit
import GRDB

/// A type responsible for initializing the application database.
///
/// See AppDelegate.setupDatabase()
struct AppDatabase {
    
    /// Creates a fully initialized database at path
    static func openDatabase(atPath path: String) throws -> DatabasePool {
        // Connect to the database
        let dbQueue = try DatabasePool(path: path)

        // Define the database schema
        try migrator.migrate(dbQueue)
        
        return dbQueue
    }

    /// Creates a fully initialized database at path
    static func openDatabaseForBundle(atPath path: String) throws -> DatabasePool {
        // Connect to the database
        let dbQueue = try DatabasePool(path: path)
        
        return dbQueue
    }
    
    /// The DatabaseMigrator that defines the database schema.
    static var migrator: DatabaseMigrator {
        var migrator = DatabaseMigrator()
        
        migrator.registerMigration("Migrator_V_1.0") { db in
            
            // CREATE TABLE 'AxxessTech'
            try db.create(table: "AxxessTech") { t in
                //t.autoIncrementedPrimaryKey("id").notNull()
                t.column("id", .text)
                t.column("type", .text)
                t.column("date", .text)
                t.column("data", .text)
            }
        }
        return migrator
    }
}


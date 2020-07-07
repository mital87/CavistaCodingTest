//
//  AxxessTech.swift
//  CavistaCodingTest
//
//  Created by Mital Solanki on 6/7/20.
//  Copyright © 2020 Mital Solanki. All rights reserved.
//

import Foundation
import UIKit
import GRDB

struct AxxessTech {
    var id: String?
    var type: String?
    var date: String?
    var data: String?
}

// Protocol Equatable used when comparing Item Objects
extension AxxessTech: Codable, FetchableRecord, MutablePersistableRecord {
    
    private enum CodingKeys: String, CodingKey, ColumnExpression {
        case id, type, date, data
    }
    
}

// Protocol Equatable used when comparing Item Objects
//extension AxxessTech: Equatable {
//    static func == (lhs: AxxessTech, rhs: AxxessTech) -> Bool{
//        return lhs.id == rhs.id
//    }
//}


//MARK:- Insert Into DB (AxxessTech Table)
extension AxxessTech{
    mutating func insertOrUpdate(_ db : Database, isInsert: Bool){
        do{
            if isInsert {
                if try !self.exists(db){
                    try self.insert(db)
                }else{
                    try self.update(db)
                }
            }else{
                try self.update(db)
            }
        }
        catch let error {
            debugPrint("AxxessTech \(isInsert) ? \("Insert") : \("Update") ERROR: \(error)")
        }
    }
    
    static func truncateTable(_ db : Database){
        do {
            try AxxessTech.deleteAll(db)
        } catch {
            debugPrint("ERROR: AxxessTech NOT Truncated")
        }
    }
    
    static func getSampleData(_ db: Database,_ isAscending: Bool) -> [AxxessTech]?{
        do {
            let sql = "SELECT * FROM AxxessTech ORDER BY type \(isAscending ? "ASC" : "DESC")"
            let rows = try AxxessTech.fetchAll(db, sql: sql)
            return rows
        }
        catch  {
            debugPrint(error)
            return nil
        }
    }
}

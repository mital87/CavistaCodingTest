//
//  AxxessTechApiManager.swift
//  CavistaCodingTest
//
//  Created by Mital Solanki on 6/7/20.
//  Copyright © 2020 Mital Solanki. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

struct AxxessTechApiManager : Codable {
    var Data : [AxxessTech]?
}
// MARK:- API Calls

extension AxxessTechApiManager{
    
    /// Perform `Get Sample Data` from Server
    static func getSampleData( _ completionHandler: @escaping (_ error: Error?) -> Void){
        let url = APIEndPoint.getAxxessTechSampleData
        
        /// Call API Client method to Load Data
        APIClient.APIModelReqest(url: url, method: .get, parameters: nil) { (data, error) in
            guard let data = data else{
                if let error = error{
                    print(error)
                }
                completionHandler(error)
                return
            }
            
            do {
                /// Parse response in `ProductGrpApiManager` class
                let sampleData = try JSONDecoder().decode([AxxessTech].self, from: data)
                if sampleData.count > 0 {
                    DatabaseManager.getSharedWriteCurrentDatabase({ (db) in
                        for var item in sampleData{

                            /// Insert / Update values to DB
                            item.insertOrUpdate(db, isInsert: true)
                        }
                    })
                }
                
                completionHandler(nil)
            } catch {
                completionHandler(error)
            }
        }
    }
}


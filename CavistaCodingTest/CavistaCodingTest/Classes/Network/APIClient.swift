//
//  APIClient.swift
//  CavistaCodingTest
//
//  Created by Mital Solanki on 6/7/20.
//  Copyright © 2020 Mital Solanki. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

typealias APIResponseData = (Data?, Error?) -> Void

class APIClient: NSObject
{
    // Network API to Load Data from/to Server
    static func APIModelReqest(url : String, method : HTTPMethod, parameters: Parameters? = nil, headers : HTTPHeaders? = nil, _ completionHandler: @escaping APIResponseData)
    {
        AF.request(url, method: method, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseJSON(queue: DispatchQueue.main, options: [.mutableContainers, .mutableLeaves]) { (dataResponse) in
            
            switch (dataResponse.result)
            {
            case .success(_):
                completionHandler(dataResponse.data, nil)
                break
                
            case .failure(let error):
                completionHandler(nil, error as NSError)
                break
            }
        }
    }
}


//
//  AppConstant.swift
//  CavistaCodingTest
//
//  Created by Mital Solanki on 6/7/20.
//  Copyright © 2020 Mital Solanki. All rights reserved.
//

import Foundation
import UIKit

let appDelegate = UIApplication.shared.delegate as! AppDelegate
let mainStoryboard : UIStoryboard = UIStoryboard.init(name: "Main", bundle: nil)

// Get Documents Directory location
func getDocumentsDirectory() -> URL {
    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    return paths[0]
}

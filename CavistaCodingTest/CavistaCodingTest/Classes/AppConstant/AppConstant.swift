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

// Get Font Size
func getPointSize(_ size : CGFloat) -> CGFloat {
    return (DeviceType.IS_IPHONE_8 || DeviceType.IS_IPHONE_8P || DeviceType.IS_IPAD_PRO_9_7)  ? (size + 1) : (DeviceType.IS_IPHONE_XS || DeviceType.IS_IPHONE_XS_MAX || DeviceType.IS_IPAD_PRO_10_5) ? (size + 2) : DeviceType.IS_IPAD_PRO_11 ? (size + 3) : DeviceType.IS_IPAD_PRO_12_9 ? (size + 4) : size
}

// Colors used in the app
struct Colors {
    static let appContentColor : UIColor = .gray
    static let appHeadingColor : UIColor = .black
    static let appBGColor : UIColor = .white
    static let appCancelBtnColor : UIColor = .red
}

// Fonts used in the app
struct FONTS {
    static let textUltraLight = "AvenirNext-UltraLight"
    static let textRegular = "AvenirNext-Regular"
    static let textMedium = "AvenirNext-Medium"
    static let textSemiBold = "AvenirNext-DemiBold"
    static let textBold = "AvenirNext-Bold"
    static let textHeavy = "AvenirNext-Heavy"
}

struct ScreenSize
{
    static let SCREEN_WIDTH         = UIScreen.main.bounds.size.width
    static let SCREEN_HEIGHT        = UIScreen.main.bounds.size.height
    static let SCREEN_MAX_LENGTH    = max(SCREEN_WIDTH, SCREEN_HEIGHT)
    static let SCREEN_MIN_LENGTH    = min(SCREEN_WIDTH, SCREEN_HEIGHT)
}

struct DeviceType
{
    static let IS_IPHONE            = UIDevice.current.userInterfaceIdiom == .phone
    static let IS_IPHONE_4_OR_LESS  = DeviceType.IS_IPHONE && ScreenSize.SCREEN_MAX_LENGTH < 568.0
    static let IS_IPHONE_5_SE       = DeviceType.IS_IPHONE && ScreenSize.SCREEN_MAX_LENGTH == 568.0
    static let IS_IPHONE_8          = DeviceType.IS_IPHONE && ScreenSize.SCREEN_MAX_LENGTH == 667.0
    static let IS_IPHONE_8P         = DeviceType.IS_IPHONE && ScreenSize.SCREEN_MAX_LENGTH == 736.0
    static let IS_IPHONE_XS         = DeviceType.IS_IPHONE && ScreenSize.SCREEN_MAX_LENGTH == 812.0
    static let IS_IPHONE_XS_MAX     = DeviceType.IS_IPHONE && ScreenSize.SCREEN_MAX_LENGTH == 896.0
    static let IS_IPAD              = UIDevice.current.userInterfaceIdiom == .pad
    static let IS_IPAD_PRO_9_7      = DeviceType.IS_IPAD && ScreenSize.SCREEN_MAX_LENGTH == 1024.0
    static let IS_IPAD_PRO_10_5     = DeviceType.IS_IPAD && ScreenSize.SCREEN_MAX_LENGTH == 1112.0
    static let IS_IPAD_PRO_11       = DeviceType.IS_IPAD && ScreenSize.SCREEN_MAX_LENGTH == 1194.0
    static let IS_IPAD_PRO_12_9     = DeviceType.IS_IPAD && ScreenSize.SCREEN_MAX_LENGTH == 1366.0
    static let IS_TV                = UIDevice.current.userInterfaceIdiom == .tv
    static let IS_CAR_PLAY          = UIDevice.current.userInterfaceIdiom == .carPlay
}

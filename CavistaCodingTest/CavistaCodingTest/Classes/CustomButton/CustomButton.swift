//
//  CustomButton.swift
//  CavistaCodingTest
//
//  Created by Mital Solanki on 7/7/20.
//  Copyright © 2020 Mital Solanki. All rights reserved.
//

import UIKit

// Manage the Fonts Sizes & Types in whole App

class CancelStyleButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame);
        updateProperty();
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
        updateProperty();
    }
    
    func updateProperty() {
        self.titleLabel?.font = UIFont.init(name: FONTS.textMedium, size: getPointSize(24))
        self.backgroundColor = Colors.appCancelBtnColor
        self.setTitleColor(Colors.appBGColor, for: .normal)
    }
}

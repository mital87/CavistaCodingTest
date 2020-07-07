//
//  CustomLabel.swift
//  CavistaCodingTest
//
//  Created by Mital Solanki on 7/7/20.
//  Copyright © 2020 Mital Solanki. All rights reserved.
//

import UIKit

// Manage the Fonts Sizes & Types in whole App

class HeaderStyleLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame);
        updateProperty();
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
        updateProperty();
    }
    func updateProperty() {
        self.font = UIFont.init(name: FONTS.textBold, size: getPointSize(16))
        self.textColor = Colors.appHeadingColor
        self.numberOfLines = 0
    }
}

class ContentStyleLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame);
        updateProperty();
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
        updateProperty();
    }
    
    func updateProperty() {
        self.font = UIFont.init(name: FONTS.textMedium, size: getPointSize(16))
        self.textColor = Colors.appContentColor
        self.numberOfLines = 0
    }
}


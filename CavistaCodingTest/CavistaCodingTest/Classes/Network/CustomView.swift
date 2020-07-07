//
//  CustomView.swift
//  CavistaCodingTest
//
//  Created by Mital Solanki on 7/7/20.
//  Copyright © 2020 Mital Solanki. All rights reserved.
//

import UIKit

@IBDesignable class CustomView: UIView {
    
    /// This is for programmatically created views
    override init(frame: CGRect) {
        super.init(frame: frame)
        sharedInit()
    }
    
    /// This is for Storyboard/.xib created views
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        sharedInit()
    }
    
    /// This is called within the Storyboard editor itself for rendering @IBDesignable controls
    override func prepareForInterfaceBuilder() {
        sharedInit()
    }
    
    func sharedInit() {
        
        /// Common logic
        refreshCorners(cornerValue: cornerRadius)
        refreshBorderWidth(borderWidth: borderWidth)
        refreshBorderColor(borderColor: borderColor)
        clipsToBounds = true
        layer.masksToBounds = false
        refreshShadowColor(shadowColor: shadowColor)
        refreshShadowOffset(shadowOffset: shadowOffset)
        refreshShadowRadius(shadowRadius: shadowRadius)
        refreshShadowOpacity(shadowOpacity: shadowOpacity)
    }
    
    //MARK: - Corner Radius
    func refreshCorners(cornerValue: CGFloat) {
        layer.cornerRadius = cornerValue
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            refreshCorners(cornerValue: cornerRadius)
        }
    }
    
    //MARK: - Border Width
    func refreshBorderWidth(borderWidth: CGFloat) {
        layer.borderWidth = borderWidth
    }

    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            refreshBorderWidth(borderWidth: borderWidth)
        }
    }
    
    //MARK: - Border Color
    func refreshBorderColor(borderColor : UIColor) {
        layer.borderColor = borderColor.cgColor
    }
    
    @IBInspectable var borderColor: UIColor = UIColor.black {
        didSet {
            refreshBorderColor(borderColor: borderColor)
        }
    }
    
    //MARK: - Shadow Color
    func refreshShadowColor(shadowColor : UIColor) {
        layer.shadowColor = shadowColor.cgColor
    }
    
    @IBInspectable var shadowColor: UIColor = UIColor.black {
        didSet {
            refreshShadowColor(shadowColor: shadowColor)
        }
    }
    
    //MARK: - Shadow Radius
    func refreshShadowRadius(shadowRadius : CGFloat) {
        layer.shadowRadius = shadowRadius
    }
    
    @IBInspectable var shadowRadius: CGFloat = 0 {
        didSet {
            refreshShadowRadius(shadowRadius: shadowRadius)
        }
    }

    //MARK: - Shadow Opacity
    func refreshShadowOpacity(shadowOpacity : Float) {
        layer.shadowOpacity = shadowOpacity
    }
    
    @IBInspectable var shadowOpacity: Float = 0 {
        didSet {
            refreshShadowOpacity(shadowOpacity: shadowOpacity)
        }
    }
    
    //MARK: - Shadow Offset
    func refreshShadowOffset(shadowOffset : CGSize) {
        layer.shadowOffset = shadowOffset
    }
    
    @IBInspectable var shadowOffset: CGSize = CGSize(width: 0, height: 0) {
        didSet {
            refreshShadowOffset(shadowOffset: shadowOffset)
        }
    }
}


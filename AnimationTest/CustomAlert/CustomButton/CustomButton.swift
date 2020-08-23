//
//  CustomButton.swift
//  AnimationTest
//
//  Created by Shishir Ahmed on 27/5/20.
//  Copyright © 2020 Shishir Ahmed. All rights reserved.
//

import UIKit
import Foundation

class CustomButton: UIButton {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupButton()
    }
    
    func setupButton() {
        backgroundColor = .black
        layer.cornerRadius = 2
        clipsToBounds = true
        layer.masksToBounds = false
        layer.borderWidth = 2
        
    }
    
    func setupDesign(title: String, titleColor: UIColor, height: CGFloat, font: String, titleSize: CGFloat, backgroudColor: UIColor, isBold: Bool = false, borderColor: UIColor = .blue, radious: CGFloat = 0) {
        self.setTitle(title, for: .normal)
        self.setTitleColor(titleColor, for: .normal)
        self.titleLabel?.font = UIFont(name: font, size: titleSize)
        self.backgroundColor = backgroudColor
        self.heightAnchor.constraint(equalToConstant: height).isActive = true
        
        self.layer.borderColor = borderColor.cgColor
        
        if isBold {
            self.titleLabel?.font = UIFont(name: font, size: titleSize)
            self.titleLabel?.font = UIFont.boldSystemFont(ofSize: titleSize)
        }
        
        self.layer.cornerRadius = radious
    }
    
    func addBottomShadow(color: UIColor, shadowSize: CGFloat, shadowDistance: CGFloat) {
        
        layer.shadowColor = color.cgColor
        let contactRect = CGRect(x: shadowSize, y: self.frame.height - (shadowSize * 0.4) + shadowDistance, width: self.frame.width + shadowSize * 2 - 40, height: shadowSize)
        layer.shadowPath = UIBezierPath(ovalIn: contactRect).cgPath
        layer.shadowRadius = 5
        layer.shadowOpacity = 0.4
    }
    
    func addShadow(color: UIColor) {
        layer.shadowColor = color.cgColor
        layer.shadowRadius = 5
        layer.shadowOpacity = 0.4

    }
    
}

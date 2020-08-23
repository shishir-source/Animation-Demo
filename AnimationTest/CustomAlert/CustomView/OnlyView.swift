//
//  OnlyView.swift
//  AnimationTest
//
//  Created by Shishir Ahmed on 2/6/20.
//  Copyright © 2020 Shishir Ahmed. All rights reserved.
//

import UIKit

class OnlyView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setRadiousAndShadow()
    }
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
        setRadiousAndShadow()
    }
    
    func setRadiousAndShadow() {
        layer.cornerRadius = 5
        clipsToBounds = true
        layer.masksToBounds = false
        layer.shadowRadius = 5
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: 3, height: 3)
        layer.shadowColor = UIColor.gray.cgColor
    }
    
}

extension UIView {
    
    func designView(borderWith: CGFloat = 1, borderColor: UIColor = #colorLiteral(red: 0, green: 0.3285208941, blue: 0.5748849511, alpha: 1)) {
        layer.cornerRadius = frame.height / 2
        clipsToBounds = true
        layer.borderWidth = borderWith
        layer.borderColor = borderColor.cgColor
    }
}


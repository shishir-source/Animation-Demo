//
//  UIViewController+Extension.swift
//  AnimationTest
//
//  Created by Shishir Ahmed on 4/6/20.
//  Copyright © 2020 Shishir Ahmed. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func changeRoot() {
        
        let vc = MainTabVC()
        let appDelegate = UIApplication.shared.delegate as?  AppDelegate
        appDelegate?.window?.rootViewController = vc
        appDelegate?.window?.makeKeyAndVisible()
    }
}

extension UIButton {
    func designButton(borderWith: CGFloat = 1, borderColor: UIColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)) {
        layer.cornerRadius = frame.height / 2
        clipsToBounds = true
        layer.borderWidth = borderWith
        layer.borderColor = borderColor.cgColor
    }
}


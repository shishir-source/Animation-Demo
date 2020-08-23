//
//  UITextField+Extension.swift
//  AnimationTest
//
//  Created by Shishir Ahmed on 3/6/20.
//  Copyright © 2020 Shishir Ahmed. All rights reserved.
//

import UIKit

extension UITextField {
    
    func addImageView(image: UIImage, isSecure: Bool = false) {
        
        let frame = CGSize(width: self.frame.width / 1.8, height: self.frame.height / 1.8)
        
        let imageView = UIImageView(frame: CGRect(x: 10, y: 0, width: self.frame.width / 1.8, height: self.frame.height / 1.8))
        imageView.image = image.resizeImage(targetSize: frame)
        
        if isSecure{
            let button = UIButton(frame: imageView.frame)
            button.setImage(#imageLiteral(resourceName: "eye").resizeImage(targetSize: frame), for: .normal)
            button.setImage(#imageLiteral(resourceName: "eyelock").resizeImage(targetSize: frame), for: .selected)
            button.isSelected = true
            button.addTarget(self, action: #selector(onClickEye), for: .touchUpInside)
            rightView = button
        }else{
            rightView = imageView
        }
        
        rightViewMode = .always
    }
    
    @objc func onClickEye(sender: UIButton) {
        self.isSecureTextEntry = !self.isSecureTextEntry
        sender.isSelected = !sender.isSelected
    }
}

extension UIImage {
  func resizeImage(targetSize: CGSize) -> UIImage {
    let size = self.size
    let widthRatio  = targetSize.width  / size.width
    let heightRatio = targetSize.height / size.height
    let newSize = widthRatio > heightRatio ?  CGSize(width: size.width * heightRatio, height: size.height * heightRatio) : CGSize(width: size.width * widthRatio,  height: size.height * widthRatio)
    let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)

    UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
    self.draw(in: rect)
    let newImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()

    return newImage!
  }
}

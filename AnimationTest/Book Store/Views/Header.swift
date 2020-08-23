//
//  Header.swift
//  AnimationTest
//
//  Created by Shishir Ahmed on 10/6/20.
//  Copyright © 2020 Shishir Ahmed. All rights reserved.
//

import UIKit

class Header: UICollectionReusableView {
    
    let label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        label.text = "Categories"
        addSubview(label)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

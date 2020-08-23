//
//  SearchDetailsCell.swift
//  AnimationTest
//
//  Created by Shishir Ahmed on 6/6/20.
//  Copyright © 2020 Shishir Ahmed. All rights reserved.
//

import UIKit

class SearchDetailsCell: UITableViewCell {

    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var imagView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backView.layer.cornerRadius = 5
        backView.clipsToBounds = true
        backView.layer.masksToBounds = false
        backView.layer.shadowOpacity = 0.5
        backView.layer.shadowOffset = CGSize(width: 1, height: 1)
        backView.layer.shadowColor = UIColor.lightGray.cgColor
        
        imagView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        imagView.layer.cornerRadius = 5
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}

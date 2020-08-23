//
//  ExploreCell.swift
//  AnimationTest
//
//  Created by Shishir Ahmed on 6/6/20.
//  Copyright © 2020 Shishir Ahmed. All rights reserved.
//

import UIKit

class ExploreCell: UITableViewCell {

    @IBOutlet weak var exploreCollection: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        exploreCollection.delegate = self
        exploreCollection.dataSource = self
        
        let cellNib = UINib(nibName: "ExploreCollectionCell", bundle: nil)
        
        exploreCollection.register(cellNib, forCellWithReuseIdentifier: "ExploreCollectionCell")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
extension ExploreCell: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ExploreCollectionCell", for: indexPath) as UICollectionViewCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.size.width / 4 , height: frame.size.height - 50)
    }
    
}

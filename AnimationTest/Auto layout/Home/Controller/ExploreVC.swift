//
//  ExploreVC.swift
//  AnimationTest
//
//  Created by Shishir Ahmed on 6/6/20.
//  Copyright © 2020 Shishir Ahmed. All rights reserved.
//

import UIKit

class ExploreVC: UIViewController {
    
    var indexSelecred: Int?

    @IBOutlet weak var exploreTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        exploreTable.delegate = self
        exploreTable.dataSource = self
        
        let cellNib = UINib(nibName: "ExploreCell", bundle: nil)
        exploreTable.register(cellNib, forCellReuseIdentifier: "ExploreCell")
        
        guard let titleIndex = indexSelecred else {return}
        navigationItem.title = "This is \(titleIndex)"
    }

}

extension ExploreVC: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ExploreCell", for: indexPath) as UITableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
    
}

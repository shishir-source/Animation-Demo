//
//  SearchDetailsVC.swift
//  AnimationTest
//
//  Created by Shishir Ahmed on 5/6/20.
//  Copyright © 2020 Shishir Ahmed. All rights reserved.
//

import UIKit

class SearchDetailsVC: UIViewController {

    @IBOutlet weak var searchTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Flights found 10"
        
        searchTable.delegate = self
        searchTable.dataSource = self
        
        let cellNib = UINib(nibName: "SearchDetailsCell", bundle: nil)
        searchTable.register(cellNib, forCellReuseIdentifier: "SearchCell")
    }
    
}

extension SearchDetailsVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchCell", for: indexPath) as! SearchDetailsCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let explore = ExploreVC(nibName: "ExploreVC", bundle: nil)
        explore.indexSelecred = indexPath.row
        navigationController?.pushViewController(explore, animated: true)
    }
}

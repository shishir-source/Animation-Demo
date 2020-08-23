//
//  HomeVC.swift
//  AnimationTest
//
//  Created by Shishir Ahmed on 3/6/20.
//  Copyright © 2020 Shishir Ahmed. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        navigationItem.title = "Home"
    }

    @IBAction func flightBtnPressed(_ sender: Any) {
        let flight = FlightVC(nibName: "FlightVC", bundle: nil)
        navigationController?.pushViewController(flight, animated: true)
    }
    
}

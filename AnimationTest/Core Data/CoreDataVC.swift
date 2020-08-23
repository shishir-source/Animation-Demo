//
//  CoreDataVC.swift
//  AnimationTest
//
//  Created by Shishir Ahmed on 6/6/20.
//  Copyright © 2020 Shishir Ahmed. All rights reserved.
//

import UIKit

class CoreDataVC: UIViewController {
    
    @IBOutlet weak var switchIsOn: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        if let weWantbalck = UserDefaults.standard.value(forKey: "blackThemeOn") {
            if weWantbalck as! Bool {
                view.backgroundColor = .black
            }
        }else{
            UserDefaults.standard.setValue(false, forKey: "blackThemeOn")
        }
    }

    @IBAction func onOffBtn(_ sender: Any) {
        
        if switchIsOn.isOn{
            UserDefaults.standard.setValue(true, forKey: "blackThemeOn")
            view.backgroundColor = .black
        }else{
            UserDefaults.standard.setValue(false, forKey: "blackThemeOn")
            view.backgroundColor = .white
        }
    }
}

//
//  LoginView.swift
//  AnimationTest
//
//  Created by Shishir Ahmed on 3/6/20.
//  Copyright © 2020 Shishir Ahmed. All rights reserved.
//

import UIKit

class LoginView: UIViewController {
    
    @IBOutlet var signinBtn: CustomButton!
    @IBOutlet var usernameTxt: UITextField!
    @IBOutlet var passwordTxt: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        signinBtn.setupDesign(title: "Sign In", titleColor: .white, height: 40, font: "", titleSize: 14, backgroudColor: .blue, radious: 20)
        usernameTxt.addImageView(image: #imageLiteral(resourceName: "user"))
        passwordTxt.addImageView(image: #imageLiteral(resourceName: "eye"), isSecure: true)
        
    }
    
    @IBAction func signButtonPressed(_ sender: Any) {
        UserDefaults.standard.set("LoggedIn", forKey: "AccessToken")
        changeRoot()
        let vc = MainTabVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func signUpButtonPressed(_ sender: Any) {
    }
    
}

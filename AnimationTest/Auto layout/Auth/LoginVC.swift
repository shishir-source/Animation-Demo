//
//  LoginVC.swift
//  AnimationTest
//
//  Created by Shishir Ahmed on 27/5/20.
//  Copyright © 2020 Shishir Ahmed. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
    @IBOutlet var loginBtn: CustomButton!
    @IBOutlet var signUpBtn: CustomButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        loginBtn.setupDesign(title: "Login", titleColor: .white, height: 50, font: "Helvetica", titleSize: 18, backgroudColor: .blue, isBold: true)
        loginBtn.addBottomShadow(color: .blue, shadowSize: 20, shadowDistance: 20)
        
        signUpBtn.setupDesign(title: "Sign Up", titleColor: .black, height: 50, font: "Helvetica", titleSize: 18, backgroudColor: .clear, isBold: false, borderColor: .clear)

    }

    @IBAction func loginButtonPressed(_ sender: Any) {
        let vc = LoginView(nibName: "LoginView", bundle: nil)
        navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func signupButtonPressed(_ sender: Any) {
        
        let vc = SignupVC(nibName: "SignupVC", bundle: nil)
        navigationController?.pushViewController(vc, animated: true)

    }
        
}

//
//  SignupVC.swift
//  AnimationTest
//
//  Created by Shishir Ahmed on 27/5/20.
//  Copyright © 2020 Shishir Ahmed. All rights reserved.
//

import UIKit

class SignupVC: UIViewController {

    @IBOutlet var signupBtn: CustomButton!
    @IBOutlet var facebookBtn: UIButton!
    
    @IBOutlet var textFullName: UITextField!
    @IBOutlet var txtEmail: UITextField!
    @IBOutlet var txtPassword: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupButton()
    }
    
    private func setupButton() {
        
        signupBtn.setupDesign(title: "Sign Up", titleColor: .white, height: 40, font: "Helvetica", titleSize: 18, backgroudColor: .blue, isBold: false, borderColor: .blue, radious: 20)
        signupBtn.addShadow(color: .blue)
        
        facebookBtn.layer.cornerRadius = 20
        
        setupIcon()
    }
    
    private func setupIcon() {
        textFullName.addImageView(image: #imageLiteral(resourceName: "user"))
        txtEmail.addImageView(image: #imageLiteral(resourceName: "mail") )
        txtPassword.addImageView(image: #imageLiteral(resourceName: "eye"), isSecure: true)
    }

    @IBAction func signBtnPressed(_ sender: Any) {
        let vc = LoginView(nibName: "LoginView", bundle: nil)
        navigationController?.pushViewController(vc, animated: true)
    }
}

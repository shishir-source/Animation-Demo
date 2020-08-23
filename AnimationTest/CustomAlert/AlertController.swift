//
//  AlertViewController.swift
//  AnimationTest
//
//  Created by Shishir Ahmed on 27/5/20.
//  Copyright © 2020 Shishir Ahmed. All rights reserved.
//

import UIKit

class AlertController: UIViewController {
    
    let successButton: CustomButton = {
        let button = CustomButton(type: .system)
        button.setupDesign(title: "Success", titleColor: .white, height: 50, font: "Helvetica", titleSize: 19, backgroudColor: .green, isBold: true)
        button.addTarget(self, action: #selector(successALert), for: .touchUpInside)
        return button
    }()
    
    let failButton: CustomButton = {
        let button = CustomButton(type: .system)
        button.setupDesign(title: "Failed", titleColor: .white, height: 50, font: "Helvetica", titleSize: 19, backgroudColor: .red)
        button.addTarget(self, action: #selector(failureALert), for: .touchUpInside)
        return button
    }()
    
    let customBtn: CustomButton = {
        let btn = CustomButton(type: .system)
        btn.setupDesign(title: "New Button", titleColor: .white, height: 50, font: "Helvetica", titleSize: 19, backgroudColor: .black, isBold: true)
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        
        setupView()
    }
    
    //MARK:: Helpers/ Selectors
    
    private func setupView() {
        
        let stackView = UIStackView(arrangedSubviews: [successButton, failButton, customBtn])
        stackView.axis = .vertical
        stackView.spacing = 15
        view.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        stackView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -100).isActive = true
    }
    
    @objc func successALert() {
        AlertView.instance.showAlert(title: "Success", message: "Success doesn’t just find you. You have to go out and get it.", alertType: .success)
    }
    
    @objc func failureALert() {
        AlertView.instance.showAlert(title: "Failed", message: "It seems that failure tends to be more public than success.", alertType: .failure)
    }

}

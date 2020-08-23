//
//  ChainAnimationVC.swift
//  AnimationTest
//
//  Created by Shishir Ahmed on 22/5/20.
//  Copyright © 2020 Shishir Ahmed. All rights reserved.
//

import UIKit

class ChainAnimationVC: UIViewController{
    
    //MARK:: - Properties
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.textColor = .black
        label.numberOfLines = 0
        label.font = UIFont(name: "Futura", size: 34)
        label.text = "Welcome to our company,\nMr. Abdul"
        return label
    }()
    
    let bodyLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.textColor = .black
        label.text = "Hello there! thanks so much for donwloading our brand new app and giving us a try. Make sure to leave us a good review in the AppStore"
        label.numberOfLines = 0
        return label
    }()
    
    
    //MARK:: -LifeCycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        configureStackView()
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTapAnimation)))
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(doubleTapped))
        tap.numberOfTapsRequired = 2
        view.addGestureRecognizer(tap)
        
    }
    
    //MARK:: Helpers Function
    
    private func configureStackView() {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, bodyLabel])
        stackView.axis = .vertical
        stackView.spacing = 8
        view.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        stackView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -100).isActive = true
    }
    
    //MARK:: - Selectors
    
    @objc private func handleTapAnimation() {
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
            
            self.titleLabel.transform = CGAffineTransform(translationX: -30, y: 0)
            
        }) { (_) in
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                
                self.titleLabel.alpha = 0
                self.titleLabel.transform = self.titleLabel.transform.translatedBy(x: 0, y: -300)
                
            })
        }
        
        UIView.animate(withDuration: 0.5, delay: 1, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
            
            self.bodyLabel.transform = CGAffineTransform(translationX: -30, y: 0)
            
        }) { (_) in
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                
                self.bodyLabel.alpha = 0
                self.bodyLabel.transform = self.bodyLabel.transform.translatedBy(x: 0, y: -300)
                
            })
        }
    }
    
    @objc private func doubleTapped() {
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseIn, animations: {
            
            self.titleLabel.transform = CGAffineTransform(translationX: -30, y: self.titleLabel.frame.origin.y)
            
        }) { (_) in
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                
                self.titleLabel.alpha = 1
                self.titleLabel.transform = self.titleLabel.transform.translatedBy(x: self.titleLabel.frame.origin.x, y: self.titleLabel.frame.origin.y)
                
            })
        }
        
        UIView.animate(withDuration: 0.5, delay: 1, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseIn, animations: {
            
            self.bodyLabel.transform = CGAffineTransform(translationX: -30, y: self.bodyLabel.frame.origin.y)
            
        }) { (_) in
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                
                self.bodyLabel.alpha = 1
                self.bodyLabel.transform = self.bodyLabel.transform.translatedBy(x: self.bodyLabel.frame.origin.x, y: self.bodyLabel.frame.origin.y)
                
            })
        }
    }
}

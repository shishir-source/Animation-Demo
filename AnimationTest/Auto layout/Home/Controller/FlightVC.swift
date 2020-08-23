//
//  FlightVC.swift
//  AnimationTest
//
//  Created by Shishir Ahmed on 5/6/20.
//  Copyright © 2020 Shishir Ahmed. All rights reserved.
//

import UIKit

class FlightVC: UIViewController {
    
    @IBOutlet weak var roundBtn: UIButton!
    @IBOutlet weak var OneWayBtn: UIButton!
    @IBOutlet weak var multiBtn: UIButton!
    
    @IBOutlet weak var titleImage: UIImageView!
    @IBOutlet weak var searchBtn: UIButton!
    
    @IBOutlet weak var backView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Search Flight"
        
        roundBtn.designButton(borderWith: 0, borderColor: .clear)
        OneWayBtn.designButton(borderWith: 0, borderColor: .clear)
        multiBtn.designButton(borderWith: 0, borderColor: .clear)
        backView.designView(borderWith: 0.5, borderColor: #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1))
        
        titleImage.layer.borderWidth = 1
        titleImage.layer.masksToBounds = false
        titleImage.layer.borderColor = UIColor.clear.cgColor
        titleImage.layer.cornerRadius = titleImage.frame.height / 1.5
        titleImage.clipsToBounds = true
        titleImage.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]

        
        searchBtn.layer.cornerRadius = 23
        
    }

    @IBAction func onClickRound(_ sender: Any) {
        changeButtonColor(roundColor: #colorLiteral(red: 0.4428953626, green: 0, blue: 1, alpha: 0.8470588235) , roundTxtColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
    }
    
    @IBAction func onClickOneWay(_ sender: Any) {
        changeButtonColor(oneWayColor: #colorLiteral(red: 0.4428953626, green: 0, blue: 1, alpha: 0.8470588235) , oneWayTxtColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
    }
    
    @IBAction func onClickMulti(_ sender: Any) {
        changeButtonColor(multiColor: #colorLiteral(red: 0.4428953626, green: 0, blue: 1, alpha: 0.8470588235) , multiTxtColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
    }
    
    func changeButtonColor(roundColor: UIColor = .white, oneWayColor: UIColor = .white, multiColor: UIColor = .white, roundTxtColor: UIColor = #colorLiteral(red: 0.4428953626, green: 0, blue: 1, alpha: 0.8470588235), oneWayTxtColor: UIColor = #colorLiteral(red: 0.4428953626, green: 0, blue: 1, alpha: 0.8470588235), multiTxtColor: UIColor = #colorLiteral(red: 0.4428953626, green: 0, blue: 1, alpha: 0.8470588235)) {
        roundBtn.backgroundColor = roundColor
        OneWayBtn.backgroundColor = oneWayColor
        multiBtn.backgroundColor = multiColor
        
        roundBtn.setTitleColor(roundTxtColor, for: .normal)
        OneWayBtn.setTitleColor(oneWayTxtColor, for: .normal)
        multiBtn.setTitleColor(multiTxtColor, for: .normal)
    }
    
    @IBAction func searchBtnClick(_ sender: Any) {
        let search = SearchDetailsVC(nibName: "SearchDetailsVC", bundle: nil)
        navigationController?.pushViewController(search, animated: true)
    }
}

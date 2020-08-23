//
//  MainTabVC.swift
//  AnimationTest
//
//  Created by Shishir Ahmed on 3/6/20.
//  Copyright © 2020 Shishir Ahmed. All rights reserved.
//
import UIKit

class MainTabVC: UITabBarController {
    
    //MARK:: - Properties
    
    let dot = UIView()
    var notificationIDs = [String]()
    
    //MARK:: - Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        configureViewController()
        
    }
    
    //MARK:: - Helper Functions
    
    func configureViewController(){
        
        let home = HomeVC(nibName: "HomeVC", bundle: nil)
        let homeVC = constructNavController(unselectedImage: #imageLiteral(resourceName: "home_unselected"), selectedImage: #imageLiteral(resourceName: "home_selected"), rootViewController: home )
        
        let profile = ProfileVC(nibName: "ProfileVC", bundle: nil)
        let profileVC = constructNavController(unselectedImage: #imageLiteral(resourceName: "profile_unselected"), selectedImage: #imageLiteral(resourceName: "profile_selected"), rootViewController: profile )
        
        let upload = UploadVC(nibName: "UploadVC", bundle: nil)
        let uploadVC = constructNavController(unselectedImage: #imageLiteral(resourceName: "plus_unselected"), selectedImage: #imageLiteral(resourceName: "plus_unselected"), rootViewController: upload )
        
        let search = SearchVC(nibName: "SearchVC", bundle: nil)
        let searchVC = constructNavController(unselectedImage: #imageLiteral(resourceName: "search_unselected"), selectedImage: #imageLiteral(resourceName: "search_selected"), rootViewController: search )
        
        viewControllers = [homeVC, uploadVC, searchVC, profileVC]
        
        tabBar.barTintColor = .white
        
        tabBar.items?[0].title = "Home"
        tabBar.items?[1].title = "Add"
        tabBar.items?[2].title = "Search"
        tabBar.items?[3].title = "Profile"
    }
    
    func constructNavController(unselectedImage: UIImage, selectedImage: UIImage, rootViewController: UIViewController = UIViewController()) -> UINavigationController{
       // construct nav controller
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.image = unselectedImage
        navController.tabBarItem.selectedImage = selectedImage
        navController.navigationBar.tintColor = .black
        
        // return nav controller
        return navController
    }
    
    

}

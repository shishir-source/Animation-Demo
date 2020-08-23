//
//  AppDelegate.swift
//  AnimationTest
//
//  Created by Shishir Ahmed on 16/5/20.
//  Copyright © 2020 Shishir Ahmed. All rights reserved.
//

import UIKit
import GooglePlaces

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // Override point for customization after application launch.
        window = UIWindow()
        
        
//        let accessToken = UserDefaults.standard.value(forKey: "AccessToken")
//
//        if accessToken != nil {
//            let vc = MainTabVC()
//            window?.rootViewController = vc
//            window?.makeKeyAndVisible()
//        }else{
//            let navigationController = UINavigationController(rootViewController: LoginVC())
//            window?.rootViewController = navigationController
//            window?.makeKeyAndVisible()
//        }

        let navigationController = UINavigationController(rootViewController: BookStoreVC(nibName: "BookStoreVC", bundle: nil))
     
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        GMSPlacesClient.provideAPIKey("AIzaSyBVbqphWAsM707bSHhfJI_bylhe93MizEA")
        
        return true
    }


}


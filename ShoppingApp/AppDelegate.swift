//
//  AppDelegate.swift
//  ShoppingApp
//
//  Created by AliEren on 26.05.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        let token = UserDefaults.standard.string(forKey: "token")
        if token != nil {
            AuthenticationManager.shared.isAuthenticated = true
        } else {
            AuthenticationManager.shared.isAuthenticated = false
        }
        
        let mainView = TabBarController()
        let nav1 = UINavigationController(rootViewController: mainView)
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        window?.rootViewController = nav1
        
        return true
    }
}


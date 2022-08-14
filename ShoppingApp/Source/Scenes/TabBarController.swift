//
//  ViewController.swift
//  ShoppingApp
//
//  Created by AliEren on 26.05.2022.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
        let homeVC = HomeViewController()
        let searchVC = SearchViewController()
        let menuVC =  MenuMainViewController()
        let menuNav = UINavigationController()
        menuNav.viewControllers = [menuVC]
        let personalVC = AuthenticationManager.shared.isAuthenticated == true ? ProfileMainViewController() : LoginViewController()
        let cartVC = CartViewController()
        
        homeVC.tabBarItem.image = UIImage(systemName: "house")
        searchVC.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        menuNav.tabBarItem.title = "MENU"
        menuNav.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -20)
        
        personalVC.tabBarItem.image = UIImage(systemName: "person")
        cartVC.tabBarItem.image = UIImage(systemName: "cart")
        
        
        
        setViewControllers([homeVC,searchVC,menuNav,personalVC,cartVC], animated: true)
        
        tabBar.backgroundColor = .white
//        guard let items = tabBar.items else {return}
//
//        let images = ["house","magnifyingglass","menucard","person","cart"]
//
//        for x in 0...4 {
//            items[x].image = UIImage(systemName: images[x])
//        }
    }
    
    
    
    
}


final class HomeViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .red
    }
}

final class SearchViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .green
    }
}

final class MenuViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .gray
    }
}

final class PersonalViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .brown
    }
}

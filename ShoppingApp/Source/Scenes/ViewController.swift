//
//  ViewController.swift
//  ShoppingApp
//
//  Created by AliEren on 26.05.2022.
//

import UIKit

class ViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let homeVC = HomeViewController()
        let searchVC = SearchViewController()
        let menuVC = CategoriesViewController()
        let personalVC = PersonalViewController()
        let cartVC = CartViewController()
        
        homeVC.title = "Home"
        searchVC.title = "Search"
        menuVC.title = "Menu"
        personalVC.title = "Personal"
        cartVC.title = "Cart"
        
        
        setViewControllers([homeVC,searchVC,menuVC,personalVC,cartVC], animated: true)
        
        tabBar.backgroundColor = .white
        guard let items = tabBar.items else {return}
        
        let images = ["house","magnifyingglass","menucard","person","cart"]
        
        for x in 0...4 {
            items[x].image = UIImage(systemName: images[x])
        }
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

final class CartViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .cyan
    }
}


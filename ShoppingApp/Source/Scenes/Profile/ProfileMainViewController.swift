//
//  ProfileMainViewController.swift
//  ShoppingApp
//
//  Created by AliEren on 14.07.2022.
//

import Foundation
import UIKit
import SnapKit

class ProfileMainViewController: UIViewController {
    
    var viewControllers: [UIViewController]!
    var pageViewController: UIPageViewController!
    let menuController = MenuController(pageName: "profile",collectionViewLayout: UICollectionViewFlowLayout())
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPageController()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func setupPageController() {

        pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        pageViewController.delegate = self
        
        viewControllers = [
            PurchasesViewController(),
            ProfileViewController(),
            PurchasesViewController(),
            ProfileViewController(),
            PurchasesViewController()
        ]
        
        pageViewController.setViewControllers([viewControllerAtIndex(0)!], direction: .forward, animated: true, completion: nil)
        pageViewController.dataSource = self
        
        menuController.delegate = self
        let menuView = menuController.view!
        view.addSubview(menuView)
        
        addChild(pageViewController)
        view.addSubview(pageViewController.view)
        
        menuView.snp.makeConstraints { make in
            make.height.equalTo(120)
            make.leading.trailing.equalToSuperview()
            make.top.equalToSuperview().inset(60)
        }

        pageViewController.view.snp.makeConstraints { make in
            make.top.equalTo(menuView.snp.bottom).offset(10)
            make.leading.bottom.trailing.equalToSuperview()
        }
        
        
//        pageViewController!.view.frame = view.bounds
        pageViewController.didMove(toParent: self)
        
        // Add the page view controller's gesture recognizers to the view controller's view so that the gestures are started more easily.
        view.gestureRecognizers = pageViewController.gestureRecognizers
    }
}

// MARK: - UIPageViewController DataSource and Delegate
extension ProfileMainViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var index = indexOfViewController(viewController)
        
        if (index == 0) || (index == NSNotFound) {
            return nil
        }
        
        index -= 1
        
        return viewControllerAtIndex(index)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var index = indexOfViewController(viewController)
        
        if index == NSNotFound {
            return nil
        }
        
        index += 1
        print(index)
        
        if index == viewControllers.count {
            return nil
        }
        
        return viewControllerAtIndex(index)
    }
    
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return viewControllers.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }
}

// MARK: - Helpers
extension ProfileMainViewController {
    fileprivate func viewControllerAtIndex(_ index: Int) -> UIViewController? {
        if viewControllers.count == 0 || index >= viewControllers.count {
            return nil
        }
        return viewControllers[index]
    }
    
    fileprivate func indexOfViewController(_ viewController: UIViewController) -> Int {
        return viewControllers.firstIndex(of: viewController) ?? NSNotFound
    }
    
}

extension ProfileMainViewController: MenuControllerDelegate {
    func didTapMenuItem(indexPath: IndexPath) {
        goToSpecificPage(index: indexPath.row, ofViewControllers: viewControllers)
    }
}

extension ProfileMainViewController {

    func goToNextPage(animated: Bool = true, completion: ((Bool) -> Void)? = nil) {
        guard let currentPage = viewControllers?[0] else { return }
        guard let nextPage = pageViewController.dataSource?.pageViewController(pageViewController.self, viewControllerAfter: currentPage) else { return }
        
        pageViewController.setViewControllers([nextPage], direction: .forward, animated: animated, completion: completion)
    }
    
    func goToPreviousPage(animated: Bool = true, completion: ((Bool) -> Void)? = nil) {
        guard let currentPage = viewControllers?[0] else { return }
        guard let prevPage = pageViewController.dataSource?.pageViewController(pageViewController.self, viewControllerBefore: currentPage) else { return }
        
        pageViewController.setViewControllers([prevPage], direction: .forward, animated: animated, completion: completion)
    }
    
    func goToSpecificPage(index: Int, ofViewControllers pages: [UIViewController]) {
        pageViewController.setViewControllers([pages[index]], direction: index > 1 ? .forward : .reverse, animated: true, completion: nil)
    }
}

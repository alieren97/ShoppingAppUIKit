//
//  ProductsViewController.swift
//  ShoppingApp
//
//  Created by AliEren on 26.05.2022.
//

import Foundation
import UIKit

class ProductsViewController: UIViewController,Layouting {
    typealias ViewType = ProductsView
    var products = [ProductList]()
    var categoryId: String?
    
    override func loadView() {
        view = ViewType.create()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initService()
        setupCollectionView()
        setupTargets()
        navigationController?.navigationBar.isHidden = true
    }
    
}

extension ProductsViewController: UICollectionViewDelegate,UICollectionViewDataSource {
    
    func setupCollectionView() {
        
        layoutableView.productsCollectionView.delegate = self
        layoutableView.productsCollectionView.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfSections section: Int) -> Int {
            return 1
        }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let product = products[indexPath.row]
        let nvc = ProductDetailViewController()
        nvc.product = product
        nvc.layoutableView.configure(product: product)
        navigationController?.pushViewController(nvc, animated: true)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductViewCell.identifier,
                                                       for: indexPath) as? ProductViewCell else { return UICollectionViewCell() }
        let product = products[indexPath.row]
        cell.configure(product:product)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.layoutableView.productsCollectionView.frame.size.width / 1.5, height: UIScreen.main.bounds.height * 0.7)
        }
    

}

extension ProductsViewController {
    func initService() {
        guard let categoryID = categoryId else { return }
        NetworkManager.shared.fetchProducts(categoryId: categoryID) { result in
            switch result {
            case .success(let response):
                self.products = response.productList
                self.layoutableView.productsCollectionView.reloadData()
            case .failure(let error):
               print(error)
            }

        }
    }
    
    private func setupTargets() {
        layoutableView.backButton.addTarget(self, action: #selector(backButtonDidTap), for: .touchUpInside)
    }
    
    @objc func backButtonDidTap() {
        print("ali")
        navigationController?.popViewController(animated: true)
    }
}

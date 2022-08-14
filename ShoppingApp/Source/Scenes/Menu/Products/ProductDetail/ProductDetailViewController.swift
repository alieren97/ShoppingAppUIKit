//
//  ProductDetail.swift
//  ShoppingApp
//
//  Created by AliEren on 29.05.2022.
//

import Foundation
import UIKit
import SnapKit

class ProductDetailViewController: UIViewController,Layouting {
    typealias ViewType = ProductDetail
    var product: ProductList?
    var cartProducts = [Cart]()
    
    override func loadView() {
        view = ViewType.create()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupTargets()
        cartProducts = UserDefaultsManager.shared.loadCartProducts()
    }
    
}


extension ProductDetailViewController: UITableViewDelegate,UITableViewDataSource {
    
    func setupTableView() {
        layoutableView.productImageTableView.dataSource = self
        layoutableView.productImageTableView.delegate = self
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return product?.img.count ?? 0
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ProductImageTableViewCell.identifier,
                                                       for: indexPath) as? ProductImageTableViewCell else { return UITableViewCell() }
        let productImage = product?.img[indexPath.row] ?? ""
        
        cell.configure(productImage: productImage)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

extension ProductDetailViewController {
    func setupTargets() {
        layoutableView.addToCartButton.addTarget(self, action: #selector(cartButtonDidTap), for: .touchUpInside)
    }
}

extension ProductDetailViewController {
    @objc func cartButtonDidTap() {
        guard let productCart = product else { return }
        cartProducts.append(Cart(product: productCart, quantity: 1))
        UserDefaultsManager.shared.updateCartProducts(cartProducts)
        print(cartProducts)
    }
}

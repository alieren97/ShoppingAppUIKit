//
//  CartViewController.swift
//  ShoppingApp
//
//  Created by AliEren on 15.07.2022.
//

import Foundation
import UIKit

final class CartViewController: UIViewController, Layouting {
    
    private var cartProducts = [Cart]()
    private var totalPrice: Float = 0
    typealias ViewType = CartView
    
    override func loadView() {
        view = ViewType.create()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        initService()
        calculatePrice()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        initService()
    }
}

extension CartViewController: UITableViewDelegate, UITableViewDataSource{
    func setupTableView() {
        layoutableView.cartOrderTableView.delegate = self
        layoutableView.cartOrderTableView.dataSource = self
        layoutableView.cartOrderTableView.tableFooterView = layoutableView.footerView
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cartProducts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CartTableViewCell.identifier, for: indexPath) as! CartTableViewCell
        let cart = cartProducts[indexPath.row]
        cell.configure(cart: cart)
        return cell
    }
    
    
}

extension CartViewController {
    private func initService() {
        cartProducts = UserDefaultsManager.shared.loadCartProducts()
        layoutableView.totalPriceLabel.text = String(totalPrice)
    }
    
    private func calculatePrice() {
        for pro in cartProducts {
            self.totalPrice += pro.product.price
        }
    }
}

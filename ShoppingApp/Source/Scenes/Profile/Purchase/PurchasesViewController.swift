//
//  PurchasesViewController.swift
//  ShoppingApp
//
//  Created by AliEren on 14.07.2022.
//

import Foundation
import UIKit

final class PurchasesViewController: UIViewController, Layouting {
    typealias ViewType = PurchasesView
    var orders = [Order]()
    
    override func loadView() {
        view = ViewType.create()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initService()
        setupTableView()
    }
}

extension PurchasesViewController: UITableViewDelegate, UITableViewDataSource {
    func setupTableView() {
        layoutableView.ordersTableView.delegate = self
        layoutableView.ordersTableView.dataSource = self
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PurchaseTableViewCell.identifier,
                                                       for: indexPath) as? PurchaseTableViewCell else { return UITableViewCell() }
        let order = orders[indexPath.row]
        cell.configure(order: order)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let order = orders[indexPath.row]
        print(order.getOrderImageLists())
    }
}


extension PurchasesViewController {
    func initService() {
        NetworkManager.shared.fetchPurchases { result in
            switch result {
            case .success(let response):
                self.orders = response.orders
                self.layoutableView.ordersTableView.reloadData()
            case .failure(let error):
               print(error)
            }
        }
    }
}

//
//  CategoriesViewController.swift
//  ShoppingApp
//
//  Created by AliEren on 9.07.2022.
//

import Foundation
import UIKit

final class CategoriesViewController: UIViewController, Layouting {
    typealias ViewType = CategoriesView
    var categoryList = [Category]()
    
    override func loadView() {
        view = ViewType.create()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        initService()
      
    }
    
    
}


extension CategoriesViewController : UITableViewDataSource,UITableViewDelegate {
    func setupTableView() {
        layoutableView.tableView.delegate = self
        layoutableView.tableView.dataSource = self
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CategoriesTableViewCell.identifier,
                                                       for: indexPath) as? CategoriesTableViewCell else { return UITableViewCell() }
        let category = categoryList[indexPath.row]
        cell.configure(category: category)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let id = categoryList[indexPath.row].id
        let nvc = ProductsViewController()
        nvc.categoryId = id
        navigationController?.pushViewController(nvc, animated: true)
        
//        NetworkManager.shared.fetchProducts(categoryId: id) { result in
//            switch result {
//            case .success(let response):
//                print(response.productList)
//            case .failure(let error):
//               print(error)
//            }
//        }
    }
}

extension CategoriesViewController {
    func initService() {
        NetworkManager.shared.fetchCategories { result in
            switch result {
            case .success(let response):
                self.categoryList = response.categories
                self.layoutableView.tableView.reloadData()
            case .failure(let error):
               print(error)
            }
        }
    }
}

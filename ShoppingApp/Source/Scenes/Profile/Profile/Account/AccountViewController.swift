//
//  AccountViewController.swift
//  ShoppingApp
//
//  Created by AliEren on 16.07.2022.
//

import Foundation
import UIKit
import Kingfisher

final class AccountViewController: UIViewController, Layouting {
    
    private var items = ["CHANGE E-MAIL","CHANGE PASSWORD","DELETE YOUR ACCOUNT"]
    
    typealias ViewType = AccountView
    
    override func loadView() {
        view = ViewType.create()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        navigationController?.navigationBar.isHidden = true

    }
}

extension AccountViewController: UITableViewDelegate, UITableViewDataSource {
    func setupTableView() {
        layoutableView.accountTableView.delegate = self
        layoutableView.accountTableView.dataSource = self
        layoutableView.accountTableView.tableHeaderView = layoutableView.headerView
        layoutableView.accountTableView.tableFooterView = layoutableView.footerView
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ProfileTableViewCell.identifier,
                                                       for: indexPath) as? ProfileTableViewCell else { return UITableViewCell() }
        let item = self.items[indexPath.row]
        cell.configure(menuItem: item)
        return cell
    }
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//            return 50
//        }
}

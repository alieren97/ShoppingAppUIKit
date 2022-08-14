//
//  ProfileViewController.swift
//  ShoppingApp
//
//  Created by AliEren on 14.07.2022.
//

import Foundation
import UIKit

final class ProfileViewController: UIViewController,Layouting {
    var user: User? = nil
    let items = ["ACCOUNT","ADDRESSES","WALLET"]
    
    typealias ViewType = ProfileView
    
    override func loadView() {
        view = ViewType.create()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        user = UserDefaultsManager.shared.getUserData()
        layoutableView.configure(user: user!)
    }
    
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func setupTableView() {
        layoutableView.profileTableView.delegate = self
        layoutableView.profileTableView.dataSource = self
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
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = self.items[indexPath.row]
        if item == "ACCOUNT" {
            let nvc = AccountViewController()
            navigationController?.pushViewController(nvc, animated: true)
        }
    }
}


//
//  PurchasesView.swift
//  ShoppingApp
//
//  Created by AliEren on 14.07.2022.
//

import Foundation
import UIKit
import SnapKit

final class PurchasesView: UIView, Layoutable {
    
    lazy var ordersTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(PurchaseTableViewCell.self,
                           forCellReuseIdentifier: PurchaseTableViewCell.identifier)
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        tableView.frame = frame
        tableView.rowHeight = PurchaseTableViewCell.rowHeight
        tableView.backgroundColor = .white
        return tableView
    }()
    
    func setupViews() {
        addSubview(ordersTableView)
    }
    
    func setupLayout() {
        ordersTableView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().inset(25)
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    
}

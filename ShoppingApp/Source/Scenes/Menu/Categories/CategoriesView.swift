//
//  CategoriesView.swift
//  ShoppingApp
//
//  Created by AliEren on 8.07.2022.
//

import Foundation
import UIKit
import SnapKit


final class CategoriesView: UIView, Layoutable {
    
    lazy var tableView: UITableView = {
       let tableView = UITableView()
        tableView.register(CategoriesTableViewCell.self,
                           forCellReuseIdentifier: CategoriesTableViewCell.identifier)
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        tableView.frame = frame
        tableView.rowHeight = CategoriesTableViewCell.rowHeight
        tableView.backgroundColor = .white
        return tableView
        
    }()
    
    func setupViews() {
        addSubview(tableView)
    }
    
    func setupLayout() {
        tableView.snp.makeConstraints { $0.edges.equalToSuperview() }
    }
    
    
}

//
//  CartView.swift
//  ShoppingApp
//
//  Created by AliEren on 15.07.2022.
//

import Foundation
import UIKit
import SnapKit

final class CartView: UIView, Layoutable {
    
    lazy var shoppingBagLabel: UILabel = {
        let label = UILabel()
        label.text = "SHOPPING BAG"
        label.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        return label
    }()
    
    lazy var informationLabel: UILabel = {
        let label = UILabel()
        label.text = "ITEMS IN THE BASKET ARE NOT RESERVED UNTIL COMPLETING THE PURCHASE"
        label.font = UIFont.systemFont(ofSize: 13, weight: .thin)
        label.numberOfLines = 2
        label.textColor = .black
        return label
    }()
    
    lazy var informationView: UIView = {
       let view = UIView()
        view.backgroundColor = .lightGray
        view.addSubview(informationLabel)
        return view
    }()
    
    lazy var cartOrderTableView: UITableView = {
       let tableView = UITableView()
        tableView.register(CartTableViewCell.self, forCellReuseIdentifier: CartTableViewCell.identifier)
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        tableView.frame = frame
        tableView.rowHeight = CartTableViewCell.rowHeight
        tableView.backgroundColor = .white
//        tableView.tableFooterView = continueButton
        return tableView
    }()
    
    lazy var continueButton: UIButton = {
       let button = UIButton()
        button.setTitle("ORDER", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = .black
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        return button
    }()
    
    lazy var totalPriceLabel: UILabel = {
       let label = UILabel()
        label.text = "900"
        return label
    }()
    
    lazy var footerView: UIView = {
       let view = UIView()
        view.addSubview(continueButton)
        continueButton.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(10)
            make.leading.equalToSuperview().inset(30)
            make.width.equalTo(150)
            make.height.equalTo(50)
        }
        view.addSubview(totalPriceLabel)
        totalPriceLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(10)
            make.trailing.equalToSuperview().inset(50)
            make.height.equalTo(50)
        }
        view.frame.size.height =  100
        return view
    }()
    
    func setupViews() {
        addSubview(shoppingBagLabel)
        addSubview(informationView)
        addSubview(cartOrderTableView)
//        addSubview(continueButton)
    }
    
    func setupLayout() {
        shoppingBagLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(50)
            make.leading.equalToSuperview().inset(20)
            make.height.equalTo(60)
        }
        informationView.snp.makeConstraints { make in
            make.top.equalTo(shoppingBagLabel.snp.bottom).offset(5)
            make.leading.trailing.equalToSuperview().inset(15)
            make.height.equalTo(60)
            
        }
        informationLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(10)
            make.bottom.equalToSuperview()
        }
        cartOrderTableView.snp.makeConstraints { make in
            make.top.equalTo(informationView.snp.bottom).offset(5)
            make.leading.trailing.bottom.equalToSuperview()
//            make.bottom.equalTo(continueButton.snp.top).offset(5)
        }
        
//        continueButton.snp.makeConstraints { make in
//            make.top.equalTo(cartOrderTableView.snp.bottom).offset(30)
//            make.leading.equalToSuperview().inset(30)
//            make.width.equalTo(150)
//            make.height.equalTo(50)
//        }
    }
    
    
}

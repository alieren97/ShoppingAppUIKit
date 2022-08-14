//
//  ProductDetail.swift
//  ShoppingApp
//
//  Created by AliEren on 2.06.2022.
//

import Foundation
import UIKit
import SnapKit

class ProductDetail: UIView,Layoutable {
        
    lazy var productContainerView: UIView = {
        var view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 19
        view.addSubview(productImageTableView)
        return view
    }()

    
    lazy var productImageTableView: UITableView = {
       let tableView = UITableView()
        tableView.register(ProductImageTableViewCell.self, forCellReuseIdentifier: ProductImageTableViewCell.identifier)
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        tableView.frame = frame
        tableView.rowHeight = ProductImageTableViewCell.rowHeight
        tableView.backgroundColor = .white
        return tableView
    }()
    
    lazy var productDetailScrollView: UIScrollView = {
       let scrollView = UIScrollView()
        scrollView.addSubview(productSubContainerView)
        scrollView.backgroundColor = .black
        scrollView.alwaysBounceHorizontal = false
        scrollView.alwaysBounceVertical = true
        scrollView.layer.cornerRadius = 19
        return scrollView
    }()
    
    lazy var productSubContainerView: UIView = {
       let view = UIView()
        view.addSubview(productPriceLabel)
        view.addSubview(productNameLabel)
        view.addSubview(addToCartButton)
        view.backgroundColor = .black
        view.layer.cornerRadius = 19
        return view
    }()
    private lazy var productPriceLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        return label
    }()
    
    private lazy var productNameLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        return label
    }()
    
    lazy var addToCartButton: UIButton = {
       let button = UIButton()
        button.setTitle("Add to Cart", for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(UIColor.black, for: .normal)
        return button
    }()
    
    func setupViews() {
        addSubview(productContainerView)
        addSubview(productDetailScrollView)
    }
    
    func setupLayout() {
        productContainerView.snp.makeConstraints { $0.edges.equalToSuperview()}

        productImageTableView.snp.makeConstraints { $0.edges.equalToSuperview() }
        
        productDetailScrollView.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.height.equalTo(350)
            make.width.equalToSuperview()
        }
        
        
        productSubContainerView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.height.equalTo(600)
            make.width.equalToSuperview()
        }
        
        productNameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(40)
            make.leading.equalToSuperview().inset(20)
        }
        
        productPriceLabel.snp.makeConstraints { make in
            make.top.equalTo(productNameLabel.snp.bottom).offset(20)
            make.leading.equalToSuperview().inset(20)
        }
        
        addToCartButton.snp.makeConstraints { make in
            make.top.equalTo(productPriceLabel.snp.bottom).offset(20)
            make.height.equalTo(50)
            make.width.equalTo(100)
            make.leading.equalToSuperview().inset(20)
        }
    }
    
    func configure(product: ProductList) {
         let productName = product.title
        productNameLabel.text = productName
        productPriceLabel.text = String(product.price)
    }
}

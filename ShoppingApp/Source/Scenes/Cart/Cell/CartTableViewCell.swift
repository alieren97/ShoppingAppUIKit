//
//  CartTableViewCell.swift
//  ShoppingApp
//
//  Created by AliEren on 15.07.2022.
//

import Foundation
import SnapKit
import UIKit
import Kingfisher

final class CartTableViewCell: UITableViewCell {
    static let identifier = "CartTableViewCell"
    static let rowHeight: CGFloat = 350
    var imageWidth: CGFloat = UIScreen.main.bounds.width / 1.9
    var restWidth: CGFloat = (UIScreen.main.bounds.width - UIScreen.main.bounds.width / 1.9) - 30
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupLayout()
    }
    
    lazy var cartProductContainer: UIView = {
       let view = UIView()
        view.addSubview(productImageView)
        view.addSubview(productLabel)
        view.addSubview(productQuantity)
        view.addSubview(productPrice)
        view.addSubview(deleteButton)
        return view
    }()
    
    private lazy var productImageView: UIImageView = {
      let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var productLabel: UILabel = {
       let label = UILabel()
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 13, weight: .thin)
        return label
    }()
    
    private lazy var productQuantity: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13, weight: .thin)
        return label
    }()
    
    private lazy var productPrice: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13, weight: .thin)
        return label
    }()
    
    private lazy var deleteButton: UIButton = {
       let button = UIButton()
        button.setTitle("DELETE", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 13, weight: .thin)
        button.setTitleColor(UIColor.black, for: .normal)
       return button
    }()
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        addSubview(cartProductContainer)
    }
    
    func setupLayout() {
        cartProductContainer.snp.makeConstraints { $0.edges.equalToSuperview() }
        
        productImageView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.width.equalTo(imageWidth)
            make.leading.equalToSuperview().inset(5)
        }
        productLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(25)
            make.leading.equalTo(productImageView.snp.trailing).offset(15)
            make.width.equalTo(restWidth)
        }
        
        productQuantity.snp.makeConstraints { make in
            make.top.equalTo(productLabel.snp.bottom).offset(20)
            make.leading.equalTo(productImageView.snp.trailing).offset(15)
            make.width.equalTo(restWidth)
        }
        
        productPrice.snp.makeConstraints { make in
            make.top.equalTo(productQuantity.snp.bottom).offset(70)
            make.leading.equalTo(productImageView.snp.trailing).offset(15)
            make.width.equalTo(restWidth)
        }
        
        deleteButton.snp.makeConstraints { make in
            make.leading.equalTo(productImageView.snp.trailing).offset(15)
            make.top.equalTo(productPrice.snp.bottom).offset(80)
            make.height.equalTo(40)
            
            
        }
    }
}

extension CartTableViewCell {
    func configure(cart: Cart){
        productLabel.text = cart.product.title
        productPrice.text = String(cart.product.price)
        productQuantity.text = String(cart.quantity)
        let url = URL(string: cart.product.img[0])
        productImageView.kf.setImage(with: url)
    }
}

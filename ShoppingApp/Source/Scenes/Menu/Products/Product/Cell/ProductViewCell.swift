//
//  ProductViewCell.swift
//  ShoppingApp
//
//  Created by AliEren on 26.05.2022.
//

import Foundation
import UIKit
import SnapKit
import Kingfisher

class ProductViewCell: UICollectionViewCell{
    
    static let identifier = "ProductViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var productView: UIView = {
        var view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 19
        view.addSubview(productImageView)
        view.addSubview(productPriceLabel)
        view.addSubview(productNameLabel)
        return view
    }()
    private lazy var productImageView: UIImageView = {
       var imageView = UIImageView()
        imageView.image = UIImage(named: "thsirt")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.isUserInteractionEnabled = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 10
        return imageView
    }()
    
    private lazy var productPriceLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.text = "369.95"
        label.font = UIFont.systemFont(ofSize: 12, weight: .light)
        return label
    }()
    
    private lazy var productNameLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 13, weight: .light)
        return label
    }()
    
    
    func setupViews(){
        contentView.addSubview(productView)
    }
    
    func setupLayout() {
        productView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(1)
            make.bottom.top.equalToSuperview()
        }
        
        productImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(5)
            make.height.equalTo(400)
            make.trailing.leading.equalToSuperview().inset(8)
            make.bottom.equalToSuperview().inset(60)
        }
        
        productNameLabel.snp.makeConstraints { make in
            make.top.equalTo(productImageView.snp.bottom).offset(-10)
            make.leading.equalToSuperview().inset(10)
        }
        
        productPriceLabel.snp.makeConstraints { make in
            make.top.equalTo(productNameLabel.snp.bottom).offset(5)
            make.leading.equalToSuperview().inset(10)

        }
    }
}


// MARK: - ConfigureData
extension ProductViewCell {
    func configure(product: ProductList) {
        let productImage = product.img[0]
        let productName = product.title

//                let productPrice = product.price,
        let url = URL(string: productImage ?? "")
        productImageView.kf.setImage(with: url)
//        productPriceLabel.text = productPrice
        productNameLabel.text = productName
//        productImageView.image = UIImage(named: productImage)
    }
}

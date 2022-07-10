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
        return label
    }()
    
    private lazy var productNameLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
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
            make.width.equalTo(contentView.snp.width)
            make.bottom.equalToSuperview().inset(60)
        }
        
        productPriceLabel.snp.makeConstraints { make in
            make.top.equalTo(productImageView.snp.bottom).offset(5)
            make.centerX.equalToSuperview()
            
        }
        productNameLabel.snp.makeConstraints { make in
            make.top.equalTo(productPriceLabel.snp.bottom).offset(10)
            
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(10)
        }
    }
}


// MARK: - ConfigureData
extension ProductViewCell {
    func configure(product: ProductList) {
        let productImage = product.img[0]
        print(productImage)
        let productName = product.title
//                let productPrice = product.price,
        let url = URL(string: productImage)
        productImageView.kf.setImage(with: url)
//        productPriceLabel.text = productPrice
        productNameLabel.text = productName
//        productImageView.image = UIImage(named: productImage)
    }
}

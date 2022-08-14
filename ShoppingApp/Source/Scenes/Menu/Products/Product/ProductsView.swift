//
//  ProductsView.swift
//  ShoppingApp
//
//  Created by AliEren on 26.05.2022.
//

import Foundation
import UIKit
import SnapKit

class ProductsView: UIView,Layoutable {
    
    lazy var backButton: UIButton = {
       let button = UIButton()
        let image = UIImage(systemName: "arrow.left")
        button.setImage(image?.withTintColor(.gray, renderingMode: .alwaysTemplate), for: .normal)
        button.tintColor = .gray
        return button
    }()
    
    private lazy var logoImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "zara_logo")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var flowLayout: UICollectionViewFlowLayout = {
        var layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 190, height: 400)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        return layout
    }()
    
    lazy var productsCollectionView: UICollectionView = {
        var collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.register(ProductViewCell.self, forCellWithReuseIdentifier: ProductViewCell.identifier)
        return collectionView
    }()
    
    
    
    func setupViews() {
        addSubview(backButton)
        addSubview(productsCollectionView)
        addSubview(logoImageView)
    }
    
    func setupLayout() {
        
        backButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(15)
            make.height.width.equalTo(45)
            make.top.equalToSuperview().inset(70)
        }
        logoImageView.snp.makeConstraints { make in
            make.height.equalTo(70)
            make.width.equalTo(180)
            make.leading.equalToSuperview().inset(60)
            make.top.equalToSuperview().inset(50)
        }
        productsCollectionView.snp.makeConstraints { make in
            make.top.equalTo(logoImageView.snp.bottom).offset(5)
            make.trailing.leading.bottom.equalToSuperview()
        }
    }
    
}

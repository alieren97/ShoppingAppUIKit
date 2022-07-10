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
        addSubview(productsCollectionView)
    }
    
    func setupLayout() {
        productsCollectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
}

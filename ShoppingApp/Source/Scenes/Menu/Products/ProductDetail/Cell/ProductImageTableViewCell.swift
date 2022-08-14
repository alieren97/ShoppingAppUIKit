//
//  ProductImageCollectionViewCell.swift
//  ShoppingApp
//
//  Created by AliEren on 2.06.2022.
//

import Foundation
import UIKit
import SnapKit
import Kingfisher

class ProductImageTableViewCell: UITableViewCell {
    static let identifier = "ProductImageTableViewCell"
    static let rowHeight: CGFloat = UIScreen.main.bounds.height - 100
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    lazy var productImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.image = UIImage(named: "thsirt")
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        imageView.isUserInteractionEnabled = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 10
        return imageView
    }()
    
    func setupViews() {
        contentView.addSubview(productImageView)
    }
    
    func setupLayout() {
        productImageView.snp.makeConstraints { make in
            make.height.equalTo(UIScreen.main.bounds.height - 100)
            make.width.equalToSuperview()
        }
    }
}

extension ProductImageTableViewCell {
    func configure(productImage: String) {
        let url = URL(string: productImage)
        productImageView.kf.setImage(with: url)
    }
}

//
//  OrderProductImageCollectionViewCell.swift
//  ShoppingApp
//
//  Created by AliEren on 15.07.2022.
//

import Foundation
import UIKit
import Kingfisher
import SnapKit

final class OrderProductImageCollectionViewCell: UICollectionViewCell {
    static let identifier = "OrderProductImageCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var orderImagaView: UIImageView = {
       let image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private func setupViews() {
        addSubview(orderImagaView)
    }
    private func setupLayout() {
        orderImagaView.snp.makeConstraints { $0.edges.equalToSuperview() }
    }
}

extension OrderProductImageCollectionViewCell {
    func configure(img: String) {
        let url = URL(string: img)
        orderImagaView.kf.setImage(with: url)
        
    }
}

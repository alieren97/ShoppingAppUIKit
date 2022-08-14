//
//  CategoriesViewCell.swift
//  ShoppingApp
//
//  Created by AliEren on 9.07.2022.
//

import Foundation
import UIKit
import SnapKit

final class CategoriesTableViewCell: UITableViewCell {
    static let identifier = "CategoriesTableViewCell"
    static let rowHeight: CGFloat = 50
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var categoryLabel: UILabel = {
       let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        
        return label
    }()
    
    private func setupViews() {
        addSubview(categoryLabel)
    }
    
    private func setupLayout() {
        categoryLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.height.equalTo(50)
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview().inset(40)
        }
    }
}


extension CategoriesTableViewCell {
    func configure(category: Category) {
        categoryLabel.text = category.name.uppercased()
    }
}

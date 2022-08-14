//
//  ProfileTableViewCell.swift
//  ShoppingApp
//
//  Created by AliEren on 16.07.2022.
//

import Foundation
import UIKit
import SnapKit

final class ProfileTableViewCell: UITableViewCell {
    static let identifier = "ProfileTableViewCell"
    static let rowHeight: CGFloat = 50
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var menuLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .thin)
        return label
    }()
    
    private lazy var nextImageView: UIImageView = {
        let configuration = UIImage.SymbolConfiguration(pointSize: 14)
        let view = UIImageView(image: UIImage(systemName: "chevron.right",withConfiguration: configuration)?.withRenderingMode(.alwaysTemplate))
        view.tintColor = .gray
        
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    func setupViews() {
        addSubview(menuLabel)
        addSubview(nextImageView)
    }
    
    func setupLayout() {
        menuLabel.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview()
        }
        
        nextImageView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.trailing.equalToSuperview().inset(20)
            make.width.equalTo(13)
        }
    }
}

extension ProfileTableViewCell {
    func configure(menuItem: String) {
        menuLabel.text = menuItem
    }
}

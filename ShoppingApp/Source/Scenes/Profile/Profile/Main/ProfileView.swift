//
//  ProfileView.swift
//  ShoppingApp
//
//  Created by AliEren on 16.07.2022.
//

import Foundation
import UIKit
import SnapKit

final class ProfileView: UIView, Layoutable {
    
    private lazy var usernameLabel: UILabel = {
        let label = UILabel()
        label.text = "ALI EREN GEDIKOGLU"
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        return label
    }()
    
    private lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.text = "ALIERENSH3@GMAIL.COM"
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        return label
    }()
    
    lazy var profileTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(ProfileTableViewCell.self,
                           forCellReuseIdentifier: ProfileTableViewCell.identifier)
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        tableView.frame = frame
        tableView.rowHeight = ProfileTableViewCell.rowHeight
        tableView.backgroundColor = .white
        return tableView
    }()
    
    func setupViews() {
        addSubview(usernameLabel)
        addSubview(emailLabel)
        addSubview(profileTableView)
    }
    
    func setupLayout() {
        usernameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(10)
            make.leading.equalToSuperview().inset(60)
            make.trailing.equalToSuperview()
        }
        emailLabel.snp.makeConstraints { make in
            make.top.equalTo(usernameLabel.snp.bottom).offset(5)
            make.leading.equalToSuperview().inset(60)
//            make.width.equalTo(200)
            make.trailing.equalToSuperview()
        }
        profileTableView.snp.makeConstraints { make in
            make.top.equalTo(emailLabel.snp.bottom).offset(30)
            make.trailing.bottom.equalToSuperview()
            make.leading.equalToSuperview().inset(55)
        }
    }    
}

extension ProfileView {
    func configure(user: User){
//        usernameLabel.text = user.username.uppercased()
        emailLabel.text = user.email.uppercased()
    }
}

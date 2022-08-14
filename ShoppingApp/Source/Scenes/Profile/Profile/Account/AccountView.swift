//
//  AccountView.swift
//  ShoppingApp
//
//  Created by AliEren on 16.07.2022.
//

import Foundation
import UIKit
import SnapKit

final class AccountView: UIView, Layoutable{
    
    lazy var footerView: UIView = {
       let view = UIView()
        view.addSubview(endSessionButton)
        endSessionButton.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(30)
            make.trailing.leading.equalToSuperview().inset(20)
        }
        return view
    }()
    
    
    lazy var headerView: UIView = {
       let view = UIView(frame : CGRect(x : 0,y:0, width : accountTableView.frame.width , height : 100))
        view.addSubview(accountLabel)
        return view
    }()
    
    lazy var backButton: UIButton = {
       let button = UIButton()
        let image = UIImage(systemName: "arrow.left")
        button.setImage(image?.withTintColor(.gray, renderingMode: .alwaysTemplate), for: .normal)
        button.tintColor = .gray
        return button
    }()
    
    private lazy var accountLabel: UILabel = {
        var label = UILabel(frame: CGRect(x: 0, y: 0, width: 150, height: 100))
//        imageHeader.hnk_setImage(from: URL(string: url))
        label.text = "ACCOUNT"
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        return label
    }()
    
    lazy var accountTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(ProfileTableViewCell.self,
                           forCellReuseIdentifier: ProfileTableViewCell.identifier)
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        tableView.frame = frame
        tableView.rowHeight = ProfileTableViewCell.rowHeight
        tableView.backgroundColor = .white
        return tableView
    }()
    
    lazy var endSessionButton: UIButton = {
      let button = UIButton()
        button.setTitle("END SESSION", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        button.setTitleColor(UIColor.black, for: .normal)
        button.backgroundColor = .white
        button.layer.borderWidth = 1
        button.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 0)
        return button
    }()
    
    func setupViews() {
        addSubview(backButton)
        addSubview(accountTableView)
    }
    
    func setupLayout() {
        
        backButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(15)
            make.height.width.equalTo(45)
            make.top.equalToSuperview().inset(70)
        }
    
        accountTableView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(100)
            make.trailing.equalToSuperview()
            make.leading.equalToSuperview().inset(30)
            make.bottom.equalToSuperview()
        }
        

    }
    
    
}

//
//  LoginView.swift
//  ShoppingApp
//
//  Created by AliEren on 9.07.2022.
//

import Foundation
import UIKit
import SnapKit

final class LoginView: UIView, Layoutable {
    var preferredSpacing: CGFloat = 0.0
    
    private lazy var loginViewContainer: UIView = {
       let view = UIView()
        view.addSubview(logoImageView)
        view.addSubview(loginLabel)
        view.addSubview(usernameTextField)
        view.addSubview(passwordTextField)
        view.addSubview(signUpButton)
        view.addSubview(forgotPassword)
        return view
    }()
    
    private lazy var logoImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "zara_logo")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var loginLabel: UILabel = {
       let label = UILabel()
        label.text = "LOG IN"
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        return label
    }()
        
    let usernameTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "EMAIL"
        tf.autocapitalizationType = UITextAutocapitalizationType.none
        tf.borderStyle = .roundedRect
        tf.backgroundColor = UIColor(white: 0, alpha: 0.1)
        return tf
        
    }()
    
    let passwordTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "PASSWORD"
        tf.isSecureTextEntry = true
        tf.borderStyle = .roundedRect
        tf.backgroundColor = UIColor(white: 0, alpha: 0.1)
        return tf
        
    }()
    
    let signUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 3
        button.backgroundColor = UIColor.black
        return button
    }()
    
    let registerButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Register", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 3
        button.backgroundColor = UIColor.gray
        return button
    }()
    
    let forgotPassword: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("HAVE YOU FORGOTTEN YOUR PASSWORD?", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 10, weight: .semibold)
        button.titleLabel?.textAlignment = .left
        button.backgroundColor = UIColor.white
        return button
    }()

    
    func setupViews() {
        addSubview(loginViewContainer)
        
    }
    
    func setupLayout() {
        loginViewContainer.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        logoImageView.snp.makeConstraints { make in
            make.height.equalTo(70)
            make.width.equalTo(180)
            make.leading.equalToSuperview().inset(60)
            make.top.equalToSuperview().inset(60)
        }

        loginLabel.snp.makeConstraints { make in
            make.top.equalTo(logoImageView.snp.bottom).offset(10)
            make.leading.equalToSuperview().inset(65)
            make.height.equalTo(50)
        }

        usernameTextField.snp.makeConstraints { make in
            make.top.equalTo(loginLabel.snp.bottom).offset(50)
            make.leading.equalToSuperview().inset(65)
            make.trailing.equalToSuperview().inset(20)
            make.height.equalTo(50)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(usernameTextField.snp.bottom).offset(50)
            make.leading.equalToSuperview().inset(65)
            make.trailing.equalToSuperview().inset(20)
            make.height.equalTo(50)
        }
        
        signUpButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(50)
            make.leading.equalToSuperview().inset(65)
            make.trailing.equalToSuperview().inset(20)
            make.height.equalTo(50)
        }
        
        forgotPassword.snp.makeConstraints { make in
            make.top.equalTo(signUpButton.snp.bottom).offset(10)
            make.leading.equalToSuperview().inset(40)
            make.trailing.equalToSuperview().inset(20)
            make.height.equalTo(30)
        }
    }
}

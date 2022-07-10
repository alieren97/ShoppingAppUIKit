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
    
    
        
    let usernameTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Username"
        tf.autocapitalizationType = UITextAutocapitalizationType.none
        tf.borderStyle = .roundedRect
        tf.backgroundColor = UIColor(white: 0, alpha: 0.1)
        return tf
        
    }()
    
    let passwordTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Password"
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
        button.backgroundColor = UIColor.lightGray
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
    
    private lazy var stackView: UIStackView = {
       let stack = UIStackView(arrangedSubviews: [usernameTextField,passwordTextField,signUpButton,registerButton])
        stack.axis = .vertical
        stack.spacing = 10
        return stack
    }()
    
    func setupViews() {
        addSubview(stackView)
    }
    
    func setupLayout() {
        stackView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.width.equalToSuperview().inset(20)
        }
    }
}

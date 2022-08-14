//
//  LoginViewController.swift
//  ShoppingApp
//
//  Created by AliEren on 9.07.2022.
//

import Foundation
import UIKit
import SnapKit
import Alamofire

final class LoginViewController: UIViewController, Layouting {
    let defaults = UserDefaults.standard
    typealias ViewType = LoginView
    
    override func loadView() {
        view = ViewType.create()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layoutableView.signUpButton.addTarget(self, action: #selector(buttonDidTapped), for: .touchUpInside)
    }
    
    @objc func buttonDidTapped() {
        validateForm()
    }
    
    func validateForm() {
        guard let passwordText = layoutableView.passwordTextField.text, !passwordText.isEmpty else { return }
        guard let usernameText = layoutableView.usernameTextField.text, !usernameText.isEmpty else { return }
         
         startSigningUp(password: passwordText, username: usernameText)
     }
     
     func startSigningUp(password: String, username: String) {
         let params: [String: Any] = [
             "username": username,
             "password": password
         ]
         
         AuthenticationManager.shared.login(params: params) { result in
             switch result {
             case .success(let response):
                 self.defaults.setValue(response.accessToken, forKey: "token")
                 UserDefaultsManager.shared.updateUserData(response)
             case .failure(let error):
                print(error)
             }
         }

     }
    
}

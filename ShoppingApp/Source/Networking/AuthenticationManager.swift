//
//  AuthenticationManager.swift
//  ShoppingApp
//
//  Created by AliEren on 10.07.2022.
//

import Foundation
import Alamofire
import UIKit

final class AuthenticationManager {
    static let shared = AuthenticationManager()
    var isAuthenticated = false
    static let loginApi = "\(NetworkManager.baseURL)auth/login"
    static let registerApi = "\(NetworkManager.baseURL)auth/register"
    
    func login(params: Parameters,completion: @escaping (Result<User, Error>) -> Void ) {
        AF.request(AuthenticationManager.loginApi, method: .post, parameters: params,encoding: JSONEncoding.default).responseDecodable(of: User.self) { response in
            switch response.result {
            case .success:
                if let value = response.value {
                    completion(.success(value))
                    
                }
            case .failure(let error):
                completion(.failure(error))
                
            }
        }
    }
    
    func register(params: Parameters,completion: @escaping (Result<User, Error>) -> Void ) {
        AF.request(AuthenticationManager.registerApi, method: .post, parameters: params,encoding: JSONEncoding.default).responseDecodable(of: User.self) { response in
            switch response.result {
            case .success:
                if let value = response.value {
                    completion(.success(value))
                }
            case .failure(let error):
                completion(.failure(error))
                
            }
        }
    }
    
}

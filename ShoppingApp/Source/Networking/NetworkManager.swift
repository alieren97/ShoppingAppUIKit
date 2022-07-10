//
//  NetworkManager.swift
//  ShoppingApp
//
//  Created by AliEren on 5.07.2022.
//

import Foundation
import Alamofire

final class NetworkManager {
    static let shared = NetworkManager()
    static let baseURL = "http://localhost:3000/api/"
    
    
    static let productApi = "\(NetworkManager.baseURL)products?categories="
    static let categoryApi = "\(NetworkManager.baseURL)category"

    
    func fetchProducts(categoryId: String,completion: @escaping (Result<Products, Error>) -> Void ) {
        //        let headers: HTTPHeaders = [.authorization(bearerToken: "token")]
        let url = NetworkManager.productApi + categoryId
        AF.request(url).responseDecodable(of: Products.self) { response in
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
    
    func fetchCategories(completion: @escaping (Result<Categories, Error>) -> Void ) {
        AF.request(NetworkManager.categoryApi).responseDecodable(of: Categories.self) { response in
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





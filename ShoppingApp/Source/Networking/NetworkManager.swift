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
    static let categoryApi = "\(NetworkManager.baseURL)category?gender="
    static let purchasesApi = "\(NetworkManager.baseURL)orders/find/62c6c6ca91b67e3fd859ed79"
    
    
    func fetchProducts(categoryId: String,completion: @escaping (Result<Products, Error>) -> Void ) {
        //        let headers: HTTPHeaders = [.authorization(bearerToken: "token")]
        let url = NetworkManager.productApi + categoryId
        AF.request(url).responseDecodable(of: Products.self) { response in
            print(response)
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
    
    func fetchCategories(gender: String,completion: @escaping (Result<Categories, Error>) -> Void ) {
        AF.request(NetworkManager.categoryApi + gender).responseDecodable(of: Categories.self) { response in
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
    
    func fetchPurchases(completion: @escaping (Result<Orders, Error>) -> Void ) {
        let token = UserDefaults.standard.string(forKey: "token") ?? ""
        
        let headers: HTTPHeaders = [
            "token": "Bearer "+"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYyYzZjNmNhOTFiNjdlM2ZkODU5ZWQ3OSIsImlzQWRtaW4iOnRydWUsImlhdCI6MTY1NzgwNDM2MCwiZXhwIjoxNjU4MDYzNTYwfQ.CNRKuqmn8QVIAq059dYlfl8luHVX0ZlqOUi0NmXNBnk"
        ]
        
//        AF.request(NetworkManager.purchasesApi).responseDecodable(of: Orders.self) { response in
//            switch response.result {
//            case .success:
//                if let value = response.value {
//                    completion(.success(value.orders))
//                }
//            case .failure(let error):
//                completion(.failure(error))
//            }
//        }
        
        AF.request(NetworkManager.purchasesApi,
                   headers:headers).responseJSON{ response in
            
            switch response.result {
            case .success:
                if let data = response.data {
                    do {
                        let results = try JSONDecoder().decode(Orders.self, from: data)
//                        print(results)
                        completion(.success(results))
                    }catch let error as NSError{
                        print(error)
                    }

                }
            case .failure(let error):
                print("Error:", error)
                completion(.failure(error))
            }

        }
    }
}

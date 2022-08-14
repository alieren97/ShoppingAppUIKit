//
//  Order.swift
//  ShoppingApp
//
//  Created by AliEren on 14.07.2022.
//

//import Foundation
//
//// MARK: - Orders
//struct Orders: Codable {
//    let orders: [Order]
//
//    init(from decoder: Decoder) throws {
//         let values = try decoder.container(keyedBy: CodingKeys.self)
//        orders = try values.decode([Order].self, forKey: .orders)
//     }
//}
//
//// MARK: - Order
//struct Order: Codable {
//    let id, userID: String
//    let products: [ProductElement]
//    let amount: Int
//    let address, status, createdAt, updatedAt: String
//    let v: Int
//
//    enum CodingKeys: String, CodingKey {
//        case id = "_id"
//        case userID = "userId"
//        case products, amount, address, status, createdAt, updatedAt
//        case v = "__v"
//    }
//    init(from decoder: Decoder) throws {
//         let values = try decoder.container(keyedBy: CodingKeys.self)
//        id = try values.decode(String.self, forKey: .id)
//        userID = try values.decode(String.self, forKey: .userID)
//        products = try values.decode([ProductElement].self, forKey: .products)
//        amount = try values.decode(Int.self, forKey: .amount)
//        address = try values.decode(String.self, forKey: .address)
//        status = try values.decode(String.self, forKey: .status)
//        createdAt = try values.decode(String.self, forKey: .createdAt)
//        updatedAt = try values.decode(String.self, forKey: .updatedAt)
//        v = try values.decode(Int.self, forKey: .v)
//     }
//
//
//}
//
//// MARK: - ProductElement
//struct ProductElement: Codable {
//    let product: ProductList
//    let quantity: Int
//    let id: String
//
//
//    enum CodingKeys: String, CodingKey {
//        case product, quantity
//        case id = "_id"
//    }
//
//    init(from decoder: Decoder) throws {
//         let values = try decoder.container(keyedBy: CodingKeys.self)
//        id = try values.decode(String.self, forKey: .id)
//        quantity = try values.decode(Int.self, forKey: .quantity)
//        product = try values.decode(ProductList.self, forKey: .product)
//     }
//}

import Foundation

// MARK: - Orders
struct Orders: Codable {
    let orders: [Order]
}

// MARK: - Order
struct Order: Codable {
    let id, userID: String
    let products: [ProductElement]
    let amount: Int
    let address, status, createdAt, updatedAt: String
    let v: Int

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case userID = "userId"
        case products, amount, address, status, createdAt, updatedAt
        case v = "__v"
    }
    func getOrderImageLists() -> [String] {
        var array = [String]()
        for pro in products {
//            array.append(contentsOf: pro.product.getOneImage())
            array.append(pro.product.getOneImage())
//            print("\(array.count) \(array)")
        }
        return array
    }
}

// MARK: - ProductElement
struct ProductElement: Codable {
    let product: ProductProduct
    let quantity: Int
    let id: String

    enum CodingKeys: String, CodingKey {
        case product, quantity
        case id = "_id"
    }
//
//    func getImageList() -> [String] {
//        var array = [String]()
//        array.append(self.product.getOneImage())
//        return array
//    }
}

// MARK: - ProductProduct
struct ProductProduct: Codable {
    let id, title, desc: String
    let img: [String]
    let category: String
    let size: [Size]
    let price: Double
    let gender, createdAt, updatedAt: String
    let v: Int

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case title, desc, img, category, size, price, gender, createdAt, updatedAt
        case v = "__v"
    }
    
    func getOneImage() -> String {
        return self.img[0]
      }
    
}

enum Size: String, Codable {
    case l = "l"
    case m = "m"
    case s = "s"
    case xl = "xl"
}

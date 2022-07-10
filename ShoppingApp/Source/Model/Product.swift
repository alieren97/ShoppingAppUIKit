//
//  NetworkProduct.swift
//  ShoppingApp
//
//  Created by AliEren on 5.07.2022.
//

import Foundation

// MARK: - Products
struct Products: Codable {
    let count: Int
    let productList: [ProductList]
}

// MARK: - ProductList
struct ProductList: Codable {
    let id, title, desc: String
    let img: [String]
    let category: Category
    let size: [String]
    let price: Float
    let gender, createdAt, updatedAt: String
    let v: Int

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case title, desc, img, category, size, price, gender, createdAt, updatedAt
        case v = "__v"
    }
}

struct Categories: Codable {
    let categories: [Category]
}

// MARK: - Category
struct Category: Codable {
    let id, name: String
    let v: Int

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name
        case v = "__v"
    }
}

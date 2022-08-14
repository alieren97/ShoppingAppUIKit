//
//  User.swift
//  ShoppingApp
//
//  Created by AliEren on 9.07.2022.
//

import Foundation

struct User: Codable {
    let id, username, email: String
    let isAdmin: Bool
    let createdAt, updatedAt: String
    let v: Int
    let accessToken: String

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case username, email, isAdmin, createdAt, updatedAt
        case v = "__v"
        case accessToken
    }
}

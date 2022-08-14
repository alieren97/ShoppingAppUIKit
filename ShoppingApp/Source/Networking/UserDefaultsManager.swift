//
//  UserDefaultsManager.swift
//  ShoppingApp
//
//  Created by AliEren on 15.07.2022.
//

import Foundation

final class UserDefaultsManager {
    
    static let shared = UserDefaultsManager()
    static let key = "cartProducts"
    static let userKey = "userInformation"
    
    var isFavorite: Bool = false
    
    func updateCartProducts(_ cartProducts: [Cart]) {
        guard let data = try? JSONEncoder().encode(cartProducts) else { return }
        UserDefaults.standard.set(data, forKey: UserDefaultsManager.key)
    }
    
    func loadCartProducts() -> [Cart] {
        guard let data = UserDefaults.standard.data(forKey: UserDefaultsManager.key),
            let cart = try? JSONDecoder().decode([Cart].self, from: data)
        else { return  [] }
        return cart
    }
    
    func updateUserData(_ user: User) {
        guard let data = try? JSONEncoder().encode(user) else { return }
        UserDefaults.standard.set(data, forKey: UserDefaultsManager.userKey)
    }
    
    func getUserData() -> User? {
        guard let data = UserDefaults.standard.data(forKey: UserDefaultsManager.userKey),
            let user = try? JSONDecoder().decode(User.self, from: data)
        else { return nil }
        return user
    }
    
//    func checkFavorite(selectedMovieID: String) {
//        for movie in loadFavoriteMovies() {
//            if movie.model.imdbID == selectedMovieID {
//                isFavorite = true
//            } else {
//                isFavorite = false
//            }
//        }
//    }
//
//    func check24H() {
//        var favMovies = loadFavoriteMovies()
//        for movie in favMovies {
//            if let diff = Calendar.current.dateComponents([.hour], from: movie.time, to: Date()).hour, diff  >= 24 {
//                while favMovies.contains(movie) {
//                    if let itemToRemoveIndex = favMovies.firstIndex(of: movie) {
//                        favMovies.remove(at: itemToRemoveIndex)
//                        updateFavoriteMovies(movies: favMovies)
//                    }
//                }
//            }
//        }
//    }
}

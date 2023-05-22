//
//  BasketManager.swift
//  ArbuzApp
//
//  Created by Alikhan Gubayev on 22.05.2023.
//

import UIKit

struct BasketManager {
    static var basketProducts: [Product] = [] {
        didSet {
            
        }
    }
    
    static func addProductToBasket(_ product: Product) {
        basketProducts.append(product)
    }
    
    static func removeProductFromBasket(_ product: Product) {
        if let index = basketProducts.firstIndex(where: { $0.id == product.id }) {
            basketProducts.remove(at: index)
        }
    }
    
    static func clearBasket() {
        basketProducts.removeAll()
    }
}

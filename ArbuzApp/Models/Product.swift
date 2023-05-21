//
//  Product.swift
//  ArbuzApp
//
//  Created by Alikhan Gubayev on 21.05.2023.
//

import Foundation

struct Product: Codable {
    let name: String
    let price: Double
    let weight: Double?
    var isInStock: Bool
    let image: String
    
    public static let products: [Product] = [
        Product(name: "Арбуз", price: 3.99, weight: 3, isInStock: true, image: "watermelon"),
        Product(name: "Банан", price: 0.99, weight: 0.15, isInStock: true, image: "banana"),
        Product(name: "Апельсин", price: 1.49, weight: 0.3, isInStock: true, image: "orange"),
        
        Product(name: "Морковь", price: 0.79, weight: 0.2, isInStock: true, image: "carrot"),
        Product(name: "Помидор", price: 0.99, weight: 0.1, isInStock: true, image: "tomato"),
        Product(name: "Огурец", price: 0.69, weight: 0.3, isInStock: true, image: "cucumber"),
        
        Product(name: "Молоко", price: 1.99, weight: 1.0, isInStock: true, image: "milk"),
        Product(name: "Йогурт", price: 0.99, weight: 0.2, isInStock: true, image: "yogurt"),
        Product(name: "Сыр", price: 2.49, weight: 0.5, isInStock: true, image: "cheese"),
    ]
}

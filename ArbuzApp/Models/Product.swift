//
//  Product.swift
//  ArbuzApp
//
//  Created by Alikhan Gubayev on 21.05.2023.
//

import Foundation

struct Product: Codable {
    var id = UUID()
    let name: String
    let price: Double
    let weight: Double?
    var isInStock: Bool
    let image: String
    
    public static let products: [Product] = [
        Product(name: "Арбуз", price: 1795.5, weight: 3, isInStock: true, image: "watermelon"),
        Product(name: "Банан", price: 445.5, weight: 0.15, isInStock: true, image: "banana"),
        Product(name: "Апельсин", price: 670.5, weight: 0.3, isInStock: true, image: "orange"),
        
        Product(name: "Морковь", price: 355.5, weight: 0.2, isInStock: true, image: "carrot"),
        Product(name: "Помидор", price: 445.5, weight: 0.1, isInStock: true, image: "tomato"),
        Product(name: "Огурец", price: 310.5, weight: 0.3, isInStock: true, image: "cucumber"),
        
        Product(name: "Молоко", price: 895.5, weight: 1.0, isInStock: true, image: "milk"),
        Product(name: "Йогурт", price: 445.5, weight: 0.2, isInStock: true, image: "yogurt"),
        Product(name: "Сыр", price: 1120.5, weight: 0.5, isInStock: true, image: "cheese"),
    ]
}

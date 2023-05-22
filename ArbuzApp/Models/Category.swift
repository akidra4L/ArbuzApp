//
//  Category.swift
//  ArbuzApp
//
//  Created by Alikhan Gubayev on 21.05.2023.
//

import Foundation

struct Category: Codable, Equatable {
    let title: String
    let image: String
    var products: [Product]
    
    public static let categories: [Category] = [
        Category(title: "Фрукты", image: "fruits",
                 products: [Product.products[0], Product.products[1], Product.products[2]]),
        
        Category(title: "Овощи", image: "vegetables",
                 products: [Product.products[3], Product.products[4], Product.products[5]]),
        
        Category(title: "Молочные продукты", image: "milkproducts",
                 products: [Product.products[6], Product.products[7], Product.products[8]]),
    ]
}

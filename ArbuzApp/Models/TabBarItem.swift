//
//  TabBarItem.swift
//  ArbuzApp
//
//  Created by Alikhan Gubayev on 20.05.2023.
//

import UIKit

struct TabBarItem {
    var title: String
    var controller: UINavigationController
    var icon: String
    
    public static var tabBarItems: [TabBarItem] = [
        TabBarItem(title: "Поиск", controller: tabBarControllers[0], icon: "magnifyingglass"),
        TabBarItem(title: "Корзина", controller: tabBarControllers[1], icon: "basket")
    ]
    
    public static var tabBarControllers: [UINavigationController] = [
        UINavigationController(rootViewController: SubscriptionViewController()),
        UINavigationController(rootViewController: BasketViewController())
    ]
}

//
//  TabBarItem.swift
//  ArbuzApp
//
//  Created by Alikhan Gubayev on 20.05.2023.
//

import UIKit

struct TabBarItem {
    var controller: UINavigationController
    var icon: String
    
    public static var tabBarItems: [TabBarItem] = [
        TabBarItem(controller: tabBarControllers[0], icon: "house"),
        TabBarItem(controller: tabBarControllers[1], icon: "basket")
    ]
    
    public static var tabBarControllers: [UINavigationController] = [
        UINavigationController(rootViewController: SubscriptionViewController()),
        UINavigationController(rootViewController: BasketViewController())
    ]
}

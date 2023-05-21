//
//  MainViewController.swift
//  ArbuzApp
//
//  Created by Alikhan Gubayev on 21.05.2023.
//

import UIKit

class MainViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setInitialSettings()
    }
    
    private func setInitialSettings() {
        self.setViewControllers(TabBarItem.tabBarControllers, animated: false)
        
        guard let items = self.tabBar.items else { return }
        
        for i in 0...1 {
            items[i].image = UIImage(systemName: TabBarItem.tabBarItems[i].icon)
        }
        self.tabBar.tintColor = UIColor(named: "Accent")
    }
}

//
//  BasketViewController.swift
//  ArbuzApp
//
//  Created by Alikhan Gubayev on 21.05.2023.
//

import UIKit

class BasketViewController: UIViewController {
    
    private var basketProducts: [Product] = BasketManager.basketProducts
    
    init() {
        super.init(nibName: nil, bundle: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(productAddedToBasket(_:)), name: .productAddedToBasketNotification, object: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = Colors.mainBackground
    }
    
    @objc private func productAddedToBasket(_ notification: Notification) {
        if let product = notification.userInfo?["product"] as? Product {
            basketProducts.append(product)
        }
    }
}

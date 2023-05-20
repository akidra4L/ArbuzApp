//
//  SubscriptionViewController.swift
//  ArbuzApp
//
//  Created by Alikhan Gubayev on 20.05.2023.
//

import UIKit

class SubscriptionViewController: UIViewController {
    
    private var userAddressText: String = "улица Пушкина 77" {
        didSet {
            navigationItem.rightBarButtonItem?.title = userAddressText
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        customBackButton()
        setupNavigationBar()
    }
    
    private func customBackButton() {
        let backButton = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = backButton
    }
    
    private func setupNavigationBar() {
        let logoImageView = UIImageView(image: UIImage(named: "logo"))
        logoImageView.setDimensions(width: 144, height: 40)
        let logoBarButtonItem = UIBarButtonItem(customView: logoImageView)
        
        let addressButton = UIBarButtonItem(title: userAddressText, style: .plain, target: self, action: #selector(addressButtonTapped))
        addressButton.tintColor = .black.withAlphaComponent(0.7)
        
        navigationItem.leftBarButtonItem = logoBarButtonItem
        navigationItem.rightBarButtonItem = addressButton
    }
    
    @objc private func addressButtonTapped() {
        let editAddressViewController = EditAddressViewController()
        editAddressViewController.delegate = self
        self.navigationController?.present(editAddressViewController, animated: true)
    }
}

extension SubscriptionViewController: EditAddressDelegate {
    
    func editUserAddress(newAddress: String) {
        self.userAddressText = newAddress
    }
}

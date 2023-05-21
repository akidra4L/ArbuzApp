//
//  SubscriptionViewController.swift
//  ArbuzApp
//
//  Created by Alikhan Gubayev on 20.05.2023.
//

import UIKit

class SubscriptionViewController: UIViewController {
    
    private var categories: [Category] = Category.categories
    
    private var userAddressText: String = "улица Пушкина 77" {
        didSet {
            navigationItem.rightBarButtonItem?.title = userAddressText
        }
    }
    
    private let categoriesTableView: UITableView = {
        let tv = UITableView()
        tv.separatorStyle = .none
        return tv
    } ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = Colors.mainBackground
        
        customBackButton()
        setupNavigationBar()
        setConstraints()
        setupTableView()
    }
    
    private func customBackButton() {
        let backButton = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = backButton
    }
    
    private func setConstraints() {
        [categoriesTableView].forEach { self.view.addSubview($0) }
        
        categoriesTableView.anchor(top: self.view.topAnchor, right: self.view.rightAnchor, bottom: self.view.bottomAnchor, left: self.view.leftAnchor, paddingTop: 180, paddingRight: 16, paddingLeft: 16)
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
    
    private func setupTableView() {
        categoriesTableView.delegate = self
        categoriesTableView.dataSource = self
        categoriesTableView.register(CategoryCell.self, forCellReuseIdentifier: CategoryCell.categoryIdentifier)
    }
    
    @objc private func addressButtonTapped() {
        let editAddressViewController = EditAddressViewController()
        editAddressViewController.address = userAddressText
        editAddressViewController.delegate = self
        self.navigationController?.present(editAddressViewController, animated: true)
    }
}

extension SubscriptionViewController: EditAddressDelegate {
    
    func editUserAddress(newAddress: String) {
        self.userAddressText = newAddress
    }
}

extension SubscriptionViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CategoryCell.categoryIdentifier, for: indexPath) as? CategoryCell else { return UITableViewCell() }
        
        cell.category = categories[indexPath.row]
        
        return cell
    }
}

extension SubscriptionViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let productsViewController = ProductsViewController()
        productsViewController.products = categories[indexPath.row].products
        
        self.navigationController?.pushViewController(productsViewController, animated: true)
        
        categoriesTableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

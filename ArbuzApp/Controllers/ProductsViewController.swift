//
//  ProductsViewController.swift
//  ArbuzApp
//
//  Created by Alikhan Gubayev on 21.05.2023.
//

import UIKit

class ProductsViewController: UIViewController {
    
    public var products: [Product] = [] {
        didSet {
            productsTableView.reloadData()
        }
    }
    
    private let productsTableView: UITableView = {
        let tv = UITableView()
        tv.separatorStyle = .none
        return tv
    } ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = Colors.mainBackground
        
        setConstraints()
        setupTableView()
    }
    
    private func setConstraints() {
        [productsTableView].forEach { self.view.addSubview($0) }
        
        productsTableView.anchor(top: self.view.topAnchor, right: self.view.rightAnchor, bottom: self.view.bottomAnchor, left: self.view.leftAnchor, paddingTop: 100, paddingRight: 16, paddingLeft: 16)
    }
    
    private func setupTableView() {
        productsTableView.delegate = self
        productsTableView.dataSource = self
        productsTableView.register(ProductCell.self, forCellReuseIdentifier: ProductCell.productIdentifier)
    }
}

extension ProductsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("click product")
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 84
    }
}

extension ProductsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ProductCell.productIdentifier, for: indexPath) as? ProductCell else { return UITableViewCell() }
        
        cell.product = products[indexPath.row]
        
        return cell
    }
}

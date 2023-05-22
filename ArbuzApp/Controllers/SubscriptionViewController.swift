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
    
    private let categoriesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = Colors.mainBackground
        
        customBackButton()
        setupNavigationBar()
        setConstraints()
        setupCollectionView()
    }
    
    private func customBackButton() {
        let backButton = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = backButton
    }
    
    private func setConstraints() {
        view.addSubview(categoriesCollectionView)
        
        categoriesCollectionView.anchor(top: self.view.topAnchor, right: self.view.rightAnchor, bottom: self.view.bottomAnchor, left: self.view.leftAnchor, paddingTop: 150, paddingRight: 8, paddingLeft: 8)
    }
    
    private func setupNavigationBar() {
        let logoImageView = UIImageView(image: UIImage(named: "logo"))
        logoImageView.setDimensions(width: 144, height: 36)
        let logoBarButtonItem = UIBarButtonItem(customView: logoImageView)
        
        let addressButton = UIBarButtonItem(title: userAddressText, style: .plain, target: self, action: #selector(addressButtonTapped))
        addressButton.tintColor = .black.withAlphaComponent(0.7)
        
        navigationItem.leftBarButtonItem = logoBarButtonItem
        navigationItem.rightBarButtonItem = addressButton
    }
    
    private func setupCollectionView() {
        categoriesCollectionView.delegate = self
        categoriesCollectionView.dataSource = self
        categoriesCollectionView.register(CategoryCell.self, forCellWithReuseIdentifier: CategoryCell.categoryIdentifier)
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

extension SubscriptionViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCell.categoryIdentifier, for: indexPath) as? CategoryCell else {
            return UICollectionViewCell()
        }
        
        cell.category = categories[indexPath.item]
        
        return cell
    }
}

extension SubscriptionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width - 32
        return CGSize(width: width, height: 280)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 16, left: 0, bottom: 16, right: 0)
    }
}

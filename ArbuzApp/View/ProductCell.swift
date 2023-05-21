//
//  ProductCell.swift
//  ArbuzApp
//
//  Created by Alikhan Gubayev on 21.05.2023.
//

import UIKit

class ProductCell: UICollectionViewCell {
    
    public static let productIdentifier = "ProductCell"
    public var product: Product? {
        didSet {
            guard let product = product else { return }
            productLabel.text = product.name
            productImage.image = UIImage(named: product.image)
            priceLabel.text = "\(product.price)₸"
        }
    }
    
    private var numberOfSelectedProduct: Int = 0 {
        didSet {
            selectedItemsNumberLabel.text = "\(numberOfSelectedProduct)"
        }
    }
    
    private var isProductSelected: Bool = false {
        didSet {
            if numberOfSelectedProduct > 0 {
                priceLabel.isHidden = true
                removeButton.isHidden = false
                selectedItemsNumberLabel.isHidden = false
                priceView.backgroundColor = Colors.buttonColor
                addButton.setTitleColor(.white, for: .normal)
                removeButton.setTitleColor(.white, for: .normal)
            } else {
                priceLabel.isHidden = false
                removeButton.isHidden = true
                selectedItemsNumberLabel.isHidden = true
                priceView.backgroundColor = Colors.itemGrayColor
                addButton.setTitleColor(Colors.buttonColor, for: .normal)
                removeButton.setTitleColor(Colors.buttonColor, for: .normal)
            }
        }
    }
    
    private let productLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.textAlignment = .center
        return label
    } ()
    
    private let productImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    } ()
    
    private let priceView: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.itemGrayColor
        view.layer.cornerRadius = 16
        return view
    } ()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textAlignment = .center
        return label
    } ()
    
    private let addButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("+", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 16)
        button.setTitleColor(Colors.buttonColor, for: .normal)
        button.layer.cornerRadius = 8
        return button
    } ()
    
    private let removeButton: UIButton = {
        let button = UIButton(type: .system)
        button.isHidden = true
        button.setTitle("-", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 16)
        button.setTitleColor(Colors.buttonColor, for: .normal)
        button.layer.cornerRadius = 8
        return button
    } ()
    
    private let selectedItemsNumberLabel: UILabel = {
        let label = UILabel()
        label.isHidden = true
        label.textColor = .white
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.textAlignment = .center
        return label
    } ()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        addButton.addTarget(self, action: #selector(handleAddProduct), for: .touchUpInside)
        removeButton.addTarget(self, action: #selector(handleRemoveProduct), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func handleAddProduct() {
        if numberOfSelectedProduct < 3 {
            guard let product = product else { return }
            BasketManager.addProductToBasket(product)
            NotificationCenter.default.post(name: .basketChangedNotification, object: nil, userInfo: ["product": product])
            numberOfSelectedProduct += 1
            isProductSelected = true
        }
    }
    
    @objc private func handleRemoveProduct() {
        guard let product = product else { return }
        BasketManager.removeProductFromBasket(product)
        NotificationCenter.default.post(name: .basketChangedNotification, object: nil, userInfo: ["product": product])
        numberOfSelectedProduct -= 1
        isProductSelected = false
    }
    
    private func setUI() {
        backgroundColor = .white
        layer.cornerRadius = 16
        
        [productImage, productLabel, priceView].forEach { self.addSubview($0) }
        [priceLabel, addButton, removeButton, selectedItemsNumberLabel].forEach { priceView.addSubview($0) }
        
        setConstraints()
    }
    
    private func setConstraints() {
        productImage.anchor(top: topAnchor, right: rightAnchor, left: leftAnchor)
        productImage.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.7).isActive = true
        
        productLabel.anchor(top: productImage.bottomAnchor, right: rightAnchor, left: leftAnchor, paddingTop: 8, paddingRight: 8, paddingLeft: 8)
        
        priceView.anchor(top: productLabel.bottomAnchor, right: rightAnchor, left: leftAnchor, paddingTop: 8, paddingRight: 8, paddingLeft: 8, height: 32)
        
        priceLabel.anchor(left: priceView.leftAnchor, paddingLeft: 16)
        priceLabel.centerY(in: priceView)
        
        addButton.anchor(right: priceView.rightAnchor, paddingRight: 8, width: 14, height: 14)
        addButton.centerY(in: priceView)
        
        removeButton.anchor(left: priceView.leftAnchor, paddingLeft: 8, width: 14, height: 14)
        removeButton.centerY(in: priceView)
        
        selectedItemsNumberLabel.centerInView(in: priceView)
    }
}

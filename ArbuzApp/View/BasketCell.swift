//
//  BasketCell.swift
//  ArbuzApp
//
//  Created by Alikhan Gubayev on 22.05.2023.
//

import UIKit

class BasketCell: UITableViewCell {
    
    public static let reuseIdentifier = "BasketCell"
    public var product: Product? {
        didSet {
            guard let product = product else { return }
            productLabel.text = product.name
            productImage.image = UIImage(named: product.image)
            priceLabel.text = "\(product.price) ₸"
        }
    }
    
    public var onDeleteButtonTapped: (() -> Void)?
    
    private let productLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 17, weight: .regular)
        return label
    } ()
    
    private let productImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    } ()
    
    private let separatorView: UIView = {
        let separatorView = UIView()
        separatorView.backgroundColor = .lightGray.withAlphaComponent(0.5)
        return separatorView
    } ()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textAlignment = .center
        return label
    } ()
    
    private lazy var deleteProductButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.tintColor = .black
        return button
    } ()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
        setActions()
        sendSubviewToBack(contentView)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUI()
        setActions()
    }
    
    private func setUI() {
        self.backgroundColor = .white
        
        [productLabel, productImage, separatorView, priceLabel, deleteProductButton].forEach { self.addSubview($0) }
        
        setConstraints()
    }
    
    private func setConstraints() {
        productImage.anchor(top: self.topAnchor, left: self.leftAnchor, paddingTop: 12, paddingLeft: 16, width: 84, height: 84)
        
        productLabel.anchor(top: self.topAnchor, left: productImage.rightAnchor, paddingTop: 24, paddingLeft: 16)
        
        separatorView.anchor(right: self.rightAnchor, bottom: self.bottomAnchor, left: self.leftAnchor, paddingRight: 16, paddingLeft: 16, height: 1)
        
        priceLabel.anchor(right: self.rightAnchor, bottom: self.bottomAnchor, paddingRight: 16, paddingBottom: 12)
        
        deleteProductButton.anchor(top: self.topAnchor, right: self.rightAnchor, paddingTop: 24, paddingRight: 16)
    }
    
    private func setActions() {
        deleteProductButton.addTarget(self, action: #selector(handleDeleteProduct), for: .touchUpInside)
    }
    
    @objc private func handleDeleteProduct() {
        onDeleteButtonTapped?()
    }
}

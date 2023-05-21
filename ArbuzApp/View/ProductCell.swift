//
//  ProductCell.swift
//  ArbuzApp
//
//  Created by Alikhan Gubayev on 21.05.2023.
//

import UIKit

class ProductCell: UITableViewCell {
    
    public static let productIdentifier = "ProductCell"
    public var product: Product? {
        didSet {
            guard let product = product else { return }
            productLabel.text = product.name
            productImage.image = UIImage(named: product.image)
        }
    }
    
    private let separatorView: UIView = {
        let separatorView = UIView()
        separatorView.backgroundColor = .lightGray.withAlphaComponent(0.5)
        return separatorView
    } ()
    
    private let productLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 24, weight: .regular)
        return label
    } ()
    
    private let productImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleToFill
        return image
    } ()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        self.backgroundColor = .white
        
        [separatorView, productLabel, productImage].forEach { self.addSubview($0) }
        setConstraints()
    }
    
    private func setConstraints() {
        productLabel.anchor(top: self.topAnchor, left: self.leftAnchor, paddingTop: 12, paddingLeft: 16)
        productLabel.centerY(in: self)
        
        productImage.anchor(top: self.topAnchor, right: self.rightAnchor, paddingTop: 12, paddingRight: 0, width: 64, height: 64)
        
        separatorView.anchor(right: self.rightAnchor, bottom: self.bottomAnchor, left: self.leftAnchor, paddingRight: 16, paddingLeft: 16, height: 1)
    }
}

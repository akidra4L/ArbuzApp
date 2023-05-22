//
//  EmptyBasketView.swift
//  ArbuzApp
//
//  Created by Alikhan Gubayev on 22.05.2023.
//

import UIKit

class EmptyBasketView: UIView {
    
    private let emptyBasketImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "emptybasket")!)
        return image
    } ()
    
    private let emptyBasketTitle: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22, weight: .semibold)
        label.textAlignment = .center
        label.text = "Ваша корзина пока пуста"
        return label
    } ()
    
    private let emptyBasketText: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.textAlignment = .center
        label.text = "Здесь будут лежать товары для покупки"
        return label
    } ()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        [emptyBasketImage, emptyBasketTitle, emptyBasketText].forEach { self.addSubview($0) }
        
        setConstraints()
    }
    
    private func setConstraints() {
        emptyBasketImage.setDimensions(width: 162, height: 162)
        emptyBasketImage.centerInView(in: self)
        
        emptyBasketTitle.anchor(top: emptyBasketImage.bottomAnchor, right: self.rightAnchor, left: self.leftAnchor, paddingTop: 16, paddingRight: 12, paddingLeft: 12)
        
        emptyBasketText.anchor(top: emptyBasketTitle.bottomAnchor, right: self.rightAnchor, left: self.leftAnchor, paddingTop: 16, paddingRight: 12, paddingLeft: 12)
    }
}

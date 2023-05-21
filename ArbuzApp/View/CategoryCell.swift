//
//  CategoryCell.swift
//  ArbuzApp
//
//  Created by Alikhan Gubayev on 21.05.2023.
//

import UIKit

class CategoryCell: UITableViewCell {
    
    public static let categoryIdentifier = "CategoryCell"
    public var category: Category? {
        didSet {
            guard let category = category else { return }
            categoryLabel.text = category.title
            categoryImage.image = UIImage(named: category.image)
        }
    }
    
    private let separatorView: UIView = {
        let separatorView = UIView()
        separatorView.backgroundColor = .lightGray.withAlphaComponent(0.5)
        return separatorView
    } ()
    
    private let categoryLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 24, weight: .regular)
        return label
    } ()
    
    private let categoryImage: UIImageView = {
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
        
        [separatorView, categoryLabel, categoryImage].forEach { self.addSubview($0) }
        setConstraints()
    }
    
    private func setConstraints() {
        categoryLabel.anchor(top: self.topAnchor, left: self.leftAnchor, paddingTop: 12, paddingLeft: 16)
        categoryLabel.centerY(in: self)
        
        categoryImage.anchor(top: self.topAnchor, right: self.rightAnchor, paddingTop: 12, paddingRight: 0, width: 84, height: 84)
        
        separatorView.anchor(right: self.rightAnchor, bottom: self.bottomAnchor, left: self.leftAnchor, paddingRight: 16, paddingLeft: 16, height: 1)
    }
}

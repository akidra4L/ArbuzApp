//
//  CustomButton.swift
//  ArbuzApp
//
//  Created by Alikhan Gubayev on 23.05.2023.
//

import UIKit

class CustomButton: UIButton {
    
    init() {
        super.init(frame: .zero)
        self.backgroundColor = Colors.buttonColor?.withAlphaComponent(0.8)
        self.layer.cornerRadius = 12
        self.titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
        self.titleLabel?.numberOfLines = 2
        self.titleLabel?.textAlignment = .center
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

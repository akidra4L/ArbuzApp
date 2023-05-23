//
//  SuccessOrderViewController.swift
//  ArbuzApp
//
//  Created by Alikhan Gubayev on 23.05.2023.
//

import UIKit

class SuccessOrderViewController: UIViewController {
    
    private let successImageView: UIImageView = {
        let image = UIImage(named: "success")
        let imageView = UIImageView(image: image!)
        imageView.contentMode = .scaleAspectFit
        return imageView
    } ()
    
    private let successLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 24, weight: .medium)
        label.text = "Ваш заказ успешно создан!"
        return label
    } ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = Colors.mainBackground
        
        setUI()
    }
    
    private func setUI() {
        [successImageView, successLabel].forEach { self.view.addSubview($0) }
        
        setConstraints()
    }
    
    private func setConstraints() {
        successImageView.centerInView(in: self.view)
        
        successLabel.anchor(top: successImageView.bottomAnchor, paddingTop: 16)
        successLabel.centerX(in: self.view)
    }
}

//
//  OrderDetailViewController.swift
//  ArbuzApp
//
//  Created by Alikhan Gubayev on 23.05.2023.
//

import UIKit

class OrderDetailViewController: UIViewController {
    
    public var totalSum: Double? {
        didSet {
            guard let totalSum = totalSum else { return }
            registerOrderButton.setTitle("Оплатить\n\(totalSum)₸", for: .normal)
        }
    }
    
    private let enterLabel: UILabel = {
        let label = UILabel()
        label.text = "Введите данные доставки"
        label.font = .boldSystemFont(ofSize: 18)
        label.numberOfLines = 0
        return label
    } ()
    
    private var closeButton: UIButton = {
        var button = UIButton()
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        return button
    } ()
    
    private let registerOrderButton = CustomButton()
    private let streetTextField = CustomTextField(placeholder: "Улица")
    private let homeTextField = CustomTextField(placeholder: "Номер дома")
    private let homeNumberTextField = CustomTextField(placeholder: "Подъезд")
    private let flatNumberTextField = CustomTextField(placeholder: "№ квартиры")
    private let clientNameTextField = CustomTextField(placeholder: "Ваше имя")
    private let phoneTextField = CustomTextField(placeholder: "Введите номер телефона")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = Colors.mainBackground
        
        setActions()
        setUI()
    }
    
    private func setActions() {
        registerOrderButton.addTarget(self, action: #selector(payOrder), for: .touchUpInside)
        
        closeButton.addTarget(self, action: #selector(closeBottomSheet), for: .touchUpInside)
    }
    
    private func setUI() {
        [closeButton, registerOrderButton, enterLabel, streetTextField, homeTextField, homeNumberTextField, flatNumberTextField, clientNameTextField, phoneTextField].forEach { self.view.addSubview($0) }
        
        setConstraints()
    }
    
    private func setConstraints() {
        closeButton.anchor(top: self.view.topAnchor, right: self.view.rightAnchor, paddingTop: 50, paddingRight: 16)
        
        registerOrderButton.anchor(right: self.view.rightAnchor, bottom: self.view.bottomAnchor, left: self.view.leftAnchor, paddingRight: 16, paddingBottom: 50, paddingLeft: 16, height: 62)
        
        enterLabel.anchor(top: self.view.topAnchor, paddingTop: 50)
        enterLabel.centerX(in: self.view)
        
        streetTextField.anchor(top: enterLabel.bottomAnchor, right: self.view.rightAnchor, left: self.view.leftAnchor, paddingTop: 32, paddingRight: 16, paddingLeft: 16, height: 50)
        
        homeTextField.anchor(top: streetTextField.bottomAnchor, left: self.view.leftAnchor, paddingTop: 12, paddingLeft: 16, width: Size.screenWidth / 3.3, height: 50)
        
        flatNumberTextField.anchor(top: streetTextField.bottomAnchor, right: self.view.rightAnchor, paddingTop: 12, paddingRight: 16, width: Size.screenWidth / 3.3, height: 50)
        
        homeNumberTextField.anchor(top: streetTextField.bottomAnchor, right: flatNumberTextField.leftAnchor, left: homeTextField.rightAnchor, paddingTop: 12, paddingRight: 8, paddingLeft: 8, height: 50)
        
        clientNameTextField.anchor(top: homeTextField.bottomAnchor, right: self.view.rightAnchor, left: self.view.leftAnchor, paddingTop: 12, paddingRight: 16, paddingLeft: 16, height: 50)
        
        phoneTextField.anchor(top: clientNameTextField.bottomAnchor, right: self.view.rightAnchor, left: self.view.leftAnchor, paddingTop: 12, paddingRight: 16, paddingLeft: 16, height: 50)
    }
    
    @objc private func payOrder() {
        if isOrderValid() {
            let successViewController = SuccessOrderViewController()
            self.navigationController?.present(successViewController, animated: true)
        }
    }
    
    @objc private func closeBottomSheet() {
        dismiss(animated: true, completion: nil)
    }
}

extension OrderDetailViewController {
    
    private func showAlert(with text: String, message: String = "") {
        let alert = UIAlertController(title: text, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Хорошо", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    private func isNumeric(_ string: String) -> Bool {
        return Double(string) != nil
    }
    
    private func isOrderValid() -> Bool {
        var isValid = true
        
        [streetTextField.text, homeNumberTextField.text, flatNumberTextField.text, clientNameTextField.text, phoneTextField.text].forEach {
            if ($0 ?? "").isEmpty {
                showAlert(with: "Введите все поля")
                isValid = false
            }
        }
        
        if !isValid { return false }
        
        if let homeNumber = homeTextField.text, !isNumeric(homeNumber) {
            showAlert(with: "Неправильный номер дома", message: "Номер дома должен быть числом")
            return false
        }
        
        if let homeNumber = homeNumberTextField.text, !isNumeric(homeNumber) {
            showAlert(with: "Неправильный подъезд", message: "Номер подъезда должен быть числом")
            return false
        }
        
        if let flatNumber = flatNumberTextField.text, !isNumeric(flatNumber) {
            showAlert(with: "Неправильный номер квартиры", message: "Номер квартиры должен быть числом")
            return false
        }
        
        if let phone = phoneTextField.text, phone.count != 11 {
            showAlert(with: "Неправильный номер телефона", message: "Номер телефона должен содержать 11 цифр")
            return false
        }
        
        return isValid
    }
}

//
//  EditAddressViewController.swift
//  ArbuzApp
//
//  Created by Alikhan Gubayev on 20.05.2023.
//

import UIKit

protocol EditAddressDelegate {
    func editUserAddress(newAddress: String)
}

class EditAddressViewController: UIViewController {
    
    var delegate: EditAddressDelegate?
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Адрес доставки"
        label.font = .systemFont(ofSize: 18)
        return label
    } ()
    
    private var backgroundView: UIView = {
        let background = UIView()
        background.backgroundColor = .white
        background.layer.cornerRadius = 12
        return background
    } ()
    
    private var closeButton: UIButton = {
        var button = UIButton()
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        return button
    } ()
    
    private let addressLabel: UILabel = {
        let label = UILabel()
        label.text = "Адрес"
        label.font = .systemFont(ofSize: 16)
        label.textColor = .lightGray
        return label
    } ()
    
    private let addressTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        return textField
    } ()
    
    private let saveButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = Colors.buttonColor
        button.layer.cornerRadius = 16
        button.setTitle("Сохранить", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16)
        return button
    } ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        makeInitialSettings()
        setUI()
    }
    
    private func makeInitialSettings() {
        self.view.backgroundColor = .clear
        self.navigationController?.navigationBar.isHidden = true
        
        closeButton.addTarget(self, action: #selector(closeBottomSheet), for: .touchUpInside)
        saveButton.addTarget(self, action: #selector(saveButtonTaped), for: .touchUpInside)
    }
    
    private func setUI() {
        [backgroundView, titleLabel, closeButton, addressLabel, addressTextField, saveButton].forEach { self.view.addSubview($0) }
        
        backgroundView.anchor(right: view.rightAnchor, bottom: view.bottomAnchor, left: view.leftAnchor, paddingRight: 0, paddingBottom: 0, paddingLeft: 0, height: 212)
        
        titleLabel.anchor(top: backgroundView.topAnchor, paddingTop: 16)
        titleLabel.centerX(in: backgroundView)
        
        closeButton.anchor(top: backgroundView.topAnchor, right: backgroundView.rightAnchor, paddingTop: 16, paddingRight: 16)
        
        addressLabel.anchor(top: titleLabel.bottomAnchor, left: backgroundView.leftAnchor, paddingTop: 16, paddingLeft: 16)
        
        addressTextField.anchor(top: addressLabel.bottomAnchor, left: backgroundView.leftAnchor, paddingTop: 12, paddingLeft: 16, width: 250)
        
        saveButton.anchor(top: addressTextField.bottomAnchor, paddingTop: 32, width: 100, height: 32)
        saveButton.centerX(in: backgroundView)
    }
    
    @objc private func closeBottomSheet() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc private func saveButtonTaped() {
        let newAddress = addressTextField.text ?? ""
        delegate?.editUserAddress(newAddress: newAddress)
        dismiss(animated: true, completion: nil)
    }
}

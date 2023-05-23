//
//  BasketViewController.swift
//  ArbuzApp
//
//  Created by Alikhan Gubayev on 21.05.2023.
//

import UIKit

class BasketViewController: UIViewController {
    
    private var basketProducts: [Product] = [] {
        didSet {
            if basketProducts.isEmpty {
                emptyView.isHidden = false
                basketTableView.isHidden = true
                registerOrderButton.isHidden = true
                basketTableView.reloadData()
            } else {
                emptyView.isHidden = true
                basketTableView.isHidden = false
                basketTableView.reloadData()
                registerOrderButton.isHidden = false
                
                registerOrderButton.setTitle("Перейти к оплате\n\(getTotalSum())₸", for: .normal)
            }
        }
    }
    
    private let emptyView = EmptyBasketView()
    
    private let basketTableView: UITableView = {
        let tv = UITableView()
        tv.separatorStyle = .none
        return tv
    } ()
    
    private let registerOrderButton = CustomButton()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(productAddedToBasket(_:)), name: .basketChangedNotification, object: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = Colors.mainBackground
        self.navigationItem.title = "Корзина"
        
        setUI()
        setupTableView()
        setActions()
    }
    
    @objc private func productAddedToBasket(_ notification: Notification) {
        if notification.userInfo?["product"] is Product {
            basketProducts = BasketManager.basketProducts
        }
    }
    
    private func setUI() {
        [emptyView, basketTableView, registerOrderButton].forEach { self.view.addSubview($0) }
        
        emptyView.centerInView(in: self.view)
        
        basketTableView.anchor(top: self.view.topAnchor, right: self.view.rightAnchor, bottom: self.view.bottomAnchor, left: self.view.leftAnchor, paddingTop: 120, paddingRight: 16, paddingLeft: 16)
        
        registerOrderButton.anchor(right: self.view.rightAnchor, bottom: self.view.bottomAnchor, left: self.view.leftAnchor, paddingRight: 16, paddingBottom: 100, paddingLeft: 16, height: 62)
    }
    
    private func setupTableView() {
        basketTableView.delegate = self
        basketTableView.dataSource = self
        basketTableView.register(BasketCell.self, forCellReuseIdentifier: BasketCell.reuseIdentifier)
        
        if basketProducts.isEmpty {
            basketTableView.isHidden = true
            registerOrderButton.isHidden = true
        }
    }
    
    private func setActions() {
        registerOrderButton.addTarget(self, action: #selector(goToPay), for: .touchUpInside)
    }
    
    @objc private func goToPay() {
        let orderDetailViewController = OrderDetailViewController()
        orderDetailViewController.totalSum = getTotalSum()
        self.navigationController?.present(UINavigationController(rootViewController: orderDetailViewController), animated: true)
    }
}

extension BasketViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return basketProducts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: BasketCell.reuseIdentifier, for: indexPath) as? BasketCell else { return UITableViewCell() }
        
        cell.product = basketProducts[indexPath.row]
        cell.onDeleteButtonTapped = { [weak self] in
            self?.deleteProduct(at: indexPath)
        }
        
        return cell
    }
}

extension BasketViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

extension BasketViewController {
    
    private func getTotalSum() -> Double {
        return basketProducts.reduce(0.0) { $0 + $1.price }
    }
    
    private func deleteProduct(at indexPath: IndexPath) {
        basketProducts.remove(at: indexPath.row)
        basketTableView.reloadData()
        
        BasketManager.basketProducts = basketProducts
    }
}

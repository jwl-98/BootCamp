//
//  ViewController.swift
//  nbc-popcon
//
//  Created by 진욱의 Macintosh on 11/25/24.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Subviews
    private let headerView = HeaderView()
    private let menuView = MenuView()
    private let cartView = CartView()
    private let buttonsView = ButtonsView()
    
    // MARK: - ViewModel
    private let kiosk = Kiosk()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupBindings()
        kiosk.getCurrentMenuItems()
    }
    
    // MARK: - UI Setup
    private func setupUI() {
        view.backgroundColor = .white
        
        // Add subviews
        view.addSubview(headerView)
        view.addSubview(menuView)
        view.addSubview(cartView)
        view.addSubview(buttonsView)
        
        // Set constraints
        headerView.translatesAutoresizingMaskIntoConstraints = false
        menuView.translatesAutoresizingMaskIntoConstraints = false
        cartView.translatesAutoresizingMaskIntoConstraints = false
        buttonsView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 100),
            
            menuView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            menuView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            menuView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            menuView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4),
            
            cartView.topAnchor.constraint(equalTo: menuView.bottomAnchor),
            cartView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            cartView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            cartView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3),
            
            buttonsView.topAnchor.constraint(equalTo: cartView.bottomAnchor),
            buttonsView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            buttonsView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            buttonsView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            buttonsView.heightAnchor.constraint(equalToConstant: 60),
        ])
    }
    
    // MARK: - Bindings
    private func setupBindings() {
        // HeaderView 카테고리 변경 이벤트
        headerView.onCategorySelected = { [weak self] index in
            self?.kiosk.selectCategory(at: index)
        }
        
        // MenuView 메뉴 아이템 선택 이벤트
        menuView.onMenuItemSelected = { [weak self] menuItem in
            self?.kiosk.addItemToCart(menuItem: menuItem)
        }
        
        // CartView 수량 변경 및 삭제 이벤트
        cartView.onItemQuantityChanged = { [weak self] index, quantity in
            self?.kiosk.updateCartItemQuantity(at: index, quantity: quantity)
        }
        
        cartView.onItemDeleted = { [weak self] index in
            self?.kiosk.removeCartItem(at: index)
        }
        
        // ButtonsView 버튼 동작 이벤트
        buttonsView.onCompleteOrder = { [weak self] in
            guard let message = self?.kiosk.completeOrder() else { return }
            self?.showAlert(title: "주문 완료", message: message)
        }
        
        buttonsView.onCancelOrder = { [weak self] in
            self?.kiosk.clearCart()
        }
        
        buttonsView.onCallStaff = { [weak self] in
            guard let message = self?.kiosk.callStaff() else { return }
            self?.showAlert(title: "직원 호출", message: message)
        }
        
        // Kiosk ViewModel에서 데이터 변경 시 UI 업데이트
        kiosk.onMenuUpdated = { [weak self] menuItems in
            self?.menuView.updateMenuItems(menuItems)
        }
        
        kiosk.onCartUpdated = { [weak self] cartItems in
            self?.cartView.updateCartItems(cartItems)
        }
        
        kiosk.onSummaryUpdated = { [weak self] summary in
            self?.cartView.updateSummaryLabel(summary)
        }
    }
    
    // MARK: - Helpers
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}

//
//  ViewController.swift
//  nbc-popcon
//
//  Created by MaxBook on 11/25/24.
//

import UIKit
import SnapKit

/// ViewController: UI 구성 및 이벤트 처리
class ViewController: UIViewController {
    
    // MARK: - UI Components
    
    private let headerView = HeaderView() // 헤더 뷰 (카테고리 선택 포함)
    private let menuView = MenuView() // 메뉴 리스트 뷰
    private let cartView = CartView() // 장바구니 리스트 뷰
    private let buttonView = ButtonsView() // 하단 버튼 뷰
    
    // MARK: - ViewModel
    
    private let kiosk = Kiosk()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupBindings()
        kiosk.getCurrentMenuItems() // 초기 메뉴 데이터 가져오기
        kiosk.allCategory()
    }
    
    // MARK: - UI Setup
    
    private func setupUI() {
        view.backgroundColor = .white
        
        // 뷰 계층구조 설정
        view.addSubview(headerView)
        view.addSubview(menuView)
        view.addSubview(cartView)
        view.addSubview(buttonView)
        
        // SnapKit을 사용해 제약조건 설정
        headerView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.top).offset(60)
        }
        
        menuView.snp.makeConstraints { make in
            make.top.equalTo(headerView.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(view.frame.height * 0.4)
        }
        
        cartView.snp.makeConstraints { make in
            make.top.equalTo(menuView.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(view.frame.height * 0.3)
        }
        
        buttonView.snp.makeConstraints { make in
            make.top.equalTo(cartView.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(60)
        }
    }
    
    // MARK: - Bindings
    
    private func setupBindings() {
        
        //HeaderView 직원 호출
        headerView.onCallStaff = { [weak self] in
            guard let message = self?.kiosk.callStaff() else { return }
            self?.showAlert(title: "직원 호출", message: message)
        }
        
        //MenuView SegmentedControl 카테고리 설정
        kiosk.onUpdateAllCategory = { [weak self] category in
            self?.menuView.configureCategory(category)
        }
        
        // 헤더에서 카테고리 변경 시 처리
        menuView.onCategorySelected = { [weak self] rawValue in
            self?.kiosk.selectCategory(rawValue)
        }
        
        //
        //        // 메뉴 뷰에서 아이템 선택 시 처리
        //        menuView.onMenuItemSelected = { [weak self] menuItem in
        //            self?.kiosk.addItemToCart(menuItem: menuItem)
        //        }
        //
        //        // 장바구니 뷰에서 수량 변경 및 삭제 처리
        //        cartView.onItemQuantityChanged = { [weak self] index, quantity in
        //            self?.kiosk.updateCartItemQuantity(at: index, quantity: quantity)
        //        }
        //
        //        cartView.onItemDeleted = { [weak self] index in
        //            self?.kiosk.removeCartItem(at: index)
        //        }
        //
        //        // 버튼 뷰에서 주문 완료, 취소 및 직원 호출 처리
        //        buttonView.onCompleteOrder = { [weak self] in
        //            guard let message = self?.kiosk.completeOrder() else { return }
        //            self?.showAlert(title: "주문 완료", message: message)
        //        }
        //
        //        buttonView.onCancelOrder = { [weak self] in
        //            self?.kiosk.clearCart()
        //        }
        //
        
        //
        //        // ViewModel(Kiosk) 데이터 변경 시 UI 업데이트
        //        kiosk.onMenuUpdated = { [weak self] menuItems in
        //            self?.menuView.updateMenuItems(menuItems)
        //        }
        //
        //        kiosk.onCartUpdated = { [weak self] cartItems in
        //            self?.cartView.updateCartItems(cartItems)
        //        }
    }
    
    // MARK: - Helpers
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}

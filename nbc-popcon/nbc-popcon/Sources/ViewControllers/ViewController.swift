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
    private let cartView = CartView() // 장바구니 뷰 (ButtonsView 포함)
    
    // MARK: - ViewModel
    
    private let kiosk = Kiosk() // Kiosk ViewModel
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI() // UI 초기화
        setupBindings() // ViewModel 및 UI 이벤트 바인딩
        kiosk.getCurrentMenuItems() // 초기 메뉴 데이터 가져오기
        kiosk.allCategory() // 초기 카테고리 데이터 가져오기
    }
    
    // MARK: - UI Setup
    
    private func setupUI() {
        view.backgroundColor = .white
        
        // 뷰 계층구조 설정
        view.addSubview(headerView)
        view.addSubview(menuView)
        view.addSubview(cartView)
       
        // SnapKit을 사용해 제약조건 설정
        headerView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.top).offset(60)
        }
        
        menuView.snp.makeConstraints { make in
            make.top.equalTo(headerView.snp.bottom)
            make.leading.trailing.equalToSuperview().inset(ThemeNumbers.padding)
            make.bottom.equalTo(cartView.snp.top)
        }
        
        cartView.snp.makeConstraints { make in
            make.top.equalTo(menuView.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    // MARK: - Bindings
    
    private func setupBindings() {
        
        // **HeaderView 직원 호출**
        headerView.onCallStaff = { [weak self] in
            guard let message = self?.kiosk.callStaff() else { return }
            self?.showAlert(title: "직원 호출", message: message)
        }
        
        // **MenuView SegmentedControl 카테고리 설정**
        kiosk.onUpdateAllCategory = { [weak self] categories in
            self?.menuView.configureCategory(categories)
        }
        
        // **MenuView에서 카테고리 변경 시 처리**
        menuView.onCategorySelected = { [weak self] rawValue in
            self?.kiosk.selectCategory(at: rawValue)
        }
        
        // **MenuView 메뉴 데이터 업데이트**
        kiosk.onMenuUpdated = { [weak self] items in
            self?.menuView.menuUpdated(items)
        }
        
        // **MenuView에서 아이템 선택 시 처리**
        menuView.onMenuItemSelected = { [weak self] menuItem in
            self?.kiosk.addItemToCart(menuItem: menuItem)
        }
        
//        // **CartView 수량 변경 및 삭제 처리**
//        cartView.onItemQuantityChanged = { [weak self] index, quantity in
//            self?.kiosk.updateCartItemQuantity(at: index, quantity: quantity)
//        }
//        
//        cartView.onItemDeleted = { [weak self] index in
//            self?.kiosk.removeCartItem(at: index)
//        }
//        
//        // **CartView 데이터 업데이트**
//        kiosk.onCartUpdated = { [weak self] cartItems in
//            self?.cartView.updateCartItems(cartItems)
//        }
        
        // **CartView 요약 정보 업데이트**
//        kiosk.onSummaryUpdated = { [weak self] summary in
//            let totalInfo = summary.split(separator: "|")
//            self?.cartView.countTotalItemLabel.text = String(totalInfo[0]).trimmingCharacters(in: .whitespaces)
//            self?.cartView.totalItemPriceLabel.text = String(totalInfo[1]).trimmingCharacters(in: .whitespaces)
//        }
        
        // **CartView의 버튼 액션 연결**
//        cartView.orderButtonsView.onCompleteOrder = { [weak self] in
//            guard let message = self?.kiosk.completeOrder() else { return }
//            self?.showAlert(title: "주문 완료", message: message)
//        }
//        
//        cartView.orderButtonsView.onCancelOrder = { [weak self] in
//            self?.kiosk.clearCart()
//        }
    }
    // MARK: - Helpers
    
    /// 사용자에게 알림을 표시하는 메서드
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}


#Preview {
    ViewController()
}

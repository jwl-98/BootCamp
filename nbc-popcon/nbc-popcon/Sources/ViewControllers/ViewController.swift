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
    private let themedView = ThemedView() // 테마 전환 뷰 (라이트/다크/자동 모드 선택)
    
    // MARK: - ViewModel
    
    private let kiosk = Kiosk() // 데이터와 비즈니스 로직을 관리하는 ViewModel
    
    // MARK: - State
    private var currentTheme: UIUserInterfaceStyle = .unspecified // 현재 테마 상태 저장
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()       // UI 초기화
        setupBindings() // 이벤트 바인딩 설정
        kiosk.getCurrentMenuItems() // 초기 메뉴 데이터 가져오기
        applyTheme(to: currentTheme) // 초기 테마 설정
    }
    
    // MARK: - UI Setup
    
    /// UI를 구성하고 SnapKit으로 레이아웃 설정
    private func setupUI() {
        view.backgroundColor = .white
        
        // 뷰 계층구조 설정
        view.addSubview(headerView)
        view.addSubview(menuView)
        view.addSubview(cartView)
        view.addSubview(buttonView)
        view.addSubview(themedView) // ThemedView 추가 (테마 전환 버튼 포함)
        
        // SnapKit 제약조건 설정
        headerView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.top).offset(60)
        }
        
        menuView.snp.makeConstraints { make in
            make.top.equalTo(headerView.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(view.frame.height * 0.35)
        }
        
        cartView.snp.makeConstraints { make in
            make.top.equalTo(menuView.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(view.frame.height * 0.25)
        }
        
        buttonView.snp.makeConstraints { make in
            make.top.equalTo(cartView.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(60)
        }
        
        themedView.snp.makeConstraints { make in
            make.top.equalTo(buttonView.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(view.frame.height * 0.2) // ThemedView 높이 설정
        }
    }
    
    // MARK: - Bindings
    
    /// ViewModel 및 UI 이벤트와의 바인딩 처리
    private func setupBindings() {
        
        // HeaderView에서 직원 호출 이벤트 처리
        headerView.onCallStaff = { [weak self] in
            guard let message = self?.kiosk.callStaff() else { return }
            self?.showAlert(title: "직원 호출", message: message)
        }
        
        // ThemedView에서 테마 변경 이벤트 처리
        themedView.onThemeChanged = { [weak self] theme in
            self?.applyTheme(to: theme) // 테마 변경
        }
        
        //        // 헤더에서 카테고리 변경 시 처리
        //        headerView.onCategorySelected = { [weak self] index in
        //            self?.kiosk.selectCategory(at: index)
        //        }
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
                buttonView.onCompleteOrder = { [weak self] in
                    guard let message = self?.kiosk.completeOrder() else { return }
                    self?.showAlert(title: "주문 완료", message: message)
                }
        
                buttonView.onCancelOrder = { [weak self] in
                    self?.kiosk.clearCart()
                }
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
    
    /// 모든 뷰에 테마를 적용하는 메서드
    private func applyTheme(to theme: UIUserInterfaceStyle) {
        currentTheme = theme // 현재 테마 저장
        
        // ViewController의 배경색 변경
        switch theme {
        case .light:
            view.backgroundColor = .white // 라이트 모드: 기본 흰색
        case .dark:
            view.backgroundColor = .black // 다크 모드: 검은색
        default:
            // 시스템 테마에 맞게 설정
            view.backgroundColor = traitCollection.userInterfaceStyle == .dark ? .black : .white
        }
        
        // 서브 뷰에 테마 전달
        headerView.updateTheme(to: theme)
        menuView.updateTheme(to: theme)
        cartView.updateTheme(to: theme)
        buttonView.updateTheme(to: theme)
        themedView.updateTheme(to: theme)
    }
    
    /// 사용자에게 알림을 표시하는 헬퍼 메서드
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}

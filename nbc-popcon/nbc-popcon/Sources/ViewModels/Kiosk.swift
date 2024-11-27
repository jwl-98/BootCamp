//
//  Kiosk.swift
//  nbc-popcon
//
//  Created by MaxBook on 11/25/24.
//

import Foundation

/// ViewModel: 데이터와 로직을 관리하는 클래스
class Kiosk {
    
    // MARK: - Properties
    
    /// 카테고리별 메뉴 데이터 (더미 데이터)
    private let menuCategories: [MenuItem] = MenuItem.menuItems
    
    /// 현재 선택된 카테고리 인덱스
    private var currentCategory: Category = .communication
    
    /// 장바구니 데이터
    private var cartItems: [CartItem] = []
    
    // MARK: - View와의 연결 클로저
    
    var onUpdateAllCategory: (([String]) -> Void)?
    var onMenuUpdated: (([MenuItem]) -> Void)?
    var onCartUpdated: (([CartItem]) -> Void)?
    var onSummaryUpdated: ((String) -> Void)?
    
    // MARK: - Public Methods
    
    func allCategory() {
        let allCategory = Category.allCases.map { $0.rawValue }
        onUpdateAllCategory?(allCategory)
    }
    
    /// 현재 선택된 카테고리의 메뉴 가져오기
    func getCurrentMenuItems() {
        let currentCategoryItems: [MenuItem] = menuCategories.filter {
            $0.category == self.currentCategory
        }
        onMenuUpdated?(currentCategoryItems)
    }
    
    /// 카테고리 변경
    func selectCategory(by rawValue: String) {
        self.currentCategory = Category(rawValue: rawValue)
    }
    
    /// 장바구니에 아이템 추가
    func addItemToCart(menuItem: MenuItem) {
        if let index = cartItems.firstIndex(where: { $0.name == menuItem.name }) {
            cartItems[index].quantity += 1
        } else {
            cartItems.append(CartItem(name: menuItem.name, price: menuItem.price, quantity: 1))
        }
        updateCart()
    }
    
    /// 장바구니 아이템 수량 변경
    func updateCartItemQuantity(at index: Int, quantity: Int) {
        if quantity <= 0 {
            cartItems.remove(at: index)
        } else {
            cartItems[index].quantity = quantity
        }
        updateCart()
    }
    
    /// 장바구니 아이템 삭제
    func removeCartItem(at index: Int) {
        cartItems.remove(at: index)
        updateCart()
    }
    
    /// 장바구니 초기화
    func clearCart() {
        cartItems.removeAll()
        updateCart()
    }
    
    /// 주문 완료
    func completeOrder() -> String {
        let totalItems = cartItems.reduce(0) { $0 + $1.quantity }
        let totalPrice = cartItems.reduce(0) { $0 + ($1.price * $1.quantity) }
        clearCart()
        return "총 \(totalItems)개의 상품 | 총 금액: \(totalPrice)원\n주문이 완료되었습니다."
    }
    
    /// 직원 호출
    func callStaff() -> String {
        return "직원을 호출하였습니다."
    }
    
    // MARK: - Private Methods
    
    /// 장바구니와 요약 정보 업데이트
    private func updateCart() {
        onCartUpdated?(cartItems)
        let totalItems = cartItems.reduce(0) { $0 + $1.quantity }
        let totalPrice = cartItems.reduce(0) { $0 + ($1.price * $1.quantity) }
        onSummaryUpdated?("총 \(totalItems)개 | 총 금액: \(totalPrice)원")
    }
}

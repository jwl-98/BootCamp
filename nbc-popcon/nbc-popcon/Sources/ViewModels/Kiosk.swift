//
//  Kiosk.swift
//  nbc-popcon
//
//  Created by MaxBook on 11/25/24.
//

import Foundation

/// **Kiosk**: ViewModel 역할을 수행하며 데이터와 비즈니스 로직을 관리합니다.
class Kiosk {
    
    // MARK: - Properties
    
    /// 카테고리별 메뉴 데이터 (더미 데이터)
    private let menuCategories: [[MenuItem]] = [
        [ // 통신 카테고리
            MenuItem(name: "📱 스마트폰", price: 1000),
            MenuItem(name: "💻 컴퓨터", price: 2000),
            MenuItem(name: "📡 와이파이", price: 1500),
            MenuItem(name: "🎧 헤드셋", price: 3000)
        ],
        [ // 사물 및 도구 카테고리
            MenuItem(name: "🔨 망치", price: 1200),
            MenuItem(name: "🪑 의자", price: 2500),
            MenuItem(name: "💡 전구", price: 800),
            MenuItem(name: "🎒 가방", price: 3500)
        ],
        [ // 건강 카테고리
            MenuItem(name: "❤️ 심장", price: 4000),
            MenuItem(name: "💊 약", price: 1000),
            MenuItem(name: "🌡️ 체온계", price: 2000),
            MenuItem(name: "😷 마스크", price: 500)
        ]
    ]
    
    /// 현재 선택된 카테고리 인덱스
    private var currentCategoryIndex: Int = 0
    
    /// 장바구니 데이터
    private var cartItems: [CartItem] = []
    
    // MARK: - View와의 연결 클로저
    /// 메뉴가 업데이트될 때 호출
    var onMenuUpdated: (([MenuItem]) -> Void)?
    /// 장바구니가 업데이트될 때 호출
    var onCartUpdated: (([CartItem]) -> Void)?
    /// 요약 정보(총 주문 개수와 금액)가 업데이트될 때 호출
    var onSummaryUpdated: ((String) -> Void)?
    
    // MARK: - Public Methods
    
    /// 현재 선택된 카테고리의 메뉴를 가져옵니다.
    func getCurrentMenuItems() {
        let currentMenu = menuCategories[currentCategoryIndex]
        onMenuUpdated?(currentMenu) // 클로저를 통해 메뉴 데이터 전달
    }
    
    /// 카테고리를 변경합니다.
    func selectCategory(at index: Int) {
        currentCategoryIndex = index
        getCurrentMenuItems()
    }
    
    /// 장바구니에 아이템을 추가합니다.
    func addItemToCart(menuItem: MenuItem) {
        if let index = cartItems.firstIndex(where: { $0.name == menuItem.name }) {
            cartItems[index].quantity += 1
        } else {
            cartItems.append(CartItem(name: menuItem.name, price: menuItem.price, quantity: 1))
        }
        updateCart()
    }
    
    /// 장바구니 아이템 수량을 변경합니다.
    func updateCartItemQuantity(at index: Int, quantity: Int) {
        if quantity <= 0 {
            cartItems.remove(at: index)
        } else {
            cartItems[index].quantity = quantity
        }
        updateCart()
    }
    
    /// 장바구니 아이템을 삭제합니다.
    func removeCartItem(at index: Int) {
        cartItems.remove(at: index)
        updateCart()
    }
    
    /// 장바구니를 초기화합니다.
    func clearCart() {
        cartItems.removeAll()
        updateCart()
    }
    
    /// 주문을 완료합니다.
    func completeOrder() -> String {
        let totalItems = cartItems.reduce(0) { $0 + $1.quantity }
        let totalPrice = cartItems.reduce(0) { $0 + ($1.price * $1.quantity) }
        clearCart()
        return "총 \(totalItems)개의 상품 | 총 금액: \(totalPrice)원\n주문이 완료되었습니다."
    }
    
    /// 직원을 호출합니다.
    func callStaff() -> String {
        return "직원을 호출하였습니다."
    }
    
    // MARK: - Private Methods
    
    /// 장바구니와 요약 정보를 업데이트합니다.
    private func updateCart() {
        onCartUpdated?(cartItems) // 장바구니 UI 업데이트
        let totalItems = cartItems.reduce(0) { $0 + $1.quantity }
        let totalPrice = cartItems.reduce(0) { $0 + ($1.price * $1.quantity) }
        onSummaryUpdated?("총 \(totalItems)개 | 총 금액: \(totalPrice)원") // 요약 정보 UI 업데이트
    }
}

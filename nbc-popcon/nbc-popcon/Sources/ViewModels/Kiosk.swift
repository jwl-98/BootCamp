//
//  Kiosk.swift
//  nbc-popcon
//
//  Created by MaxBook on 11/25/24.
//

import Foundation

/// **Kiosk ViewModel**
/// View와 데이터 간의 연결을 관리하며, 비즈니스 로직을 처리하는 클래스입니다.
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
    
    /// 카테고리 이름 목록
    private let categoryNames: [String] = ["통신", "사물 및 도구", "건강"]
    
    /// 현재 선택된 카테고리 인덱스
    private var currentCategoryIndex: Int = 0
    
    /// 장바구니 데이터
    private var cartItems: [CartItem] = []
    
    // MARK: - View와의 연결 클로저
    var onMenuUpdated: (([MenuItem]) -> Void)?
    var onCartUpdated: (([CartItem]) -> Void)?
    
    // MARK: - Public Methods
    
    /// 현재 선택된 카테고리의 메뉴 가져오기
    func getCurrentMenuItems() {
        log("Fetching menu items for category \(getCurrentCategoryName()).")
        let currentMenu = menuCategories[currentCategoryIndex]
        onMenuUpdated?(currentMenu)
    }
    
    /// 카테고리 변경
    func selectCategory(at index: Int) {
        log("Category changed to \(categoryNames[index]).")
        currentCategoryIndex = index
        getCurrentMenuItems()
    }
    
    /// 현재 선택된 카테고리 이름 반환
    func getCurrentCategoryName() -> String {
        return categoryNames[currentCategoryIndex]
    }
    
    /// 모든 카테고리 이름 반환
    func getAllCategoryNames() -> [String] {
        return categoryNames
    }
    
    /// 장바구니에 아이템 추가
    func addItemToCart(menuItem: MenuItem) {
        log("Adding \(menuItem.name) to cart.")
        if let index = cartItems.firstIndex(where: { $0.name == menuItem.name }) {
            cartItems[index].quantity += 1
        } else {
            cartItems.append(CartItem(name: menuItem.name, price: menuItem.price, quantity: 1))
        }
        updateCart()
    }
    
    /// 장바구니 아이템 수량 변경
    func updateCartItemQuantity(at index: Int, quantity: Int) {
        guard index >= 0 && index < cartItems.count else { return }
        log("Updating quantity for \(cartItems[index].name) to \(quantity).")
        
        if quantity <= 0 {
            cartItems.remove(at: index)
        } else {
            cartItems[index].quantity = quantity
        }
        updateCart()
    }
    
    /// 장바구니 아이템 삭제
    func removeCartItem(at index: Int) {
        guard index >= 0 && index < cartItems.count else { return }
        log("Removing \(cartItems[index].name) from cart.")
        cartItems.remove(at: index)
        updateCart()
    }
    
    /// 장바구니 초기화
    func clearCart() {
        log("Clearing cart.")
        cartItems.removeAll()
        updateCart()
    }
    
    /// 주문 완료
    func completeOrder() -> String {
        let summary = getCartSummary()
        log("Completing order. Total items: \(summary.totalItems), Total price: \(summary.totalPrice).")
        clearCart()
        return "총 \(summary.totalItems)개의 상품 | 총 금액: \(summary.totalPrice)원\n주문이 완료되었습니다."
    }
    
    /// 직원 호출
    func callStaff() -> String {
        log("Staff has been called.")
        return "직원을 호출하였습니다."
    }
    
    /// 현재 카테고리가 비어 있는지 확인
    func isCurrentCategoryEmpty() -> Bool {
        return menuCategories[currentCategoryIndex].isEmpty
    }
    
    /// 장바구니가 비어 있는지 확인
    func isCartEmpty() -> Bool {
        return cartItems.isEmpty
    }
    
    /// 장바구니 합계와 총 수량 반환
    func getCartSummary() -> (totalItems: Int, totalPrice: Int) {
        let totalItems = cartItems.reduce(0) { $0 + $1.quantity }
        let totalPrice = cartItems.reduce(0) { $0 + ($1.price * $1.quantity) }
        return (totalItems, totalPrice)
    }
    
    /// 특정 카트 아이템의 총 가격 반환
    func getCartItemTotalPrice(at index: Int) -> Int? {
        guard index >= 0 && index < cartItems.count else { return nil }
        let item = cartItems[index]
        return item.price * item.quantity
    }
    
    /// ViewModel 초기화
    func reset() {
        log("Resetting Kiosk to initial state.")
        currentCategoryIndex = 0
        cartItems.removeAll()
        updateCart()
        getCurrentMenuItems()
    }
    
    // MARK: - Private Methods
    
    /// 장바구니와 요약 정보 업데이트
    private func updateCart() {
        onCartUpdated?(cartItems)
    }
    
    /// 디버깅 로그 출력 (개발 중에만 활성화)
    private func log(_ message: String) {
        #if DEBUG
        print("[Kiosk] \(message)")
        #endif
    }
}

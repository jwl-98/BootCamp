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
    
    /// 현재 선택된 카테고리
    private var currentCategory: Category = .communication
    
    /// 장바구니 데이터(더미 데이터 추가)
    private var cartItems: [CartItem] = []
    
    // MARK: - View와의 연결 클로저
    
    var onUpdateAllCategory: (([String]) -> Void)?
    var onMenuUpdated: (([MenuItem]) -> Void)?
    var onCartUpdated: (([CartItem]) -> Void)?
    var onSummaryUpdated: ((Int,Int) -> Void)?
    
    // MARK: - Public Methods
    
    /// 직원 호출
    func callStaff() -> String {
        return "직원을 호출하였습니다."
    }
    
    /// 모든 카테고리 불러오기
    func allCategory() {
        var allCategory: Set<Category> = []
        
        self.menuCategories.forEach {
            allCategory.insert($0.category)
        }
        
        let categories = allCategory.map { $0.rawValue }
        onUpdateAllCategory?(categories)
    }
    
    /// 현재 선택된 카테고리의 메뉴 가져오기
    func getCurrentMenuItems() {
        
        let currentCategoryItems: [MenuItem] = menuCategories.filter {
            $0.category == self.currentCategory
        }
        onMenuUpdated?(currentCategoryItems)
    }
    
    /// 카테고리 변경 - MenuView에서 사용
    func selectCategory(at rawValue: String) {
        self.currentCategory = Category(rawValue: rawValue)
        getCurrentMenuItems()
    }
    
    /// 장바구니에 아이템 추가 - MenuView에서 사용
    func addItemToCart(menuItem: MenuItem) {
        if let index = cartItems.firstIndex(where: {$0.menuitem == menuItem}) {
            cartItems[index].add()
        } else {
            let cartItem = CartItem(menuitem: menuItem, quantity: 1)
            cartItems.append(cartItem)
        }
        updateCart()
    }
    
    /// 장바구니 아이템 수량 변경 - CartView에서 스탭퍼를 통해 사용
    func updateCartItemQuantity(at index: Int, quantity: Int) {
        if quantity <= 0 {
            cartItems.remove(at: index)
        } else {
            cartItems[index].update(quantity)
        }
        updateCart()
        print("updateCartItemQuantity")
    }
    
    
    /// 장바구니 아이템 삭제 - 휴지통 버튼
    func removeCartItem(at index: Int) {
        cartItems.remove(at: index)
        updateCart()
        print("removeCartItem")
    }
    
    /// 장바구니 초기화 - 취소하기 버튼
    func clearCart() {
        cartItems.removeAll()
        updateCart()
        print("clearCart")
    }
    
    /// 주문 완료 - 결제하기 버튼
    func completeOrder() -> String {
        let totalItems = cartItems.reduce(0) { $0 + $1.quantity }
        let totalPrice = cartItems.reduce(0) { $0 + $1.totalPrice }
        clearCart()
        print("completeOrder")
        return "총 \(totalItems)개의 상품 | 총 금액: \(totalPrice)원\n주문이 완료되었습니다."
    }
    

    
    // MARK: - Private Methods
    
    private func updateCart() {
        print("updateCart")
        onCartUpdated?(cartItems)
        
        let totalItems = cartItems.reduce(0) { $0 + $1.quantity }
        let totalPrice = cartItems.reduce(0) { $0 + $1.totalPrice }
        onSummaryUpdated?(totalItems,totalPrice)
    }
}

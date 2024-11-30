//
//  CartItem.swift
//  nbc-popcon
//
//  Created by MaxBook on 11/25/24.
//

import Foundation

struct CartItem {
    
    let menuitem: MenuItem
    
    var quantity: Int
    
    var totalPrice: Int {
        self.menuitem.price * quantity
    }
    
    mutating func add() {
        self.quantity += 1
    }
    
    mutating func update(_ quantity: Int) {
        self.quantity = quantity
    }
}

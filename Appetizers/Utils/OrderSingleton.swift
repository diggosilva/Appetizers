//
//  OrderSingleton.swift
//  Appetizers
//
//  Created by Diggo Silva on 13/02/24.
//

import Foundation

class OrderSingleton {
    static let shared: OrderSingleton = OrderSingleton()
    var listaProdutos: Bindable<[Appetizer]> = Bindable(value: [])
    
    private init() {}
}

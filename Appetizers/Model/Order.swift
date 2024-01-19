//
//  Order.swift
//  Appetizers
//
//  Created by Diggo Silva on 03/12/23.
//

import Foundation

final class Order {
    
    var items: [Appetizer] = []
    
    var totalPrice: Double {
        items.reduce(0) { $0 + $1.price }
    }
    
    func add(_ appetizer: Appetizer) {
        items.append(appetizer)
    }
    
    func deleteItems(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }
}

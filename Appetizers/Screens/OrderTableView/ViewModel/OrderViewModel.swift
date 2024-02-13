//
//  OrderViewModel.swift
//  Appetizers
//
//  Created by Diggo Silva on 22/01/24.
//

import Foundation

enum OrderState {
    case empty, loaded
}

protocol OrderViewModelProtocol {
    var state: Bindable<OrderState> { get set }
    
    //TableView
    func loadData()
    func numberOfRows() -> Int
    func orderedAppetizer(of indexPath: IndexPath) -> Appetizer
    func appetizersValue() -> String
    func deleteItems(_ indexPath: IndexPath)
}

class OrderViewModel: OrderViewModelProtocol {

    var state: Bindable<OrderState> = Bindable(value: .loaded)
    
    var orderedList: [Appetizer] = []
    
    func loadData() {
        orderedList = OrderSingleton.shared.listaProdutos.value
        handleStates()
        
        // Será chamado toda vez que o botão Adicionar for clicado
        OrderSingleton.shared.listaProdutos.bind { listAppetizer in
            self.orderedList = listAppetizer
            self.handleStates()
        }
    }
    
    func handleStates() {
        if orderedList.isEmpty {
            state.value = .empty
        } else {
            state.value = .loaded
        }
    }
    
    func numberOfRows() -> Int {
        return orderedList.count
    }
    
    func orderedAppetizer(of indexPath: IndexPath) -> Appetizer {
        orderedList[indexPath.row]
    }
    
    func appetizersValue() -> String {
        var valor: Double = 0
        orderedList.forEach { appetizer in
            valor += appetizer.price
        }
        return "R$\(String(format: "%.2f", valor * 5)) - Total"
    }
    
    func deleteItems(_ indexPath: IndexPath) {
        OrderSingleton.shared.listaProdutos.value.remove(at: indexPath.row)
    }
}

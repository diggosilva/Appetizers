//
//  OrderViewModel.swift
//  Appetizers
//
//  Created by Diggo Silva on 22/01/24.
//

import Foundation

protocol OrderViewModelProtocol {
    var state: Bindable<State> { get set }
    
    //TableView
    func numberOfRows() -> Int
    func orderedAppetizer(of indexPath: IndexPath) -> Appetizer
    
    //Request
}

class OrderViewModel: OrderViewModelProtocol {
    
    var state: Bindable<State> = Bindable()
    var prod: Bindable<Appetizer> = Bindable()
    
    var orderedList: [Appetizer] = []
    
    func loadData() {
        orderedList = listaProdutos.value!
    }
    
    func numberOfRows() -> Int {
        return orderedList.count
    }
    
    func orderedAppetizer(of indexPath: IndexPath) -> Appetizer {
        orderedList[indexPath.row]
    }
    
}

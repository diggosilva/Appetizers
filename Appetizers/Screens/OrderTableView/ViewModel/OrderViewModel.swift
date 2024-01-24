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
    func orderedList() -> [Appetizer]
    
    //Request
}

class OrderViewModel: OrderViewModelProtocol {

    var state: Bindable<State> = Bindable(value: .loaded)
    
    var listaEncomendados: [Appetizer] = []
    
    func loadData() {
       
    }
    
    func orderedList() -> [Appetizer] {
        return listaEncomendados
    }
    
    func numberOfRows() -> Int {
        return listaEncomendados.count
    }
    
    func orderedAppetizer(of indexPath: IndexPath) -> Appetizer {
        listaEncomendados[indexPath.row]
    }
}

//
//  AppetizerDetailViewModel.swift
//  Appetizers
//
//  Created by Diggo Silva on 19/01/24.
//

import UIKit

class AppetizerDetailViewModel {
    
    var state: Bindable<State> = Bindable(value: .loaded)
    var appetizer: Appetizer
    
    init(appetizer: Appetizer) {
        self.appetizer = appetizer
    }
    
    func addAppetizer() {
        OrderSingleton.shared.listaProdutos.value.append(appetizer)
    }
}

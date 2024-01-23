//
//  AppetizerDetailViewModel.swift
//  Appetizers
//
//  Created by Diggo Silva on 19/01/24.
//

import UIKit

//protocol AppetizerDetailViewModelDelegate: AnyObject {
//    func getAppetizer() -> Appetizer?
//}

class AppetizerDetailViewModel {
    
//    weak var delegate: AppetizerDetailViewModelDelegate?
    
    var state: Bindable<State> = Bindable()
    var appetizer: Appetizer?
    
}

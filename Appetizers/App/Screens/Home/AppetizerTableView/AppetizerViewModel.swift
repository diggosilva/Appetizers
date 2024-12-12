//
//  AppetizerViewModel.swift
//  Appetizers
//
//  Created by Diggo Silva on 18/01/24.
//

import Foundation

enum State {
    case loaded
    case loading
    case error
}

protocol AppetizerViewModelProtocol {
    var state: Bindable<State> { get set }
    var requestWay: Bindable<RequestWay> { get set }
    
    //TableView
    func numberOfRows() -> Int
    func getAppetizer(of indexPath: IndexPath) -> Appetizer
    
    //Request
    func loadData()
}

class AppetizerViewModel: AppetizerViewModelProtocol {
    var state: Bindable<State> = Bindable(value: .loading)
    var requestWay: Bindable<RequestWay> = Bindable(value: .unknown)
    
    private var service: ServiceProtocol = Service()
    private var appetizerList: [Appetizer] = []
    
    init(service: ServiceProtocol = Service()) {
        self.service = service
    }
    
    func loadData() {
        guard !service.isUpdating() else { return }
        service.getAppetizers { response, requestWay  in
            self.appetizerList = response
            self.state.value = .loaded
            self.requestWay.value = requestWay
        } onError: { error in
            self.state.value = .error
            self.requestWay.value = .unknown
        }
    }
    
    func numberOfRows() -> Int {
        return appetizerList.count
    }
    
    func getAppetizer(of indexPath: IndexPath) -> Appetizer {
        return appetizerList[indexPath.row]
    }
}

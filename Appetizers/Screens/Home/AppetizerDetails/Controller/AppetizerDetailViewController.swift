//
//  AppetizerDetailViewController.swift
//  Appetizers
//
//  Created by Diggo Silva on 02/12/23.
//

import UIKit

class AppetizerDetailViewController: UIViewController {
    
    let appetizerDetailView = AppetizerDetailView()
    
    var viewModel = AppetizerDetailViewModel()
    
    override func loadView() {
        super.loadView()
        view = appetizerDetailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegates()
        loadView()
        loadDetails()
    }
    
    func loadDetails() {
        appetizerDetailView.configure(model: viewModel.appetizer!)
    }
    
    func setDelegates() {
        appetizerDetailView.delegate = self
    }
}

extension AppetizerDetailViewController: AppetizerDetailViewDelegate {
    func didTapAddOrder(appetizer: Appetizer?) {
        guard let appetizer else { return }
        print("DEBUG: Adiciona item na lista de Pedido")
        OrderSingleton.shared.listaProdutos.value.append(appetizer)
        dismiss(animated: true)
    }
    
    func didTapCancel() {
        dismiss(animated: true)
    }
}

//
//  AppetizerDetailViewController.swift
//  Appetizers
//
//  Created by Diggo Silva on 02/12/23.
//

import UIKit

class AppetizerDetailViewController: UIViewController {
    
    let appetizerDetailView = AppetizerDetailView()
    
    var viewModel: AppetizerDetailViewModel
    
    init(appetizer: Appetizer) {
        self.viewModel = AppetizerDetailViewModel(appetizer: appetizer)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
        appetizerDetailView.configure(model: viewModel.appetizer)
    }
    
    func setDelegates() {
        appetizerDetailView.delegate = self
    }
}

extension AppetizerDetailViewController: AppetizerDetailViewDelegate {
    func didTapAddOrder() {
        print("DEBUG: Adiciona item na lista de Pedido")
        viewModel.addApetizer()
        dismiss(animated: true)
    }
    
    func didTapCancel() {
        dismiss(animated: true)
    }
}

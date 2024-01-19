//
//  AppetizerDetailViewController.swift
//  Appetizers
//
//  Created by Diggo Silva on 02/12/23.
//

import UIKit

class AppetizerDetailViewController: UIViewController {
    
    let appetizerDetailView = AppetizerDetailView()
    let order = Order()
    var appetizer: Appetizer?

    override func loadView() {
        super.loadView()
        view = appetizerDetailView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegates()
        guard let appetizer else { return }
        appetizerDetailView.configure(model: appetizer)
    }
    
    func setDelegates() {
        appetizerDetailView.delegate = self
    }
}

extension AppetizerDetailViewController: AppetizerDetailViewDelegate {
    func didTapAddOrder(appetizer: Appetizer?) {
        print("DEBUG: Adiciona item na lista de Pedido")
        let orderVC = OrderViewController()
        guard let appetizer else { return }
        orderVC.aperitivos.append(appetizer)
        
//        orderVC.orderView.tableView.reloadData()
        dismiss(animated: true)
    }
    
    func didTapCancel() {
        dismiss(animated: true)
    }
}

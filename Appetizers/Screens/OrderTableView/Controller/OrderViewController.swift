//
//  OrderViewController.swift
//  Appetizers
//
//  Created by Diggo Silva on 03/12/23.
//

import UIKit

class OrderViewController: UIViewController {
    
    let orderView = OrderView()
    lazy var viewModel: OrderViewModelProtocol = OrderViewModel()
    var aperitivos: [Appetizer] = []
    
    override func loadView() {
        super.loadView()
        view = orderView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavBar()
        
        aperitivos = OrderSingleton.shared.listaProdutos.value ?? [] 
        
        OrderSingleton.shared.listaProdutos.bind { listAppetizer in
            self.viewModel.numberOfRows() = listAppetizer
//            self.aperitivos = listAppetizer
            self.orderView.tableView.reloadData()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if viewModel.numberOfRows() == 0 {
            orderView.emptyImage.isHidden = false
            orderView.emptyLabel.isHidden = false
        } else {
            orderView.emptyImage.isHidden = true
            orderView.emptyLabel.isHidden = true
        }
    }
    
    private func setNavBar() {
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "🧾 Pedido"
        setupTableView()
    }
    
    func setupTableView() {
        orderView.tableView.delegate = self
        orderView.tableView.dataSource = self
    }
}

extension OrderViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: OrderCell.identifier, for: indexPath) as? OrderCell else { return UITableViewCell() }
        cell.configure(model: viewModel.orderedAppetizer(of: indexPath))
//        tableView.reloadData()
        return cell
    }
}

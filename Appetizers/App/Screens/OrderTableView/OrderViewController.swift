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
    
    override func loadView() {
        super.loadView()
        view = orderView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavBar()
        
        viewModel.state.bind { state in
            switch state {
            case .empty:
                self.orderView.emptyImage.isHidden = false
                self.orderView.emptyLabel.isHidden = false
                self.orderView.allOrderButton.isHidden = true
            case .loaded:
                self.orderView.emptyImage.isHidden = true
                self.orderView.emptyLabel.isHidden = true
                self.orderView.allOrderButton.isHidden = false
                self.orderView.allOrderButton.setTitle(self.viewModel.appetizersValue(), for: .normal)
            }
            self.orderView.tableView.reloadData()
        }
        viewModel.loadData()
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
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            viewModel.deleteItems(indexPath)
        }
    }
}

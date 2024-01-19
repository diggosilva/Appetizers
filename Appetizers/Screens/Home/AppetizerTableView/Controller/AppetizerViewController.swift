//
//  AppetizerViewController.swift
//  Appetizers
//
//  Created by Diggo Silva on 02/12/23.
//

import UIKit
import SDWebImage

class AppetizerViewController: UIViewController {
    
    private let appetizerView = AppetizerView()
    
    lazy var viewModel: AppetizerViewModelIN = AppetizerViewModel()
    
    override func loadView() {
        super.loadView()
        view = appetizerView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavBar()
        handleStates()
        setDelegatesAndDataSources()
        viewModel.loadData()
    }
    
    func handleStates() {
        viewModel.state.bind { state in
            guard let state = state else { return }
            switch state {
            case .loaded:
                self.showLoadedState()
            case .loading:
                self.showLoadingState()
            case .error:
                self.showErrorState()
            }
        }
    }
    
    //MARK: - States
    func showLoadingState() {
        appetizerView.spinner.startAnimating()
        appetizerView.tableView.isHidden = true
    }
    
    func showLoadedState() {
        appetizerView.spinner.stopAnimating()
        appetizerView.tableView.isHidden = false
        appetizerView.tableView.reloadData()
    }
    
    func showErrorState() {
        let alert = UIAlertController(title: "Ocorreu um erro ao carregar os Aperitivos!", message: "🫤", preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default) { action in
            self.appetizerView.tableView.isHidden = false
            self.appetizerView.spinner.stopAnimating()
        }
        alert.addAction(ok)
        present(alert, animated: true)
    }
    
    private func setNavBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "🍟 Aperitivos"
    }
    
    private func setDelegatesAndDataSources() {
        appetizerView.tableView.delegate = self
        appetizerView.tableView.dataSource = self
    }
}

extension AppetizerViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AppetizerCell.identifier, for: indexPath) as? AppetizerCell else { return UITableViewCell() }
        
        let appetizer = viewModel.getAppetizer(of: indexPath)
        cell.configure(model: appetizer)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let appetizerSelected = viewModel.getAppetizer(of: indexPath)
        let apDetailVC = AppetizerDetailViewController()
        apDetailVC.appetizer = appetizerSelected
        
        present(apDetailVC, animated: true)
        modalPresentationStyle = .automatic
    }
}

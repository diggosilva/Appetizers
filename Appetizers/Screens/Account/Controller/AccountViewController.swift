//
//  AccountViewController.swift
//  Appetizers
//
//  Created by Diggo Silva on 16/01/24.
//

import UIKit

class AccountViewController: UIViewController {
    
    private var accountView = AccountView()
    
    var viewModel = AccountViewModel()
    
    override func loadView() {
        view = accountView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "😉 Conta"
        setDelegatesAndDataSources()
    }
    
    private func setDelegatesAndDataSources() {
        accountView.delegate = self
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}

extension AccountViewController: AccountViewDelegate {
    func didTapSaveChanges() {
        print("DEBUG: Dados salvos!")
    }
}

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
        viewModel.loadUser()
        
        accountView.textFieldName.text = viewModel.user?.name
        accountView.textFieldLastName.text = viewModel.user?.lastName
        accountView.textFieldEmail.text = viewModel.user?.email
        accountView.datePicker.date = viewModel.user?.birthday ?? Date.now
        accountView.napkinSwitch.isOn = viewModel.user?.napkins ?? false
        accountView.refillSwitch.isOn = viewModel.user?.refill ?? false
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
        guard let name = accountView.textFieldName.text,
              let lastName = accountView.textFieldLastName.text,
              let email = accountView.textFieldEmail.text else { return }
        let birthday = accountView.datePicker.date
        let napkins = accountView.napkinSwitch.isOn
        let refill = accountView.refillSwitch.isOn
        viewModel.saveUser(name: name, lastName: lastName, email: email, birthday: birthday, napkins: napkins, refill: refill)
        Toast.shared.show(message: "Dados salvos com sucesso!", image: nil, in: self.view)
        print("DEBUG: Dados salvos!")
    }
}

//
//  OrderView.swift
//  Appetizers
//
//  Created by Diggo Silva on 03/12/23.
//

import UIKit

class OrderView: UIView {
    
    lazy var emptyImage: UIImageView = {
        Components.buildImage(image: UIImage(systemName: "basket"), cornerRadius: 10)
    }()
    
    lazy var emptyLabel: UILabel = {
        Components.buildLabel(text: "Você não tem itens no seu pedido.\nPor favor adicione itens.", textColor: .secondaryLabel, fontSize: .boldSystemFont(ofSize: 16))
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(OrderCell.self, forCellReuseIdentifier: OrderCell.identifier)
        return tableView
    }()
    
    lazy var allOrderButton: UIButton = {
        Components.buildButton(setTitle: "R$ - Adicionar", setTitleColor: .accent, font: .systemFont(ofSize: 18, weight: .semibold), backgroundColor: .accent.withAlphaComponent(0.2), action: #selector(didTapAllOrder))
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func didTapAllOrder() {
        print("Concluído")
    }
    
    private func setupView() {
        setHierarchy()
        setConstraints()
    }
    
    private func setHierarchy () {
        backgroundColor = .systemBackground
        addSubview(tableView)
        tableView.addSubview(emptyImage)
        tableView.addSubview(emptyLabel)
        addSubview(allOrderButton)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: allOrderButton.topAnchor, constant: -20),
            
            emptyImage.centerXAnchor.constraint(equalTo: tableView.centerXAnchor),
            emptyImage.centerYAnchor.constraint(equalTo: tableView.centerYAnchor, constant: -150),
            emptyImage.widthAnchor.constraint(equalToConstant: 80),
            emptyImage.heightAnchor.constraint(equalToConstant: 80),
            
            emptyLabel.centerXAnchor.constraint(equalTo: emptyImage.centerXAnchor),
            emptyLabel.topAnchor.constraint(equalTo: emptyImage.bottomAnchor, constant: 10),
            emptyLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            emptyLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            allOrderButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -100),
            allOrderButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            allOrderButton.heightAnchor.constraint(equalToConstant: 50),
            allOrderButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            allOrderButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
        ])
    }
}

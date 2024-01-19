//
//  AppetizerDetailView.swift
//  Appetizers
//
//  Created by Diggo Silva on 02/12/23.
//

import UIKit
import SDWebImage

protocol AppetizerDetailViewDelegate: AnyObject {
    func didTapCancel()
    func didTapAddOrder(appetizer: Appetizer?)
}

class AppetizerDetailView: UIView {
    
    weak var delegate: AppetizerDetailViewDelegate?
    
    lazy var cardImage: UIView = {
        let cardView = UIView()
        cardView.translatesAutoresizingMaskIntoConstraints = false
        cardView.layer.cornerRadius = 20
        cardView.clipsToBounds = true
        cardView.backgroundColor = .systemBackground
        return cardView
    }()
   
    lazy var appetizerImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "steak-placeholder")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
        return imageView
    }()
    
    lazy var xButton: UIButton = {
        let button = UIButton(type: .close)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didTapCancel), for: .touchUpInside)
        return button
    }()
    
    lazy var appetizerName: UILabel = {
        Components.buildLabel(text: "Bife com Fritas", fontSize: UIFont.systemFont(ofSize: 20, weight: .semibold))
    }()
    
    lazy var appetizerDescription: UILabel = {
        Components.buildLabel(text: "Bife com fritas. Acompanhado de salada e tomate.", fontSize: nil)
    }()
    
    
    lazy var caloriesLabel: UILabel = {
        Components.buildLabel(text: "Calorias", fontSize: UIFont.systemFont(ofSize: 12, weight: .bold))
    }()
    
    lazy var caloriesValueLabel: UILabel = {
        Components.buildLabel(text: "800", textColor: .secondaryLabel, fontSize: UIFont.italicSystemFont(ofSize: 16))
    }()
    
    lazy var vStackCalories: UIStackView = {
        Components.buildVStackView(arrangedSubviews: [caloriesLabel, caloriesValueLabel])
    }()
    
    
    lazy var carbsLabel: UILabel = {
        Components.buildLabel(text: "Carboidratos", fontSize: UIFont.systemFont(ofSize: 12, weight: .bold))
    }()
    
    lazy var carbsValueLabel: UILabel = {
        Components.buildLabel(text: "22", textColor: .secondaryLabel, fontSize: UIFont.italicSystemFont(ofSize: 16))
    }()
    
    lazy var vStackCarbs: UIStackView = {
        Components.buildVStackView(arrangedSubviews: [carbsLabel, carbsValueLabel])
    }()
    
    
    lazy var proteinLabel: UILabel = {
        Components.buildLabel(text: "Proteína", fontSize: UIFont.systemFont(ofSize: 12, weight: .bold))
    }()
    
    lazy var proteinValueLabel: UILabel = {
        Components.buildLabel(text: "5", textColor: .secondaryLabel, fontSize: UIFont.italicSystemFont(ofSize: 16))
    }()
    
    lazy var vStackProtein: UIStackView = {
        Components.buildVStackView(arrangedSubviews: [proteinLabel, proteinValueLabel])
    }()
    
    lazy var hStackValues: UIStackView = {
        Components.buildHStackView(arrangedSubviews: [vStackCalories, vStackCarbs, vStackProtein])
    }()
    
    lazy var orderButton: UIButton = {
        let button = UIButton(type: .roundedRect)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("R$\(9.98) - Adicionar", for: .normal)
        button.setTitleColor(.accent, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 18)
        button.backgroundColor = .accent.withAlphaComponent(0.2)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(didTapAddOrder), for: .touchUpInside)
        return button
    }()
    
    var selectedAppetizer: Appetizer?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(model: Appetizer) {
        selectedAppetizer = model
        guard let url = URL(string: model.imageURL) else { return }
        
        DispatchQueue.main.async {
            self.appetizerImage.sd_setImage(with: url)
            self.appetizerName.text = model.name
            self.appetizerDescription.text = model.description
            self.caloriesValueLabel.text = "\(model.calories)"
            self.carbsValueLabel.text = "\(model.carbs)"
            self.proteinValueLabel.text = "\(model.protein)"
            self.orderButton.setTitle("R$\(String(format: "%.2f", model.price * 5)) - Adicionar", for: .normal)
        }
    }
    
    @objc func didTapAddOrder() {
        delegate?.didTapAddOrder(appetizer: selectedAppetizer)
    }
    
    @objc func didTapCancel() {
        delegate?.didTapCancel()
    }
    
    private func setupView() {
        setHierarchy()
        setConstraints()
    }
    
    private func setHierarchy () {
        addSubview(cardImage)
        addSubview(appetizerImage)
        addSubview(xButton)
        addSubview(appetizerName)
        addSubview(appetizerDescription)
        addSubview(hStackValues)
        addSubview(orderButton)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            cardImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            cardImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            cardImage.widthAnchor.constraint(equalToConstant: 300),
            cardImage.heightAnchor.constraint(equalToConstant: 525),
            
            appetizerImage.topAnchor.constraint(equalTo: cardImage.topAnchor),
            appetizerImage.centerXAnchor.constraint(equalTo: cardImage.centerXAnchor),
            appetizerImage.widthAnchor.constraint(equalToConstant: 300),
            appetizerImage.heightAnchor.constraint(equalToConstant: 225),
            
            xButton.topAnchor.constraint(equalTo: appetizerImage.topAnchor, constant: 10),
            xButton.trailingAnchor.constraint(equalTo: appetizerImage.trailingAnchor, constant: -10),
            
            appetizerName.topAnchor.constraint(equalTo: appetizerImage.bottomAnchor, constant: 10),
            appetizerName.leadingAnchor.constraint(equalTo: cardImage.leadingAnchor, constant: 20),
            appetizerName.trailingAnchor.constraint(equalTo: cardImage.trailingAnchor, constant: -20),
            
            appetizerDescription.topAnchor.constraint(equalTo: appetizerName.bottomAnchor, constant: 10),
            appetizerDescription.leadingAnchor.constraint(equalTo: appetizerName.leadingAnchor),
            appetizerDescription.trailingAnchor.constraint(equalTo: appetizerName.trailingAnchor),
            
            hStackValues.topAnchor.constraint(equalTo: appetizerDescription.bottomAnchor, constant: 10),
            hStackValues.leadingAnchor.constraint(equalTo: cardImage.leadingAnchor),
            hStackValues.trailingAnchor.constraint(equalTo: cardImage.trailingAnchor),
            
            orderButton.bottomAnchor.constraint(equalTo: cardImage.bottomAnchor, constant: -20),
            orderButton.centerXAnchor.constraint(equalTo: cardImage.centerXAnchor),
            orderButton.heightAnchor.constraint(equalToConstant: 50),
            orderButton.leadingAnchor.constraint(equalTo: cardImage.leadingAnchor, constant: 20),
            orderButton.trailingAnchor.constraint(equalTo: cardImage.trailingAnchor, constant: -20),
        ])
    }
}

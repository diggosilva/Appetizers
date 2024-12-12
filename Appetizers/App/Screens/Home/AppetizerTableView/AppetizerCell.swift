//
//  AppetizerCell.swift
//  Appetizers
//
//  Created by Diggo Silva on 02/12/23.
//

import UIKit
import SDWebImage

class AppetizerCell: UITableViewCell {
    
    static let identifier = "AppetizerCell"
    
    lazy var appetizerImage: UIImageView = {
        Components.buildImage(cornerRadius: 10)
    }()
    
    lazy var appetizerName: UILabel = {
        Components.buildLabel(text: "Bife com fritas. Acompanhado de salada e tomate", fontSize: .systemFont(ofSize: 20, weight: .semibold), textAlignment: .left)
    }()
    
    lazy var appetizerPrice: UILabel = {
        Components.buildLabel(text: "R$9,99", textColor: .secondaryLabel, fontSize: .systemFont(ofSize: 16, weight: .semibold), textAlignment: .left)
    }()
    
    lazy var vStackView: UIStackView = {
        Components.buildVStackView(arrangedSubviews: [appetizerName, appetizerPrice], spacing: 0, alignment: .leading)
    }()
    
    lazy var hStackView: UIStackView = {
        Components.buildHStackView(arrangedSubviews: [appetizerImage, vStackView])
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(model: Appetizer) {
        guard let url = URL(string: model.imageURL) else { return }
        DispatchQueue.main.async {
            self.appetizerImage.sd_setImage(with: url)
            self.appetizerName.text = model.name
            self.appetizerPrice.text = "R$\(String(format: "%.2f", model.price * Currency.USDToday))"
        }
    }
    
    private func setupView() {
        setHierarchy()
        setConstraints()
    }
    
    private func setHierarchy () {
        addSubview(hStackView)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            
            hStackView.topAnchor.constraint(equalTo: topAnchor),
            hStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            hStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            hStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            appetizerImage.widthAnchor.constraint(equalToConstant: 120),
            appetizerImage.heightAnchor.constraint(equalToConstant: 90),
        ])
    }
}

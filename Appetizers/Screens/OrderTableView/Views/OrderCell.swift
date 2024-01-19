//
//  OrderCell.swift
//  Appetizers
//
//  Created by Diggo Silva on 03/12/23.
//

import UIKit
import SDWebImage

class OrderCell: UITableViewCell {
    
    static let identifier = "OrderCell"
    
    lazy var appetizerImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "food-placeholder")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        return imageView
    }()
    
    lazy var appetizerName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "Bife com fritas. Acompanhado de salada e tomate"
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        return label
    }()
    
    lazy var appetizerPrice: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "R$9,99"
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .secondaryLabel
        return label
    }()
    
    lazy var vStackView: UIStackView = {
        Components.buildVStackView(arrangedSubviews: [appetizerName, appetizerPrice])
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
            self.appetizerPrice.text = "R$\(String(format: "%.2f", model.price * 5))"
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

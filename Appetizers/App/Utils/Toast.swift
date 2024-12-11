//
//  Toast.swift
//  Appetizers
//
//  Created by Diggo Silva on 25/01/24.
//

import UIKit

class Toast {
    static let  shared = Toast()
    
    private init() {}
    
    private var toastContainer: UIView?
    
    func show(message: String, image: UIImage?, in view: UIView) {
        if let toastContainer {
            toastContainer.removeFromSuperview()
        }
        
        toastContainer = UIView()
        guard let container = toastContainer else { return }
        container.translatesAutoresizingMaskIntoConstraints = false
        container.backgroundColor = .accent
        container.layer.cornerRadius = 8
        container.clipsToBounds = true
        container.alpha = 0
        
        let toastImage = UIImageView(image: image)
        toastImage.translatesAutoresizingMaskIntoConstraints = false
        toastImage.contentMode = .scaleAspectFit
        toastImage.layer.cornerRadius = 25
        toastImage.clipsToBounds = true
        
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = .systemFont(ofSize: 16, weight: .bold)
        titleLabel.textAlignment = .left
        titleLabel.text = message
        titleLabel.numberOfLines = 0
        titleLabel.textColor = .white
        
        container.addSubview(toastImage)
        container.addSubview(titleLabel)
        
        view.addSubview(container)
        
        NSLayoutConstraint.activate([
            container.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -15),
            container.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            container.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -15),
            container.heightAnchor.constraint(greaterThanOrEqualToConstant: 56),
            
            toastImage.centerYAnchor.constraint(equalTo: container.centerYAnchor),
            toastImage.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 10),
            toastImage.widthAnchor.constraint(equalToConstant: 50),
            toastImage.heightAnchor.constraint(equalToConstant: 50),
            
            titleLabel.topAnchor.constraint(equalTo: container.topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: toastImage.trailingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -10),
            titleLabel.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -10),
        ])
        
        UIView.animate(withDuration: 0.5) {
            container.alpha = 1
        } completion: { _ in
            UIView.animate(withDuration: 0.5, delay: 2, options: .curveEaseOut) {
                container.alpha = 0
            } completion: { _ in
                container.removeFromSuperview()
            }
        }
    }
}

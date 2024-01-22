//
//  Components.swift
//  Appetizers
//
//  Created by Diggo Silva on 02/12/23.
//

import UIKit

struct Components {
    
    static func buildCardBG() -> UIView {
        let cardView = UIView()
        cardView.translatesAutoresizingMaskIntoConstraints = false
        cardView.layer.cornerRadius = 20
        cardView.clipsToBounds = true
        cardView.backgroundColor = .systemBackground
        return cardView
    }
    
    static func buildImage(image: UIImage? = nil, cornerRadius: CGFloat) -> UIImageView {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = image
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = cornerRadius
        imageView.clipsToBounds = true
        return imageView
    }
    
    static func buildLabel(text: String, textColor: UIColor = .label, fontSize: UIFont?, textAlignment: NSTextAlignment = .center) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        label.textColor = textColor
        label.font = fontSize
        label.textAlignment = textAlignment
        label.numberOfLines = 0
        return label
    }
    
    static func buildTextField(placeholder: String, keyboardType: UIKeyboardType) -> UITextField {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = placeholder
        textField.keyboardType = keyboardType
        return textField
    }
    
    static func buildButton(setTitle: String, setTitleColor: UIColor, font: UIFont, backgroundColor: UIColor, action: Selector) -> UIButton {
        let button = UIButton(type: .roundedRect)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(setTitle, for: .normal)
        button.setTitleColor(setTitleColor, for: .normal)
        button.titleLabel?.font = font
        button.backgroundColor = backgroundColor
        button.layer.cornerRadius = 10
        button.addTarget(self, action: action, for: .touchUpInside)
        return button
    }
    
    static func buildBG(backgroundColor: UIColor) -> UIView {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = backgroundColor
        view.layer.cornerRadius = 10
        return view
    }
    
    static func buildDatePicker() -> UIDatePicker {
        let datePicker = UIDatePicker()
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        datePicker.datePickerMode = .date
        datePicker.maximumDate = .now
        return datePicker
    }
    
    static func buildSwitch() -> UISwitch {
        let napSwitch = UISwitch()
        napSwitch.translatesAutoresizingMaskIntoConstraints = false
        napSwitch.onTintColor = .accent
        return napSwitch
    }
    
    static func buildHStackView(arrangedSubviews: [UIView], alignment: UIStackView.Alignment? = nil) -> UIStackView {
        let stack = UIStackView(arrangedSubviews: arrangedSubviews)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .fill
        stack.alignment = alignment ?? .center
        stack.spacing = 10
        stack.isLayoutMarginsRelativeArrangement = true
        stack.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        return stack
    }
    
    static func buildVStackView(arrangedSubviews: [UIView], spacing: CGFloat = 5, alignment: UIStackView.Alignment? = nil) -> UIStackView {
        let stack = UIStackView(arrangedSubviews: arrangedSubviews)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .fill
        stack.alignment = alignment ?? .center
        stack.spacing = spacing
        return stack
    }
}

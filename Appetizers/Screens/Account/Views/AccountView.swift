//
//  AccountView.swift
//  Appetizers
//
//  Created by Diggo Silva on 16/01/24.
//

import UIKit

protocol AccountViewDelegate: AnyObject {
    func didTapSaveChanges()
}

class AccountView: UIView {
    
    weak var delegate: AccountViewDelegate?
    
    //MARK: - INFO PERSONAL
    lazy var infoLabel: UILabel = {
        Components.buildLabel(text: "INFORMAÇÕES PESSOAIS", textColor: .secondaryLabel, fontSize: UIFont.systemFont(ofSize: 14))
    }()
    
    lazy var bgInfo: UIView = {
        Components.buildBG(backgroundColor: .white)
    }()
    
    lazy var textFieldName: UITextField = {
        Components.buildTextField(placeholder: "Nome", keyboardType: .default)
    }()
    
    lazy var separator1: UIView = {
        Components.buildBG(backgroundColor: .systemGray6)
    }()
    
    lazy var textFieldLastName: UITextField = {
        Components.buildTextField(placeholder: "Sobrenome", keyboardType: .default)
    }()
    
    lazy var separator2: UIView = {
        Components.buildBG(backgroundColor: .systemGray6)
    }()
    
    lazy var textFieldEmail: UITextField = {
        Components.buildTextField(placeholder: "Email", keyboardType: .emailAddress)
    }()
    
    lazy var separator3: UIView = {
        Components.buildBG(backgroundColor: .systemGray6)
    }()
    
    lazy var birthdayLabel: UILabel = {
        Components.buildLabel(text: "Aniversário", textColor: .label, fontSize: UIFont.systemFont(ofSize: 17))
    }()
    
    lazy var datePicker: UIDatePicker = {
        Components.buildDatePicker()
    }()
    
    lazy var separator4: UIView = {
        Components.buildBG(backgroundColor: .systemGray6)
    }()
    
    lazy var saveButton: UIButton = {
        Components.buildButton(setTitle: "Salvar Alterações", setTitleColor: .accent, font: .systemFont(ofSize: 17), backgroundColor: .clear, action: #selector(didTapSaveChanges))
    }()
    
    //MARK: - REQUESTS
    lazy var requestLabel: UILabel = {
        Components.buildLabel(text: "SOLICITAÇÕES", textColor: .secondaryLabel, fontSize: UIFont.systemFont(ofSize: 14))
    }()
    
    lazy var bgRequest: UIView = {
        Components.buildBG(backgroundColor: .white)
    }()
    
    lazy var napkinLabel: UILabel = {
        Components.buildLabel(text: "Guardanapos Extra", textColor: .label, fontSize: UIFont.systemFont(ofSize: 17))
    }()
    
    lazy var napkinSwitch: UISwitch = {
        Components.buildSwitch()
    }()
    
    lazy var separator5: UIView = {
        Components.buildBG(backgroundColor: .systemGray6)
    }()
    
    lazy var refillLabel: UILabel = {
        Components.buildLabel(text: "Refil na bebida", textColor: .label, fontSize: UIFont.systemFont(ofSize: 17))
    }()
    
    lazy var refillSwitch: UISwitch = {
        Components.buildSwitch()
    }()
    
    let padding: CGFloat = 10
    let paddingLeadingLabels: CGFloat = 20
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Actions
    @objc func didTapSaveChanges() {
        delegate?.didTapSaveChanges()
    }
    
    //MARK: - Methods
    func setupView() {
        backgroundColor = .systemGray6
        setHierarchy()
        setConstraints()
    }
    
    func setHierarchy() {
        addSubviews([infoLabel])
        addSubviews([bgInfo, textFieldName, separator1, textFieldLastName, separator2, textFieldEmail, separator3, birthdayLabel, datePicker, separator4, saveButton])
        addSubviews([requestLabel])
        addSubviews([bgRequest, napkinLabel, napkinSwitch, separator5, refillLabel, refillSwitch])
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            infoLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            infoLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            
            bgInfo.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: padding),
            bgInfo.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            bgInfo.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            textFieldName.topAnchor.constraint(equalTo: bgInfo.topAnchor, constant: padding),
            textFieldName.leadingAnchor.constraint(equalTo: bgInfo.leadingAnchor, constant: paddingLeadingLabels),
            textFieldName.trailingAnchor.constraint(equalTo: bgInfo.trailingAnchor, constant: -padding),
            
            separator1.topAnchor.constraint(equalTo: textFieldName.bottomAnchor, constant: padding),
            separator1.leadingAnchor.constraint(equalTo: bgInfo.leadingAnchor, constant: padding),
            separator1.trailingAnchor.constraint(equalTo: bgInfo.trailingAnchor),
            separator1.heightAnchor.constraint(equalToConstant: 1),
            
            textFieldLastName.topAnchor.constraint(equalTo: separator1.bottomAnchor, constant: padding),
            textFieldLastName.leadingAnchor.constraint(equalTo: bgInfo.leadingAnchor, constant: paddingLeadingLabels),
            textFieldLastName.trailingAnchor.constraint(equalTo: bgInfo.trailingAnchor, constant: -padding),
            
            separator2.topAnchor.constraint(equalTo: textFieldLastName.bottomAnchor, constant: padding),
            separator2.leadingAnchor.constraint(equalTo: bgInfo.leadingAnchor, constant: padding),
            separator2.trailingAnchor.constraint(equalTo: bgInfo.trailingAnchor),
            separator2.heightAnchor.constraint(equalToConstant: 1),
            
            textFieldEmail.topAnchor.constraint(equalTo: separator2.bottomAnchor, constant: padding),
            textFieldEmail.leadingAnchor.constraint(equalTo: bgInfo.leadingAnchor, constant: paddingLeadingLabels),
            textFieldEmail.trailingAnchor.constraint(equalTo: bgInfo.trailingAnchor, constant: -padding),
            
            separator3.topAnchor.constraint(equalTo: textFieldEmail.bottomAnchor, constant: padding),
            separator3.leadingAnchor.constraint(equalTo: bgInfo.leadingAnchor, constant: padding),
            separator3.trailingAnchor.constraint(equalTo: bgInfo.trailingAnchor),
            separator3.heightAnchor.constraint(equalToConstant: 1),
            
            birthdayLabel.topAnchor.constraint(equalTo: separator3.bottomAnchor, constant: padding),
            birthdayLabel.leadingAnchor.constraint(equalTo: bgInfo.leadingAnchor, constant: paddingLeadingLabels),
            
            datePicker.centerYAnchor.constraint(equalTo: birthdayLabel.centerYAnchor),
            datePicker.trailingAnchor.constraint(equalTo: bgInfo.trailingAnchor, constant: -padding),
            
            separator4.topAnchor.constraint(equalTo: birthdayLabel.bottomAnchor, constant: padding),
            separator4.leadingAnchor.constraint(equalTo: bgInfo.leadingAnchor, constant: padding),
            separator4.trailingAnchor.constraint(equalTo: bgInfo.trailingAnchor),
            separator4.heightAnchor.constraint(equalToConstant: 1),
            
            saveButton.topAnchor.constraint(equalTo: separator4.bottomAnchor, constant: padding),
            saveButton.leadingAnchor.constraint(equalTo: bgInfo.leadingAnchor, constant: paddingLeadingLabels),
            saveButton.bottomAnchor.constraint(equalTo: bgInfo.bottomAnchor, constant: -padding),
            saveButton.heightAnchor.constraint(equalToConstant: 24),
        ])
        
        NSLayoutConstraint.activate([
            requestLabel.topAnchor.constraint(equalTo: saveButton.bottomAnchor, constant: 40),
            requestLabel.leadingAnchor.constraint(equalTo: infoLabel.leadingAnchor),
            
            bgRequest.topAnchor.constraint(equalTo: requestLabel.bottomAnchor, constant: padding),
            bgRequest.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            bgRequest.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            napkinLabel.topAnchor.constraint(equalTo: bgRequest.topAnchor, constant: padding),
            napkinLabel.leadingAnchor.constraint(equalTo: bgRequest.leadingAnchor, constant: paddingLeadingLabels),
            
            napkinSwitch.centerYAnchor.constraint(equalTo: napkinLabel.centerYAnchor),
            napkinSwitch.trailingAnchor.constraint(equalTo: bgInfo.trailingAnchor, constant: -padding),
            
            separator5.topAnchor.constraint(equalTo: napkinLabel.bottomAnchor, constant: padding),
            separator5.leadingAnchor.constraint(equalTo: bgRequest.leadingAnchor, constant: padding),
            separator5.trailingAnchor.constraint(equalTo: bgRequest.trailingAnchor),
            separator5.heightAnchor.constraint(equalToConstant: 1),
            
            refillLabel.topAnchor.constraint(equalTo: separator5.bottomAnchor, constant: padding),
            refillLabel.leadingAnchor.constraint(equalTo: bgRequest.leadingAnchor, constant: paddingLeadingLabels),
            refillLabel.bottomAnchor.constraint(equalTo: bgRequest.bottomAnchor, constant: -padding),
            
            refillSwitch.centerYAnchor.constraint(equalTo: refillLabel.centerYAnchor),
            refillSwitch.trailingAnchor.constraint(equalTo: bgInfo.trailingAnchor, constant: -padding),
        ])
    }
}

//
//  PopupView.swift
//  GreenBank.CustomUIComponents
//
//  Created by Eprem Sargsyan on 19.03.24.
//

import UIKit

final public class PopupView: UIView {
    private let popUpView = Popup()
    
    private let confirmPasswordLabel = UILabel(text: "settings_confirm_password_text".localized,
                                               textColor: AppColor.accentDefault.uiColor,
                                               font: UIFont.systemFont(ofSize: 24))
    
    private let currentPasswordLabel = UILabel(text: "settiings_current_password_text".localized,
                                               textColor: AppColor.textGrey.uiColor,
                                               font: UIFont.systemFont(ofSize: 14))
    
    public var passwordTextField = SystemTextField(labelText: "settings_password_text".localized,
                                                   helperLabelText: "",
                                                   placeholder: "settings_your_password_text".localized,
                                                   rightImage: "eye",
                                                   isSecureTextEntry: true)
    
    public var continueBtn = UIButton(backgroundColor: AppColor.primaryDisable.uiColor,
                                      title: "settings_continue_btn_text".localized)
    
    public func setupUI() {
        popUpView.translatesAutoresizingMaskIntoConstraints = false
        confirmPasswordLabel.translatesAutoresizingMaskIntoConstraints = false
        currentPasswordLabel.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        continueBtn.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(popUpView)
        self.addSubview(confirmPasswordLabel)
        self.addSubview(currentPasswordLabel)
        self.addSubview(passwordTextField)
        self.addSubview(continueBtn)
        
        continueBtn.isEnabled = false 
        
        NSLayoutConstraint.activate([
            popUpView.widthAnchor.constraint(equalToConstant: 139),
            popUpView.heightAnchor.constraint(equalToConstant: 5),
            popUpView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            popUpView.topAnchor.constraint(equalTo: self.topAnchor, constant: 5)
        ])
        
        NSLayoutConstraint.activate([
            confirmPasswordLabel.topAnchor.constraint(equalTo: popUpView.bottomAnchor, constant: 40),
            confirmPasswordLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            currentPasswordLabel.topAnchor.constraint(equalTo: confirmPasswordLabel.bottomAnchor, constant: 30),
            currentPasswordLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16)
        ])
        
        NSLayoutConstraint.activate([
            passwordTextField.topAnchor.constraint(equalTo: currentPasswordLabel.bottomAnchor, constant: 16),
            passwordTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            passwordTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            passwordTextField.heightAnchor.constraint(equalToConstant: 94)
        ])
        
        NSLayoutConstraint.activate([
            continueBtn.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 30),
            continueBtn.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            continueBtn.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            continueBtn.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
}

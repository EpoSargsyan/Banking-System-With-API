//
//  ForgotPasswordView.swift
//  GreenBank
//
//  Created by Eprem Sargsyan on 01.02.24.
//

import UIKit
import GreenBank_CustomUIComponents

final public class ForgotPasswordView: UIView {
    let backButton = UIButton(backgroundColor: AppColor.cremeWhite.uiColor,
                              title: "",
                              image: "forgot_password_back".localized)
    
    private let forgotPaswLabel = UILabel(text: "forgot_password_text".localized,
                                          textColor: AppColor.textBlack.uiColor,
                                          font: UIFont.systemFont(ofSize: 24))
    
    private let enterEmailLabel = UILabel(text: "forgot_password_email_text".localized,
                                          textColor: AppColor.textGrey.uiColor,
                                          font: UIFont.systemFont(ofSize: 14))
    
    public var emailTextField = SystemTextField(labelText: "forgot_password_email".localized,
                                         helperLabelText: "",
                                         placeholder: "forgot_password_your_email".localized)
    
    let continueButton = UIButton(backgroundColor: AppColor.primaryDefault.uiColor,
                                  title: "forgot_password_continue".localized)
    
    func setupUI() {
        backButton.translatesAutoresizingMaskIntoConstraints = false
        forgotPaswLabel.translatesAutoresizingMaskIntoConstraints = false
        enterEmailLabel.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        continueButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(backButton)
        self.addSubview(forgotPaswLabel)
        self.addSubview(enterEmailLabel)
        self.addSubview(emailTextField)
        self.addSubview(continueButton)
        
        backButton.backgroundColor = .none
        
        enterEmailLabel.numberOfLines = 2
        
        continueButton.isEnabled = false
        continueButton.backgroundColor = AppColor.primaryDisable.uiColor
        
        emailTextField.textField.text = "epo777sargsyan+77@gmail.com"
        
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: self.topAnchor),
            backButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 11)
        ])
        
        NSLayoutConstraint.activate([
            forgotPaswLabel.topAnchor.constraint(equalTo: self.topAnchor),
            forgotPaswLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            enterEmailLabel.topAnchor.constraint(equalTo: forgotPaswLabel.bottomAnchor, constant: 18),
            enterEmailLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            enterEmailLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            enterEmailLabel.heightAnchor.constraint(equalToConstant: 48)
        ])
        
        NSLayoutConstraint.activate([
            emailTextField.topAnchor.constraint(equalTo: enterEmailLabel.bottomAnchor, constant: 30),
            emailTextField.leadingAnchor.constraint(equalTo: enterEmailLabel.leadingAnchor),
            emailTextField.trailingAnchor.constraint(equalTo: enterEmailLabel.trailingAnchor),
            emailTextField.heightAnchor.constraint(equalToConstant: 94)
        ])
        
        NSLayoutConstraint.activate([
            continueButton.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 421),
            continueButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            continueButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            continueButton.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
}

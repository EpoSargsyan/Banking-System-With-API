//
//  ResetPasswordView.swift
//  GreenBank
//
//  Created by Eprem Sargsyan on 06.02.24.
//

import UIKit
import GreenBank_CustomUIComponents

final public class ResetPasswordView: UIView {
    let backButton = UIButton(backgroundColor: AppColor.cremeWhite.uiColor,
                              title: "",
                              image: "forgot_password_back".localized)
    
    private let resetPasswordLabel = UILabel(text: "reset_password_text".localized,
                                             textColor: AppColor.textBlack.uiColor,
                                             font: UIFont.systemFont(ofSize: 24))
    
    private let newPasswordLabel = UILabel(text: "reset_password_new_password".localized,
                                           textColor: AppColor.textGrey.uiColor,
                                           font: UIFont.systemFont(ofSize: 14))
    
    let passwordTextField = SystemTextField(labelText: "reset_password_password_label".localized,
                                            helperLabelText: "",
                                            placeholder: "reset_password_password_placeholder".localized,
                                            rightImage: "reset_password_eye_image".localized)
    
    let confirmPasswordTextField = SystemTextField(labelText: "reset_password_confirm_password_label".localized,
                                                   helperLabelText: "",
                                                   placeholder: "reset_password_confirm_password_placeholder".localized,
                                                   rightImage: "reset_password_eye_image".localized)
    
    lazy var textFieldStack = UIStackView(arrangedSubviews: [passwordTextField,
                                                             confirmPasswordTextField],
                                          axis: .vertical,
                                          spacing: 6)
    
    let continueButton = UIButton(backgroundColor: AppColor.primaryDefault.uiColor,
                                  title: "reset_password_continue".localized)
    
    func setupUI() {
        backButton.translatesAutoresizingMaskIntoConstraints = false
        resetPasswordLabel.translatesAutoresizingMaskIntoConstraints = false
        newPasswordLabel.translatesAutoresizingMaskIntoConstraints = false
        textFieldStack.translatesAutoresizingMaskIntoConstraints = false
        continueButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(backButton)
        self.addSubview(resetPasswordLabel)
        self.addSubview(newPasswordLabel)
        self.addSubview(textFieldStack)
        self.addSubview(continueButton)
        
        newPasswordLabel.numberOfLines = 2
        
        continueButton.isEnabled = false
        continueButton.backgroundColor = AppColor.primaryDisable.uiColor
        
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: self.topAnchor),
            backButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 11)
        ])
        
        NSLayoutConstraint.activate([
            resetPasswordLabel.topAnchor.constraint(equalTo: self.topAnchor),
            resetPasswordLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            newPasswordLabel.topAnchor.constraint(equalTo: resetPasswordLabel.bottomAnchor, constant: 18),
            newPasswordLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 18),
            newPasswordLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -18)
        ])
        
        NSLayoutConstraint.activate([
            textFieldStack.topAnchor.constraint(equalTo: newPasswordLabel.bottomAnchor, constant: 30),
            textFieldStack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            textFieldStack.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            textFieldStack.heightAnchor.constraint(equalToConstant: 194)
        ])
        
        NSLayoutConstraint.activate([
            continueButton.topAnchor.constraint(equalTo: textFieldStack.bottomAnchor, constant: 324),
            continueButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            continueButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            continueButton.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
}

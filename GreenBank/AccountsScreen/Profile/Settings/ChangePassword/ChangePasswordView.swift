//
//  ChangePasswordView.swift
//  GreenBank
//
//  Created by Eprem Sargsyan on 25.03.24.
//

import UIKit
import GreenBank_CustomUIComponents

final class ChangePasswordView: UIView {
    public let backButton = UIButton(backgroundColor: AppColor.cremeWhite.uiColor,
                                     title: "",
                                     image: "forgot_password_back".localized)
    
    private let changePassword = UILabel(text: "settings_change_password".localized,
                                            textColor: AppColor.accentDefault.uiColor,
                                            font: UIFont.systemFont(ofSize: 17))
    
    private let enterNewPassword = UILabel(text: "settings_enter_new_password_label".localized,
                                           textColor: AppColor.textGrey.uiColor,
                                           font: UIFont.systemFont(ofSize: 14))

    public var newPasswordTextField = SystemTextField(labelText: "settings_new_password".localized,
                                                   helperLabelText: "",
                                                   placeholder: "settings_enter_new_password".localized,
                                                   rightImage: "eye",
                                                   isSecureTextEntry: true)
    
    public var confirmPasswordTextField = SystemTextField(labelText: "settings_confirm_password_text".localized,
                                                   helperLabelText: "",
                                                   placeholder: "settings_re_enter_new_password".localized,
                                                   rightImage: "eye",
                                                   isSecureTextEntry: true)
    
    public var saveButton = UIButton(backgroundColor: AppColor.primaryDisable.uiColor,
                                     title: "settings_save_btn".localized)
    
    lazy var stackView = UIStackView(arrangedSubviews: [newPasswordTextField,
                                                        confirmPasswordTextField],
                                     axis: .vertical, spacing: 10)
    
    func setupUI() {
        backButton.translatesAutoresizingMaskIntoConstraints = false
        changePassword.translatesAutoresizingMaskIntoConstraints = false
        enterNewPassword.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(backButton)
        self.addSubview(changePassword)
        self.addSubview(enterNewPassword)
        self.addSubview(stackView)
        self.addSubview(saveButton)
        
        saveButton.isEnabled = false
        
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            backButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
        ])
        
        NSLayoutConstraint.activate([
            changePassword.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            changePassword.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            enterNewPassword.topAnchor.constraint(equalTo: changePassword.bottomAnchor, constant: 45),
            enterNewPassword.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15)
        ])
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: enterNewPassword.bottomAnchor, constant: 32),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            stackView.heightAnchor.constraint(equalToConstant: 198)
        ])
        
        NSLayoutConstraint.activate([
            saveButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 348),
            saveButton.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            saveButton.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            saveButton.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
}

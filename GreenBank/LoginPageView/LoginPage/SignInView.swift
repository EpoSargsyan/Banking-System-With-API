//
//  SignInView.swift
//  GreenBank
//
//  Created by Eprem Sargsyan on 31.01.24.
//

import UIKit
import GreenBank_CustomUIComponents

public class SignInView: UIView {
    private let logo = UIImageView(image: UIImage(named: "login_logo".localized))
    
    private let signInLabel = UILabel(text: "login_loginButton_placeholder".localized,
                                      textColor: AppColor.textBlack.uiColor,
                                      font: UIFont.systemFont(ofSize: 24))
    
    var emailTextField = SystemTextField(labelText: "login_email_title".localized,
                                                 helperLabelText: "",
                                                 placeholder: "login_email_placeholder".localized)
    
    var passwordTextField = SystemTextField(labelText: "login_password_label".localized,
                                            helperLabelText: "",
                                            placeholder: "login_password_placeholder".localized,
                                            rightImage: "eye",
                                            isSecureTextEntry: true)
    
    let forgotPasswordButton = UIButton(backgroundColor: AppColor.cremeWhite.uiColor,
                                        title: "login_forgotButton".localized,
                                        textColor: AppColor.textGrey.uiColor)
    
    private lazy var emailPaswStackView = UIStackView(arrangedSubviews: [emailTextField,
                                                                         passwordTextField],
                                                      axis: .vertical, spacing: 6)
    
    let signInButon = UIButton(backgroundColor: AppColor.primaryDefault.uiColor,
                               title: "login_sigin_text".localized)
    
    private let questionLabel = UILabel(text: "login_questionButton".localized,
                                        textColor: AppColor.textBlack.uiColor,
                                        font: UIFont.systemFont(ofSize: 16))
    
    let signUpButton = UIButton(backgroundColor: AppColor.cremeWhite.uiColor,
                                        title: "login_signup_button".localized,
                                        textColor: AppColor.primaryDefault.uiColor)
    
    private lazy var questionSignupStack = UIStackView(arrangedSubviews: [questionLabel,                                                                       signUpButton],
                                                       axis: .horizontal,
                                                       spacing: 5)
    
    func setupUI() {
        logo.translatesAutoresizingMaskIntoConstraints = false
        signInLabel.translatesAutoresizingMaskIntoConstraints = false
        emailPaswStackView.translatesAutoresizingMaskIntoConstraints = false
        forgotPasswordButton.translatesAutoresizingMaskIntoConstraints = false
        signInButon.translatesAutoresizingMaskIntoConstraints = false
        questionSignupStack.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(logo)
        self.addSubview(signInLabel)
        self.addSubview(emailPaswStackView)
        self.addSubview(forgotPasswordButton)
        self.addSubview(signInButon)
        self.addSubview(questionSignupStack)
        
        emailTextField.textField.text = "epo777sargsyan+38@gmail.com"
        passwordTextField.textField.text = "Asdf1234"
        
        questionSignupStack.distribution = .fillProportionally
        forgotPasswordButton.setTitleColor(.lightGray, for: .highlighted)
        signInButon.isEnabled = false
        signInButon.backgroundColor = AppColor.primaryDisable.uiColor
        
        NSLayoutConstraint.activate([
            logo.topAnchor.constraint(equalTo: self.topAnchor, constant: 71),
            logo.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            signInLabel.topAnchor.constraint(equalTo: logo.bottomAnchor),
            signInLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            emailPaswStackView.topAnchor.constraint(equalTo: signInLabel.bottomAnchor, constant: 47),
            emailPaswStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            emailPaswStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            emailPaswStackView.heightAnchor.constraint(equalToConstant: 194)
        ])
        
        NSLayoutConstraint.activate([
            forgotPasswordButton.topAnchor.constraint(equalTo: passwordTextField.textField.bottomAnchor),
            forgotPasswordButton.trailingAnchor.constraint(equalTo: passwordTextField.textField.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            signInButon.topAnchor.constraint(equalTo: emailPaswStackView.bottomAnchor, constant: 346),
            signInButon.leadingAnchor.constraint(equalTo: emailPaswStackView.leadingAnchor),
            signInButon.trailingAnchor.constraint(equalTo: emailPaswStackView.trailingAnchor),
            signInButon.heightAnchor.constraint(equalToConstant: 48)
        ])
        
        NSLayoutConstraint.activate([
            questionSignupStack.topAnchor.constraint(equalTo: signInButon.bottomAnchor, constant: 12),
            questionSignupStack.centerXAnchor.constraint(equalTo: self.centerXAnchor),
        ])
    }
}

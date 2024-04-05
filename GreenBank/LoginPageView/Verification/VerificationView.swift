//
//  VerificationView.swift
//  GreenBank
//
//  Created by Eprem Sargsyan on 02.02.24.
//

import UIKit
import GreenBank_CustomUIComponents

final public class VerificationView: UIView {
    let backButton = UIButton(backgroundColor: AppColor.cremeWhite.uiColor,
                              title: "",
                              image: "forgot_password_back".localized)
    
    private let verificationLabel = UILabel(text: "verification".localized,
                                            textColor: AppColor.textBlack.uiColor,
                                            font: UIFont.systemFont(ofSize: 24))
    
    private let digitsTextLabel = UILabel(text: "verification_digits_text".localized,
                                          textColor: AppColor.textGrey.uiColor,
                                          font: UIFont.systemFont(ofSize: 14))
    
    let digitsView = DigitsView()
    
    let continueButton = UIButton(backgroundColor: AppColor.primaryDefault.uiColor,
                                          title: "verification_continue".localized)
    
    func setupUI() {
        digitsView.setupUI()
        
        backButton.translatesAutoresizingMaskIntoConstraints = false
        verificationLabel.translatesAutoresizingMaskIntoConstraints = false
        digitsTextLabel.translatesAutoresizingMaskIntoConstraints = false
        digitsView.translatesAutoresizingMaskIntoConstraints = false
        continueButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(backButton)
        self.addSubview(verificationLabel)
        self.addSubview(digitsTextLabel)
        self.addSubview(digitsView)
        self.addSubview(continueButton)
        
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: self.topAnchor),
            backButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 11)
        ])
        
        NSLayoutConstraint.activate([
            verificationLabel.topAnchor.constraint(equalTo: self.topAnchor),
            verificationLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            digitsTextLabel.topAnchor.constraint(equalTo: verificationLabel.bottomAnchor, constant: 18),
            digitsTextLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            digitsView.topAnchor.constraint(equalTo: digitsTextLabel.bottomAnchor, constant: 30),
            digitsView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 64),
            digitsView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -65),
            digitsView.heightAnchor.constraint(equalToConstant: 48)
        ])
        
        NSLayoutConstraint.activate([
            continueButton.topAnchor.constraint(equalTo: digitsView.bottomAnchor, constant: 491),
            continueButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            continueButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            continueButton.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
}

//
//  SignUpSuccessView.swift
//  GreenBank
//
//  Created by Eprem Sargsyan on 16.02.24.
//

import UIKit
import GreenBank_CustomUIComponents

final public class SignUpSuccessView: UIView {
    
    private let backgroundImage = UIImageView(image: UIImage(named: "signup_success_logo".localized))
    
    private let succesfullyLabel = UILabel(text: "signup_success_text".localized,
                                           textColor: AppColor.textBlack.uiColor,
                                           font: UIFont.systemFont(ofSize: 14))
    
    let continueBtn = UIButton(backgroundColor: AppColor.primaryDefault.uiColor,
                              title: "signup_success_button_text".localized)
    
    func setupUI() {
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        succesfullyLabel.translatesAutoresizingMaskIntoConstraints = false
        continueBtn.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(backgroundImage)
        self.addSubview(succesfullyLabel)
        self.addSubview(continueBtn)
        
        succesfullyLabel.numberOfLines = 2
        succesfullyLabel.textAlignment = .center
        
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 218),
            backgroundImage.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            succesfullyLabel.topAnchor.constraint(equalTo: backgroundImage.bottomAnchor, constant: 65),
            succesfullyLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            continueBtn.topAnchor.constraint(equalTo: succesfullyLabel.bottomAnchor, constant: 138),
            continueBtn.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            continueBtn.heightAnchor.constraint(equalToConstant: 48),
            continueBtn.widthAnchor.constraint(equalToConstant: 361)
        ])
    }
}


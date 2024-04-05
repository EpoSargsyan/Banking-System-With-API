//
//  PasswordChangedView.swift
//  GreenBank
//
//  Created by Eprem Sargsyan on 06.02.24.
//

import UIKit
import GreenBank_CustomUIComponents

final public class PasswordChangedView: UIView {
    
    private let backgroundImage = UIImageView(image: UIImage(named: "password_changed_image".localized))
    
    private let succesfullyLabel = UILabel(text: "password_changed_succesfully".localized,
                                           textColor: AppColor.textBlack.uiColor,
                                           font: UIFont.systemFont(ofSize: 14))
    
    let doneButton = UIButton(backgroundColor: AppColor.primaryDefault.uiColor,
                              title: "password_changed_continue".localized)
    
    func setupUI() {
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        succesfullyLabel.translatesAutoresizingMaskIntoConstraints = false
        doneButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(backgroundImage)
        self.addSubview(succesfullyLabel)
        self.addSubview(doneButton)
        
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 218),
            backgroundImage.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            succesfullyLabel.topAnchor.constraint(equalTo: backgroundImage.bottomAnchor, constant: 65),
            succesfullyLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            doneButton.topAnchor.constraint(equalTo: succesfullyLabel.bottomAnchor, constant: 138),
            doneButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            doneButton.heightAnchor.constraint(equalToConstant: 48),
            doneButton.widthAnchor.constraint(equalToConstant: 361)
        ])
    }
}

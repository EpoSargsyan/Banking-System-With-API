//
//  RequestCompletedView.swift
//  GreenBank
//
//  Created by Eprem Sargsyan on 23.02.24.
//

import UIKit
import GreenBank_CustomUIComponents

final class RequestCompletedView: UIView {
    private let backgroundImage = UIImageView(image: UIImage(named: "new_account_done_logo".localized))
    
    private let successText = UILabel(text: "new_account_success_text".localized,
                                      textColor: AppColor.textDarkGrey.uiColor,
                                      font: UIFont.systemFont(ofSize: 17))
    
    let countinueBtn = UIButton(backgroundColor: AppColor.primaryDefault.uiColor,
                                title: "new_account_countinue_text".localized)
    
    func setupUI() {
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        successText.translatesAutoresizingMaskIntoConstraints = false
        countinueBtn.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(backgroundImage)
        self.addSubview(successText)
        self.addSubview(countinueBtn)
        
        successText.textAlignment = .center
        successText.numberOfLines = 2
        
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 218),
            backgroundImage.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            successText.topAnchor.constraint(equalTo: backgroundImage.bottomAnchor, constant: 65),
            successText.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            successText.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -39)
        ])
        
        NSLayoutConstraint.activate([
            countinueBtn.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -76),
            countinueBtn.heightAnchor.constraint(equalToConstant: 48),
            countinueBtn.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            countinueBtn.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        ])
    }
}

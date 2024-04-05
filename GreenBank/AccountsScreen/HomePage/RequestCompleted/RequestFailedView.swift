//
//  RequestFailedView.swift
//  GreenBank
//
//  Created by Eprem Sargsyan on 29.02.24.
//

import UIKit
import GreenBank_CustomUIComponents

final class RequestFailedView: UIView {
    private let backgroundImage = UIImageView(image: UIImage(named: "new_account_request_failed_image".localized))
    
    private let requestFailedLabel = UILabel(text: "new_account_failed_text".localized,
                                             textColor: AppColor.textDarkGrey.uiColor,
                                             font: UIFont.systemFont(ofSize: 17))
    
    let countinueBtn = UIButton(backgroundColor: AppColor.primaryDefault.uiColor,
                                title: "new_account_countinue_text".localized)
    
    func setupUI() {
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        requestFailedLabel.translatesAutoresizingMaskIntoConstraints = false
        countinueBtn.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(backgroundImage)
        self.addSubview(requestFailedLabel)
        self.addSubview(countinueBtn)
        
        requestFailedLabel.numberOfLines = 2
        requestFailedLabel.textAlignment = .center
        
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 194),
            backgroundImage.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            requestFailedLabel.topAnchor.constraint(equalTo: backgroundImage.bottomAnchor, constant: 65),
            requestFailedLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 59),
            requestFailedLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -59)
        ])
        
        NSLayoutConstraint.activate([
            countinueBtn.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -76),
            countinueBtn.heightAnchor.constraint(equalToConstant: 48),
            countinueBtn.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            countinueBtn.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        ])
    }
}

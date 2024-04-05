//
//  PrivacyPolicyView.swift
//  GreenBank
//
//  Created by Eprem Sargsyan on 19.03.24.
//

import UIKit
import GreenBank_CustomUIComponents

final class PrivacyPolicyView: UIView {
    public let backButton = UIButton(backgroundColor: AppColor.cremeWhite.uiColor,
                                     title: "",
                                     image: "forgot_password_back".localized)
    
    private let privacyPolicyLabel = UILabel(text: "privacy_policy_label_text".localized,
                                            textColor: AppColor.accentDefault.uiColor,
                                            font: UIFont.systemFont(ofSize: 17))
    
    let label = UILabel(text: "privacy_policy_text".localized,
                        textColor: AppColor.textBlack.uiColor, font: UIFont.systemFont(ofSize: 15))
    
    var contentView = UIView()
    var scrollView = UIScrollView()
    
    func setupUI() {
        backButton.translatesAutoresizingMaskIntoConstraints = false
        privacyPolicyLabel.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        
        self.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(backButton)
        contentView.addSubview(privacyPolicyLabel)
        contentView.addSubview(label)
        
        self.backgroundColor = AppColor.cremeWhite.uiColor
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
        
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: contentView.topAnchor),
            backButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
        ])
        
        NSLayoutConstraint.activate([
            privacyPolicyLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            privacyPolicyLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: privacyPolicyLabel.bottomAnchor, constant: 30),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}

//
//  AccountTransfersView.swift
//  GreenBank
//
//  Created by Eprem Sargsyan on 28.03.24.
//

import UIKit
import GreenBank_CustomUIComponents

final class AccountTransfersView: UIView {
    public let backButton = UIButton(backgroundColor: AppColor.cremeWhite.uiColor,
                                     title: "",
                                     image: "forgot_password_back".localized)
    
    private let accountTransferLabel = UILabel(text: "transfer_account_label".localized,
                                            textColor: AppColor.accentDefault.uiColor,
                                            font: UIFont.systemFont(ofSize: 17))
    
    public var accountPicker = CustomPicker(rightImageName: "down",
                                            leftImageName: "account-home",
                                            placeholder: "transfer_account_picker_placeholder".localized,
                                            tableViewHeight: 194,
                                            isAccountPicker: true)
    
    public var amountTF = SystemTextField(labelText: "Amount", placeholder: "0.0")
    
    public var creditAccountTF = SystemTextField(labelText: "Credit account",
                                                 placeholder: "Add a credit account")
    
    public var accountPicker2 = CustomPicker(rightImageName: "down",
                                             leftImageName: "account-home",
                                             placeholder: "",
                                             tableViewHeight: 194,
                                             isAccountPicker: true)
    
    public var purposeTF = SystemTextField(labelText: "Porpuse (optional)",
                                           placeholder: "You can add payment purpose")
    
    public var transferBtn = UIButton(backgroundColor: AppColor.primaryDefault.uiColor,
                                      title: "Transfer")
    
    func setupUI() {
        backButton.translatesAutoresizingMaskIntoConstraints = false
        accountTransferLabel.translatesAutoresizingMaskIntoConstraints = false
        accountPicker.translatesAutoresizingMaskIntoConstraints = false
        amountTF.translatesAutoresizingMaskIntoConstraints = false
        creditAccountTF.translatesAutoresizingMaskIntoConstraints = false
        accountPicker2.translatesAutoresizingMaskIntoConstraints = false
        purposeTF.translatesAutoresizingMaskIntoConstraints = false
        transferBtn.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(backButton)
        self.addSubview(accountTransferLabel)
        self.addSubview(accountPicker)
        self.addSubview(amountTF)
        self.addSubview(creditAccountTF)
        self.addSubview(accountPicker2)
        self.addSubview(purposeTF)
        self.addSubview(transferBtn)
        
        self.backgroundColor = AppColor.cremeWhite.uiColor
        accountPicker.selectedTextField.layer.cornerRadius = 8
        accountPicker.customTable.isScrollEnabled = true
        accountPicker2.selectedTextField.layer.cornerRadius = 8
        accountPicker2.customTable.isScrollEnabled = true
        amountTF.textField.textAlignment = .right
        
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            backButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
        ])
        
        NSLayoutConstraint.activate([
            accountTransferLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            accountTransferLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            accountPicker.topAnchor.constraint(equalTo: accountTransferLabel.bottomAnchor, constant: 32),
            accountPicker.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            accountPicker.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            accountPicker.heightAnchor.constraint(equalToConstant: 48)
        ])
        
        NSLayoutConstraint.activate([
            amountTF.topAnchor.constraint(equalTo: accountPicker.bottomAnchor, constant: 30),
            amountTF.leadingAnchor.constraint(equalTo: accountPicker.leadingAnchor),
            amountTF.trailingAnchor.constraint(equalTo: accountPicker.trailingAnchor),
            amountTF.heightAnchor.constraint(equalToConstant: 94)
        ])
        
        NSLayoutConstraint.activate([
            creditAccountTF.topAnchor.constraint(equalTo: amountTF.bottomAnchor, constant: 10),
            creditAccountTF.leadingAnchor.constraint(equalTo: amountTF.leadingAnchor),
            creditAccountTF.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -90),
            creditAccountTF.heightAnchor.constraint(equalToConstant: 94)
        ])
        
        NSLayoutConstraint.activate([
            accountPicker2.centerYAnchor.constraint(equalTo: creditAccountTF.centerYAnchor),
            accountPicker2.leadingAnchor.constraint(equalTo: creditAccountTF.trailingAnchor, constant: 7),
            accountPicker2.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            accountPicker2.heightAnchor.constraint(equalToConstant: 48)
        ])
        
        NSLayoutConstraint.activate([
            purposeTF.topAnchor.constraint(equalTo: creditAccountTF.bottomAnchor, constant: 10),
            purposeTF.leadingAnchor.constraint(equalTo: accountPicker.leadingAnchor),
            purposeTF.trailingAnchor.constraint(equalTo: accountPicker.trailingAnchor),
            purposeTF.heightAnchor.constraint(equalToConstant: 94)
        ])
        
        NSLayoutConstraint.activate([
            transferBtn.topAnchor.constraint(equalTo: purposeTF.bottomAnchor, constant: 220),
            transferBtn.leadingAnchor.constraint(equalTo: accountPicker.leadingAnchor),
            transferBtn.trailingAnchor.constraint(equalTo: accountPicker.trailingAnchor),
            transferBtn.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
}

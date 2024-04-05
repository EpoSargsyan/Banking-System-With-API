//
//  NewAccountView.swift
//  GreenBank
//
//  Created by Eprem Sargsyan on 20.02.24.
//

import UIKit
import GreenBank_CustomUIComponents

final public class NewAccountView: UIView {
    let backButton = UIButton(backgroundColor: AppColor.cremeWhite.uiColor,
                              title: "",
                              image: "forgot_password_back".localized)
    
    private let newAccountLabel = UILabel(text: "new_account_text".localized,
                                          textColor: AppColor.textBlack.uiColor,
                                          font: UIFont.systemFont(ofSize: 17))
    
    var accountPicker = CustomPicker(rightImageName: "icon_drop_down".localized,
                                     leftImageName: "icon_credit_card".localized,
                                     placeholder: "new_account_select_acc".localized,
                                     tableViewHeight: 96,
                                     currencyData: ["new_account_current_acc".localized,
                                                    "new_account_saving_acc".localized],
                                     currencyIcons: ["icon_bag".localized,
                                                     "icon_coins".localized])
    
    var currencyPicker = CustomPicker(rightImageName: "icon_drop_down".localized,
                                      leftImageName: "icon_dollar".localized,
                                      placeholder: "new_account_select_currency".localized,
                                      tableViewHeight: 190,
                                      currencyData: ["new_account_usd".localized,
                                                     "new_account_eur".localized,
                                                     "new_account_rub".localized,
                                                     "new_account_amd".localized],
                                      currencyIcons: ["icon_dollar".localized,
                                                      "icon_eur".localized,
                                                      "icon_rub".localized,
                                                      "icon_amd".localized])
    
    var accountName = SystemTextField(labelText: "new_account_label_text".localized,
                                      placeholder: "new_account_textfield_text".localized)
    
    var requestButton = UIButton(backgroundColor: AppColor.primaryDefault.uiColor,
                                 title: "new_account_btn_text".localized)
    
    func setupUI() {
        backButton.translatesAutoresizingMaskIntoConstraints = false
        newAccountLabel.translatesAutoresizingMaskIntoConstraints = false
        accountPicker.translatesAutoresizingMaskIntoConstraints = false
        currencyPicker.translatesAutoresizingMaskIntoConstraints = false
        accountName.translatesAutoresizingMaskIntoConstraints = false
        requestButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(backButton)
        self.addSubview(newAccountLabel)
        self.addSubview(accountPicker)
        self.addSubview(currencyPicker)
        self.addSubview(accountName)
        self.addSubview(requestButton)
        
        self.backgroundColor = AppColor.cremeWhite.uiColor
        accountPicker.selectedTextField.layer.cornerRadius = 8
        currencyPicker.selectedTextField.layer.cornerRadius = 8
//        requestButton.isEnabled = false
        
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            backButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12)
        ])
        
        NSLayoutConstraint.activate([
            newAccountLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            newAccountLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            accountPicker.topAnchor.constraint(equalTo: newAccountLabel.bottomAnchor, constant: 35),
            accountPicker.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            accountPicker.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            accountPicker.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            currencyPicker.topAnchor.constraint(equalTo: accountPicker.selectedTextField.bottomAnchor, constant: 30),
            currencyPicker.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            currencyPicker.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            currencyPicker.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            accountName.topAnchor.constraint(equalTo: currencyPicker.selectedTextField.bottomAnchor, constant: 30),
            accountName.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            accountName.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            accountName.heightAnchor.constraint(equalToConstant: 94)
        ])
        
        NSLayoutConstraint.activate([
            requestButton.topAnchor.constraint(equalTo: accountName.bottomAnchor, constant: 354),
            requestButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            requestButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            requestButton.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
}

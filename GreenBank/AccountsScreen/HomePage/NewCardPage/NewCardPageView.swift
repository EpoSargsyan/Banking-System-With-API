//
//  NewCardPageView.swift
//  GreenBank
//
//  Created by Anna Hakobyan on 12.03.24.
//

import UIKit
import GreenBank_CustomUIComponents

public class NewCardPageView: UIView {
    let backButton = UIButton(backgroundColor: AppColor.cremeWhite.uiColor,
                              title: "",
                              image: "back")
    
    private let newCardLabel = UILabel(text: "newCard_topLabel".localized,
                                          textColor: AppColor.accentDefault.uiColor,
                                          font: UIFont.systemFont(ofSize: 17))
    
    let cardTypePicker = CustomPicker(rightImageName: "drop-down",
                                      leftImageName: "credit-card",
                                      placeholder: "newCard_cardType".localized, 
                                      tableViewHeight: 98,
                                      currencyData: ["Master",
                                                     "Visa"],
                                      currencyIcons: ["masterCard",
                                                      "visa-card"])
    
    let accountPicker = CustomPicker(rightImageName: "drop-down",
                                     leftImageName: "account-home",
                                     placeholder: "newCard_account".localized, 
                                     tableViewHeight: 242,
                                     isAccountPicker: true)
    
    var currencyPicker = CustomPicker(rightImageName: "icon_drop_down".localized,
                                      leftImageName: "icon_dollar".localized,
                                      placeholder: "new_account_select_currency".localized, 
                                      tableViewHeight: 194,
                                      currencyData: ["new_account_usd".localized,
                                                     "new_account_eur".localized,
                                                     "new_account_rub".localized,
                                                     "new_account_amd".localized],
                                      currencyIcons: ["icon_dollar".localized,
                                                      "icon_eur".localized,
                                                      "icon_rub".localized,
                                                      "icon_amd".localized])
    
    var accountName = SystemTextField(labelText: "newCard_cardName".localized,
                                      placeholder: "newCard_cardNamePlaceHolder".localized)
    
    var requestButton = UIButton(backgroundColor: AppColor.primaryDisable.uiColor,
                                 title: "new_account_btn_text".localized)
    
    func setupUI() {
        backButton.translatesAutoresizingMaskIntoConstraints = false
        newCardLabel.translatesAutoresizingMaskIntoConstraints = false
        cardTypePicker.translatesAutoresizingMaskIntoConstraints = false
        accountPicker.translatesAutoresizingMaskIntoConstraints = false
        currencyPicker.translatesAutoresizingMaskIntoConstraints = false
        accountName.translatesAutoresizingMaskIntoConstraints = false
        requestButton.translatesAutoresizingMaskIntoConstraints = false
    
        self.addSubview(backButton)
        self.addSubview(newCardLabel)
        self.addSubview(cardTypePicker)
        self.addSubview(accountPicker)
        self.addSubview(currencyPicker)
        self.addSubview(accountName)
        self.addSubview(requestButton)
        
        accountPicker.customTable.isScrollEnabled = true
        
        self.backgroundColor = AppColor.cremeWhite.uiColor

        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            backButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
        ])
        
        NSLayoutConstraint.activate([
            newCardLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            newCardLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            newCardLabel.centerYAnchor.constraint(equalTo: backButton.centerYAnchor),
            newCardLabel.heightAnchor.constraint(equalToConstant: 32)
        ])
        
        NSLayoutConstraint.activate([
            cardTypePicker.topAnchor.constraint(equalTo: newCardLabel.bottomAnchor, constant: 32),
            cardTypePicker.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            cardTypePicker.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            cardTypePicker.heightAnchor.constraint(equalToConstant: 140)
        ])
        
        NSLayoutConstraint.activate([
            accountPicker.topAnchor.constraint(equalTo: cardTypePicker.selectedTextField.bottomAnchor, constant: 30),
            accountPicker.trailingAnchor.constraint(equalTo: cardTypePicker.trailingAnchor),
            accountPicker.leadingAnchor.constraint(equalTo: cardTypePicker.leadingAnchor),
            accountPicker.heightAnchor.constraint(equalToConstant: 300)
        ])
        
        NSLayoutConstraint.activate([
            currencyPicker.topAnchor.constraint(equalTo: accountPicker.selectedTextField.bottomAnchor, constant: 30),
            currencyPicker.trailingAnchor.constraint(equalTo: accountPicker.trailingAnchor),
            currencyPicker.leadingAnchor.constraint(equalTo: accountPicker.leadingAnchor),
            currencyPicker.heightAnchor.constraint(equalToConstant: 235)
        ])
        
        NSLayoutConstraint.activate([
            accountName.topAnchor.constraint(equalTo: currencyPicker.selectedTextField.bottomAnchor, constant: 30),
            accountName.trailingAnchor.constraint(equalTo: currencyPicker.trailingAnchor),
            accountName.leadingAnchor.constraint(equalTo: currencyPicker.leadingAnchor),
            accountName.heightAnchor.constraint(equalToConstant: 94)
        ])
        
        NSLayoutConstraint.activate([
            requestButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -76),
            requestButton.trailingAnchor.constraint(equalTo: currencyPicker.trailingAnchor),
            requestButton.leadingAnchor.constraint(equalTo: currencyPicker.leadingAnchor),
            requestButton.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
}

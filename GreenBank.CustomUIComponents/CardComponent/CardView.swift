//
//  CardView.swift
//  GreenBank.CustomUIComponents
//
//  Created by Anna Hakobyan on 05.02.24.
//

import UIKit

public class Card: UIView {
    private let balanceLabel = UILabel(text: "cards_balanceLabel".localized, textColor: AppColor.grey100.uiColor, font: UIFont.systemFont(ofSize: 14))
    
    public let currentBalance = UILabel(text: "", textColor: AppColor.cremeWhite.uiColor,
                                        font: UIFont.systemFont(ofSize: 28))
    
    public var cardType = UIImageView()
    
    public var cardTypeName = String()//for keeping the name of caardtype
    
    public var data = UILabel(text: "12/26", textColor: AppColor.cremeWhite.uiColor,
                              font: UIFont.systemFont(ofSize: 14))
    
    public let fullName = UILabel(text: "fullName", textColor: AppColor.cremeWhite.uiColor,
                              font: UIFont.systemFont(ofSize: 16))
    
    public let accountNumber = UILabel(text: "", textColor: AppColor.cremeWhite.uiColor,
                                       font: UIFont.systemFont(ofSize: 14))
    
    public var accountnumber = String()
    
    public var currency: String?
    
    public let background = UIView()
    
    public var colorGradient: [String] = []
    
    func containsOnlyNumbers(_ input: String) -> Bool {
        let nonNumericCharacters = CharacterSet.decimalDigits.inverted
        return input.rangeOfCharacter(from: nonNumericCharacters) == nil
    }
    
    public func setupCard(_fullName: String, _cardType: String, _accountNumber: String, _balance: String, _currency: String, _color: [String], _data: String) {
        fullName.text = _fullName
        cardTypeName = _cardType
        cardType = cardType(type: _cardType)
        currency = _currency
        colorGradient = _color
        background.applyGradient(colors: [colorGradient[0], colorGradient[1]]) //color for background of cardView
        data.text = _data
        self.layer.cornerRadius = 30
        
        cardType.contentMode = .scaleToFill
        
        if containsOnlyNumbers(_accountNumber) == true {
            setAccountNumber(_accountNumber)
            accountnumber = _accountNumber
        } else {
            setAccountNumber(accountnumber)
        }
        
        currentBalance.text = formatMoneyString(_balance)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        background.translatesAutoresizingMaskIntoConstraints = false
        cardType.translatesAutoresizingMaskIntoConstraints = false
        data.translatesAutoresizingMaskIntoConstraints = false
        balanceLabel.translatesAutoresizingMaskIntoConstraints = false
        currentBalance.translatesAutoresizingMaskIntoConstraints = false
        fullName.translatesAutoresizingMaskIntoConstraints = false
        accountNumber.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(background)
        self.addSubview(cardType)
        self.addSubview(data)
        self.addSubview(balanceLabel)
        self.addSubview(currentBalance)
        self.addSubview(fullName)
        self.addSubview(accountNumber)
        
        NSLayoutConstraint.activate([
            background.topAnchor.constraint(equalTo: self.topAnchor),
            background.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            background.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            background.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            cardType.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            cardType.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            balanceLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            balanceLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 30),
            balanceLabel.heightAnchor.constraint(equalToConstant: 13)
        ])
        
        NSLayoutConstraint.activate([
            currentBalance.topAnchor.constraint(equalTo: balanceLabel.bottomAnchor, constant: 9),
            currentBalance.leadingAnchor.constraint(equalTo: balanceLabel.leadingAnchor),
            currentBalance.heightAnchor.constraint(equalToConstant: 33)
        ])
        
        NSLayoutConstraint.activate([
            data.heightAnchor.constraint(equalToConstant: 13),
            data.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
            data.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -25),
            data.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 242)
        ])
        
        NSLayoutConstraint.activate([
            fullName.topAnchor.constraint(equalTo: currentBalance.bottomAnchor, constant: 42),
            fullName.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            fullName.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            accountNumber.topAnchor.constraint(equalTo: fullName.bottomAnchor),
            accountNumber.widthAnchor.constraint(equalToConstant: 127),
            accountNumber.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30)

        ])
    }
    
    public func removeNonNumericCharacters(_ input: String) -> String {
        let allowedCharacters = CharacterSet(charactersIn: "0123456789")
        let filteredString = input.unicodeScalars.filter { allowedCharacters.contains($0) }
        return String(filteredString)
    }
    
    func isAlreadyFormatted(_ input: String) -> Bool {
        return input.contains(",")
    }
    
    func formatMoneyString(_ amountString: String) -> String {
        guard let amount = Int64(amountString) else {
            fatalError("Failed to convert amountString to Int")
        }
        
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.locale = Locale.current // Use the current locale for currency symbols
        numberFormatter.groupingSeparator = ","
        numberFormatter.decimalSeparator = "."
        
        if let formattedAmount = numberFormatter.string(from: NSNumber(value: amount)) {
            return (currency ?? "") + formattedAmount
        } else {
            fatalError("Failed to format the given string")
        }
    }
    
    func setAccountNumber(_ _accountNumber: String) {
        if _accountNumber.isEmpty {
            print("datarl")
        }
        // Check if the account number has at least 4 characters
        guard _accountNumber.count >= 4 else {
            fatalError("Account number is too short.")
        }
        
        // Take the last 4 digits
        let lastFour = String(_accountNumber.suffix(4))
        
        // Replace all but the last 4 characters with asterisks
        let hiddenDigits = String(repeating: "*", count: _accountNumber.count - 4)
        
        // Concatenate the masked part and the last four digits
        let maskedAccountNumber = hiddenDigits + lastFour
        
        // Add white space after every 4th character
        var formattedAccountNumber = ""
        for (index, character) in maskedAccountNumber.enumerated() {
            if index > 0 && index % 4 == 0 {
                formattedAccountNumber += " " // Add white space
            }
            formattedAccountNumber.append(character)
        }
        
        // Add any additional spacing to ensure 16 characters
        let remainingSpaces = 16 - formattedAccountNumber.count
        if remainingSpaces > 0 {
            formattedAccountNumber += String(repeating: " ", count: remainingSpaces)
        }
        // Assuming `accountNumber` is a UILabel or similar view
        accountNumber.text = formattedAccountNumber
    }
    
    public func cardType(type: String) -> UIImageView {
        let imageView = UIImageView(image: UIImage(named: type))
        if imageView.image != nil {
            return imageView
        } else {
            fatalError("Invalid image")
        }
    }
}

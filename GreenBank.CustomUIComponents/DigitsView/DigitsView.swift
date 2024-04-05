//
//  DigitsView.swift
//  GreenBank.CustomUIComponents
//
//  Created by Eprem Sargsyan on 02.02.24.
//

import UIKit

final public class DigitsView: UIView {
    public var firstDigit = TextField(placeholder: "2")
    public var secondDigit = TextField(placeholder: "5")
    public var thirdDigit = TextField(placeholder: "8")
    public var fourthDigit = TextField(placeholder: "1")
    
    lazy var digitsStack = UIStackView(arrangedSubviews: [firstDigit, secondDigit, thirdDigit, fourthDigit], axis: .horizontal, spacing: 24)
    
    public func setupUI() {
        digitsStack.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(digitsStack)
        
        firstDigit.layer.borderColor = UIColor.black.cgColor
        secondDigit.layer.borderColor = UIColor.black.cgColor
        thirdDigit.layer.borderColor = UIColor.black.cgColor
        fourthDigit.layer.borderColor = UIColor.black.cgColor
        
        firstDigit.font = UIFont.systemFont(ofSize: 25)
        secondDigit.font = UIFont.systemFont(ofSize: 25)
        thirdDigit.font = UIFont.systemFont(ofSize: 25)
        fourthDigit.font = UIFont.systemFont(ofSize: 25)
        
        firstDigit.textAlignment = .center
        secondDigit.textAlignment = .center
        thirdDigit.textAlignment = .center
        fourthDigit.textAlignment = .center
        
        NSLayoutConstraint.activate([
            digitsStack.topAnchor.constraint(equalTo: self.topAnchor),
            digitsStack.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            digitsStack.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            digitsStack.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}

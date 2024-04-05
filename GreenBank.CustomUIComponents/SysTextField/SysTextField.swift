//
//  SysTextField.swift
//  GreenBank.CustomUIComponents
//
//  Created by Eprem Sargsyan on 30.01.24.
//

import UIKit

public class SystemTextField: UIView {
    let mainLabel: UILabel
    public var helperLabel: UILabel?
    public var textField: TextField
    
    public init(labelText: String,
                placeholder: String,
                rightImage: String? = nil,
                isSecureTextEntry: Bool = false) {
        
        self.mainLabel = UILabel(text: labelText, textColor: AppColor.textDarkGrey.uiColor,
                                 font: UIFont.systemFont(ofSize: 14))
        
        self.textField = TextField(placeholder: placeholder, rightImage: rightImage, 
                                   isSecureTextEntry: isSecureTextEntry)
        
        self.textField.layer.borderColor = AppColor.grey400.uiColor.cgColor
        super.init(frame: .zero)
        
        mainLabel.translatesAutoresizingMaskIntoConstraints = false
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(mainLabel)
        self.addSubview(textField)
        
        NSLayoutConstraint.activate([
            mainLabel.topAnchor.constraint(equalTo: self.topAnchor),
            mainLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            mainLabel.heightAnchor.constraint(equalToConstant: 17)
        ])
        
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: 4),
            textField.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            textField.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            textField.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    public convenience init(labelText: String, helperLabelText: String, placeholder: String,
                            rightImage: String? = nil,
                            isSecureTextEntry: Bool = false) {
        self.init(labelText: labelText, placeholder: placeholder,
                  rightImage: rightImage,
                  isSecureTextEntry: isSecureTextEntry)
        
        
        self.helperLabel = UILabel(text: helperLabelText, textColor: AppColor
            .errorDefault.uiColor, font: UIFont.systemFont(ofSize: 14))
        helperLabel?.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(helperLabel!)
        
        NSLayoutConstraint.activate([
            helperLabel!.topAnchor.constraint(equalTo: textField.bottomAnchor),
            helperLabel!.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            helperLabel!.leadingAnchor.constraint(equalTo: self.leadingAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


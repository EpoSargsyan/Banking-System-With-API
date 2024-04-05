//
//  AddButtonCell.swift
//  GreenBank.CustomUIComponents
//
//  Created by Anna Hakobyan on 07.03.24.
//

import UIKit

final class AddButtonCell: UICollectionViewCell {
    let button = UIButton(backgroundColor: AppColor.primaryDefault.uiColor, title: "+", textColor: .white)
    let buttonLayer = UIButton(backgroundColor: .clear, title: "")
    
    let label = UILabel(text: "homePage_lastCardLabel".localized, textColor: AppColor.textDarkGrey.uiColor, font: UIFont.systemFont(ofSize: 16))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
  

@objc public func buttonTapped() {
    NotificationCenter.default
                .post(name: NSNotification.Name("requestNewCard"),
                      object: nil)
}
    func setup() {
        self.layer.borderWidth = 2
        self.layer.borderColor = AppColor.grey100.uiColor.cgColor
        self.layer.cornerRadius = 30

        self.addSubview(button)
        self.addSubview(label)
        self.addSubview(buttonLayer)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        buttonLayer.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            button.heightAnchor.constraint(equalToConstant: 30),
            button.widthAnchor.constraint(equalToConstant: 30),
            button.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            button.topAnchor.constraint(equalTo: self.topAnchor, constant: 60)
        ])
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 16),
            label.centerXAnchor.constraint(equalTo: button.centerXAnchor),
            label.heightAnchor.constraint(equalToConstant: 18)
        ])
        
        NSLayoutConstraint.activate([
            buttonLayer.topAnchor.constraint(equalTo: self.topAnchor),
            buttonLayer.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            buttonLayer.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            buttonLayer.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        
        button.layer.cornerRadius = 15 // Half of the height for a circular button
        button.clipsToBounds = true
        buttonLayer.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
}

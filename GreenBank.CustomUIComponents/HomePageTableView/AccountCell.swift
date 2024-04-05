//
//  AccountCell.swift
//  GreenBank.CustomUIComponents
//
//  Created by Eprem Sargsyan on 28.02.24.
//

import UIKit

final class AccountCell: UITableViewCell {
    var accountNameLabel = UILabel(text: "",
                               textColor: AppColor.textBlack.uiColor,
                               font: UIFont.systemFont(ofSize: 16))
    
    var accountNumberLabel = UILabel(text: "",
                                     textColor: AppColor.textLightGrey.uiColor,
                                     font: UIFont.systemFont(ofSize: 13))
    
    var moneyCountLabel = UILabel(text: "",
                                  textColor: AppColor.primaryDefault.uiColor,
                                  font: UIFont.systemFont(ofSize: 16))
    
    private let slackIcon = UIImageView(image: UIImage(named: "icon_front".localized))
    
    private let line = Popup()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }
    
    private func setupViews() {
        accountNameLabel.translatesAutoresizingMaskIntoConstraints = false
        accountNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        moneyCountLabel.translatesAutoresizingMaskIntoConstraints = false
        slackIcon.translatesAutoresizingMaskIntoConstraints = false
        line.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(accountNameLabel)
        self.addSubview(accountNumberLabel)
        self.addSubview(moneyCountLabel)
        self.addSubview(slackIcon)
        self.addSubview(line)
        
        self.frame.size.height = 70
        self.moneyCountLabel.textAlignment = .right
        line.backgroundColor = AppColor.lightGrey.uiColor
        
        NSLayoutConstraint.activate([
            accountNameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            accountNameLabel.widthAnchor.constraint(equalToConstant: 147),
            accountNameLabel.heightAnchor.constraint(equalToConstant: 21),
            accountNameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32)
        ])
        
        NSLayoutConstraint.activate([
            accountNumberLabel.topAnchor.constraint(equalTo: accountNameLabel.bottomAnchor, constant: 5),
            accountNumberLabel.widthAnchor.constraint(equalToConstant: 158),
            accountNumberLabel.heightAnchor.constraint(equalToConstant: 20),
            accountNumberLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32)
        ])
        
        NSLayoutConstraint.activate([
            moneyCountLabel.widthAnchor.constraint(equalToConstant: 100),
            moneyCountLabel.heightAnchor.constraint(equalToConstant: 20),
            moneyCountLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            moneyCountLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -66)
        ])
        
        NSLayoutConstraint.activate([
            slackIcon.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            slackIcon.widthAnchor.constraint(equalToConstant: 24),
            slackIcon.heightAnchor.constraint(equalToConstant: 24),
            slackIcon.leadingAnchor.constraint(equalTo: moneyCountLabel.trailingAnchor, constant: 10)
        ])
        
        NSLayoutConstraint.activate([
            line.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32),
            line.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -32),
            line.heightAnchor.constraint(equalToConstant: 1),
            line.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
}

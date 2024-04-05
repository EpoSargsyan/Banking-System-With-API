//
//  EmptyCardCell.swift
//  GreenBank.CustomUIComponents
//
//  Created by Anna Hakobyan on 06.03.24.
//

import UIKit

public class EmptyCardCell: UICollectionViewCell {
    let button = UIButton(backgroundColor: AppColor.primaryDefault.uiColor, title: "+", textColor: .white)
    let topLabel = UILabel()
    let bottomLabel = UILabel()
    let buttonLayer = UIButton(backgroundColor: .clear, title: "")

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    func setup() {
        button.heightAnchor.constraint(equalToConstant: 30).isActive = true
        button.widthAnchor.constraint(equalToConstant: 30).isActive = true
        button.layer.cornerRadius = 15 // Half of the height for a circular button
        button.clipsToBounds = true
        
        topLabel.text = "homePage_topLabel".localized
        topLabel.textColor = AppColor.accentDefault.uiColor
        topLabel.font = UIFont.systemFont(ofSize: 16)
        
        bottomLabel.text = "homePage_bottomLabel".localized
        bottomLabel.textColor = AppColor.textDarkGrey.uiColor
        bottomLabel.font = UIFont.systemFont(ofSize: 16)
        
        contentView.addSubview(button)
        contentView.addSubview(topLabel)
        contentView.addSubview(bottomLabel)
        contentView.addSubview(buttonLayer)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        topLabel.translatesAutoresizingMaskIntoConstraints = false
        bottomLabel.translatesAutoresizingMaskIntoConstraints = false
        buttonLayer.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.layer.borderColor = AppColor.grey100.uiColor.cgColor
        contentView.layer.borderWidth = 2
        contentView.layer.cornerRadius = 18
        
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: self.topAnchor, constant: 48),
            button.centerXAnchor.constraint(equalTo: self.centerXAnchor),
        ])
        
        NSLayoutConstraint.activate([
            topLabel.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 16),
            topLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            topLabel.heightAnchor.constraint(equalToConstant: 18)
        ])
        
        NSLayoutConstraint.activate([
            bottomLabel.topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: 6),
            bottomLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            bottomLabel.heightAnchor.constraint(equalToConstant: 18)
        ])
        
        NSLayoutConstraint.activate([
            buttonLayer.topAnchor.constraint(equalTo: self.topAnchor),
            buttonLayer.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            buttonLayer.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            buttonLayer.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        
        buttonLayer.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    @objc func buttonTapped() {
        NotificationCenter.default
                    .post(name: NSNotification.Name("requestNewCard"),
                          object: nil)
    }
}

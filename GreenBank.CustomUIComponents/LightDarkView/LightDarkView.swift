//
//  LightDarkView.swift
//  GreenBank.CustomUIComponents
//
//  Created by Eprem Sargsyan on 20.03.24.
//

import UIKit

final public class LightDarkView: UIView {
    var lightDarkLabel = UILabel(text: "settings_light_dark_text".localized,
                                 textColor: AppColor.accentDefault.uiColor,
                                 font: UIFont.systemFont(ofSize: 16))
    
    public var switcher = UISwitch()
    
    public init() {
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 8
        self.layer.borderColor = AppColor.grey400.uiColor.cgColor
        
        lightDarkLabel.translatesAutoresizingMaskIntoConstraints = false
        switcher.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(lightDarkLabel)
        self.addSubview(switcher)
        
        NSLayoutConstraint.activate([
            lightDarkLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            lightDarkLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            switcher.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            switcher.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15)
        ])
    }
}

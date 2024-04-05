//
//  SettingsView.swift
//  GreenBank
//
//  Created by Eprem Sargsyan on 19.03.24.
//

import UIKit
import GreenBank_CustomUIComponents

final class SettingsView: UIView {
    public let backButton = UIButton(backgroundColor: AppColor.cremeWhite.uiColor,
                                     title: "",
                                     image: "forgot_password_back".localized)
    
    private let settingsLabel = UILabel(text: "settings_text".localized,
                                            textColor: AppColor.accentDefault.uiColor,
                                            font: UIFont.systemFont(ofSize: 17))
    
    let securitySettingsLabel = UILabel(text: "settings_security_settings_text".localized,
                                        textColor: AppColor.accentDefault.uiColor,
                                        font: UIFont.systemFont(ofSize: 16))
    
    let changePasswordtTF = TextField(placeholder: "",
                                      rightImage: "front")
    
    let changePaswordBtn = UIButton()
    
    let modeSettingsLabel = UILabel(text: "settings_mode_settings_text".localized,
                                    textColor: AppColor.accentDefault.uiColor,
                                    font: UIFont.systemFont(ofSize: 16))
    
    public var lightDarkView = LightDarkView()
    
    var blurEffectView = UIVisualEffectView()
    
    var popUpView = PopupView()
    
    func setupUI() {
        self.backgroundColor = AppColor.cremeWhite.uiColor
        
        backButton.translatesAutoresizingMaskIntoConstraints = false
        settingsLabel.translatesAutoresizingMaskIntoConstraints = false
        securitySettingsLabel.translatesAutoresizingMaskIntoConstraints = false
        changePasswordtTF.translatesAutoresizingMaskIntoConstraints = false
        changePaswordBtn.translatesAutoresizingMaskIntoConstraints = false
        modeSettingsLabel.translatesAutoresizingMaskIntoConstraints = false
        lightDarkView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(backButton)
        self.addSubview(settingsLabel)
        self.addSubview(securitySettingsLabel)
        self.addSubview(changePasswordtTF)
        self.addSubview(changePaswordBtn)
        self.addSubview(modeSettingsLabel)
        self.addSubview(lightDarkView)
        
        setupTextField()
        
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            backButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
        ])
        
        NSLayoutConstraint.activate([
            settingsLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            settingsLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            securitySettingsLabel.topAnchor.constraint(equalTo: settingsLabel.bottomAnchor, constant: 45),
            securitySettingsLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15)
        ])
        
        NSLayoutConstraint.activate([
            changePasswordtTF.topAnchor.constraint(equalTo: securitySettingsLabel.bottomAnchor, constant: 16),
            changePasswordtTF.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            changePasswordtTF.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            changePasswordtTF.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            changePaswordBtn.topAnchor.constraint(equalTo: changePasswordtTF.topAnchor),
            changePaswordBtn.leadingAnchor.constraint(equalTo: changePasswordtTF.leadingAnchor),
            changePaswordBtn.trailingAnchor.constraint(equalTo: changePasswordtTF.trailingAnchor),
            changePaswordBtn.bottomAnchor.constraint(equalTo: changePasswordtTF.bottomAnchor),
        ])
        
        NSLayoutConstraint.activate([
            modeSettingsLabel.topAnchor.constraint(equalTo: changePasswordtTF.bottomAnchor, constant: 32),
            modeSettingsLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15)
        ])
        
        NSLayoutConstraint.activate([
            lightDarkView.topAnchor.constraint(equalTo: modeSettingsLabel.bottomAnchor, constant: 16),
            lightDarkView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            lightDarkView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            lightDarkView.heightAnchor.constraint(equalToConstant: 55)
        ])
    }
    
    func setupTextField() {
        changePaswordBtn.backgroundColor = .none
        changePasswordtTF.text = "settings_change_password_text".localized
        changePasswordtTF.textColor = AppColor.accentDefault.uiColor
    }
    
    func addBlurEffect(to view: UIView) {
        let blurEffect = UIBlurEffect(style: .dark)
        blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.backgroundColor = .black
        blurEffectView.alpha = 0.62
        blurEffectView.frame = self.bounds
        self.addSubview(blurEffectView)
        
        setupPopupView()
        makeAnimaTion()
    }
    
    func makeAnimaTion() {
        let height = self.frame.height * CGFloat(0.45)
        let y = self.frame.height - height
        
        popUpView.frame.size.width = self.frame.width
        popUpView.frame.origin.y = self.frame.maxY
        
        UIView.animate(withDuration: 0.5) {
            self.popUpView.frame.origin.y = y
            self.popUpView.frame.size.height = height
        }
    }
    
    func setupPopupView() {
        popUpView.setupUI()
        popUpView.backgroundColor = AppColor.cremeWhite.uiColor
        self.addSubview(popUpView)
        popUpView.layer.cornerRadius = 20
    }
    
}

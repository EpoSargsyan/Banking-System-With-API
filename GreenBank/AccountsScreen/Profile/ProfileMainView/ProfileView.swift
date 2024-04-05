//
//  ProfileView.swift
//  GreenBank
//
//  Created by Eprem Sargsyan on 20.02.24.
//

import UIKit
import GreenBank_CustomUIComponents

final class ProfileView: UIView {
    let profileLabel = UILabel(text: "Profile",
                               textColor: AppColor.textBlack.uiColor,
                               font: UIFont.systemFont(ofSize: 17))
    
    public var profileImage = UIImageView()
    
    public var nameLabel = UILabel(text: "",
                                   textColor: AppColor.textBlack.uiColor,
                                   font: UIFont.systemFont(ofSize: 24))
    
    public var emailLabel = UILabel(text: "",
                                    textColor: AppColor.textGrey.uiColor,
                                    font: UIFont.systemFont(ofSize: 12))
    
    private var dividerView = UIView()
    
    public var phoneLabel = UILabel(text: "",
                                    textColor: AppColor.textGrey.uiColor,
                                    font: UIFont.systemFont(ofSize: 12))
    
    private var personalInfoTF = TextField(placeholder: "",
                                          rightImage: "front",
                                          leftImage: "profile")
    
    public var personalInfoBtn = UIButton(backgroundColor: .green, title: "")
    
    private var settingsTF = TextField(placeholder: "",
                                      rightImage: "front",
                                      leftImage: "settings")
    
    public var settingsBtn = UIButton()
    
    private var privacyTF = TextField(placeholder: "",
                                     rightImage: "front",
                                     leftImage: "privacy")
    
    public var privacyBtn = UIButton()
    
    private var helpSupportTF = TextField(placeholder: "",
                                         rightImage: "front",
                                         leftImage: "helper-center")
    
    public var helpSupportBtn = UIButton()
    
    lazy private var stackViewTF = UIStackView(arrangedSubviews: [personalInfoTF,
                                                               settingsTF,
                                                               privacyTF,
                                                               helpSupportTF],
                                            axis: .vertical, spacing: 15)
    
    func setupUI() {
        profileLabel.translatesAutoresizingMaskIntoConstraints = false
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        dividerView.translatesAutoresizingMaskIntoConstraints = false
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        phoneLabel.translatesAutoresizingMaskIntoConstraints = false
        stackViewTF.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(profileLabel)
        self.addSubview(profileImage)
        self.addSubview(nameLabel)
        self.addSubview(dividerView)
        self.addSubview(emailLabel)
        self.addSubview(phoneLabel)
        self.addSubview(stackViewTF)
        
        profileImage.layer.borderWidth = 2
        profileImage.layer.borderColor = AppColor.primaryDefault.uiColor.cgColor
        profileImage.layer.cornerRadius = 75
        
        dividerView.backgroundColor = AppColor.lightGrey.uiColor
        
        NSLayoutConstraint.activate([
            profileLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            profileLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            profileImage.topAnchor.constraint(equalTo: profileLabel.bottomAnchor, constant: 50),
            profileImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 122),
            profileImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -121),
            profileImage.heightAnchor.constraint(equalToConstant: 150)
        ])
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 20),
            nameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            dividerView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 17),
            dividerView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            dividerView.heightAnchor.constraint(equalToConstant: 15),
            dividerView.widthAnchor.constraint(equalToConstant: 2)
        ])
        
        NSLayoutConstraint.activate([
            emailLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 13),
            emailLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 69),
            emailLabel.trailingAnchor.constraint(equalTo: dividerView.leadingAnchor, constant: -10),
            emailLabel.heightAnchor.constraint(equalToConstant: 24)
        ])
        
        NSLayoutConstraint.activate([
            phoneLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 13),
            phoneLabel.leadingAnchor.constraint(equalTo: dividerView.trailingAnchor, constant: 9),
            phoneLabel.widthAnchor.constraint(equalToConstant: 107),
            phoneLabel.heightAnchor.constraint(equalToConstant: 24)
        ])
        
        setupTextFields()
        
        NSLayoutConstraint.activate([
            stackViewTF.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 35),
            stackViewTF.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            stackViewTF.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            stackViewTF.heightAnchor.constraint(equalToConstant: 173)
        ])
        
        setupButtons()
    }
    
    func setupTextFields() {
        personalInfoTF.text = "Personal Information"
        personalInfoTF.textColor = AppColor.accentDefault.uiColor
        personalInfoTF.leftView?.tintColor = AppColor.accentDefault.uiColor
        personalInfoTF.rightView?.tintColor = AppColor.accentDefault.uiColor
        personalInfoTF.layer.borderWidth = 0
        
        settingsTF.text = "Settings"
        settingsTF.textColor = AppColor.accentDefault.uiColor
        settingsTF.leftView?.tintColor = AppColor.accentDefault.uiColor
        settingsTF.rightView?.tintColor = AppColor.accentDefault.uiColor
        settingsTF.layer.borderWidth = 0
        
        privacyTF.text = "Privacy policy"
        privacyTF.textColor = AppColor.accentDefault.uiColor
        privacyTF.leftView?.tintColor = AppColor.accentDefault.uiColor
        privacyTF.rightView?.tintColor = AppColor.accentDefault.uiColor
        privacyTF.layer.borderWidth = 0
        
        helpSupportTF.text = "Help and Support"
        helpSupportTF.textColor = AppColor.accentDefault.uiColor
        helpSupportTF.leftView?.tintColor = AppColor.accentDefault.uiColor
        helpSupportTF.rightView?.tintColor = AppColor.accentDefault.uiColor
        helpSupportTF.layer.borderWidth = 0
    }
    
    func setupButtons() {
        personalInfoBtn.translatesAutoresizingMaskIntoConstraints = false
        settingsBtn.translatesAutoresizingMaskIntoConstraints = false
        privacyBtn.translatesAutoresizingMaskIntoConstraints = false
        helpSupportBtn.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(personalInfoBtn)
        self.addSubview(settingsBtn)
        self.addSubview(privacyBtn)
        self.addSubview(helpSupportBtn)
        
        NSLayoutConstraint.activate([
            personalInfoBtn.topAnchor.constraint(equalTo: personalInfoTF.topAnchor),
            personalInfoBtn.leadingAnchor.constraint(equalTo: personalInfoTF.leadingAnchor),
            personalInfoBtn.trailingAnchor.constraint(equalTo: personalInfoTF.trailingAnchor),
            personalInfoBtn.bottomAnchor.constraint(equalTo: personalInfoTF.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            settingsBtn.topAnchor.constraint(equalTo: settingsTF.topAnchor),
            settingsBtn.leadingAnchor.constraint(equalTo: settingsTF.leadingAnchor),
            settingsBtn.trailingAnchor.constraint(equalTo: settingsTF.trailingAnchor),
            settingsBtn.bottomAnchor.constraint(equalTo: settingsTF.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            privacyBtn.topAnchor.constraint(equalTo: privacyTF.topAnchor),
            privacyBtn.leadingAnchor.constraint(equalTo: privacyTF.leadingAnchor),
            privacyBtn.trailingAnchor.constraint(equalTo: privacyTF.trailingAnchor),
            privacyBtn.bottomAnchor.constraint(equalTo: privacyTF.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            helpSupportBtn.topAnchor.constraint(equalTo: helpSupportTF.topAnchor),
            helpSupportBtn.leadingAnchor.constraint(equalTo: helpSupportTF.leadingAnchor),
            helpSupportBtn.trailingAnchor.constraint(equalTo: helpSupportTF.trailingAnchor),
            helpSupportBtn.bottomAnchor.constraint(equalTo: helpSupportTF.bottomAnchor)
        ])
        
        personalInfoBtn.backgroundColor = .none
        settingsBtn.backgroundColor = .none
        privacyBtn.backgroundColor = .none
        helpSupportBtn.backgroundColor = .none
    }
    
    public func getUserProfileInfo() {
        guard let data = AppDelegate.shared?.userRegisterInformation?.user else { return }
        var fullName: String {
            return data.firstName + " " + data.lastName
        }

        self.emailLabel.text = data.email
        self.nameLabel.text = fullName
        self.phoneLabel.text = data.phone
    }
}

//
//  PersonalInformationView.swift
//  GreenBank
//
//  Created by Eprem Sargsyan on 19.03.24.
//

import UIKit
import GreenBank_CustomUIComponents

final class PersonalInformationView: UIView {
    public let backButton = UIButton(backgroundColor: AppColor.cremeWhite.uiColor,
                              title: "",
                              image: "forgot_password_back".localized)
    
    private let personalInfoLabel = UILabel(text: "personal_info_text".localized,
                                            textColor: AppColor.accentDefault.uiColor,
                                            font: UIFont.systemFont(ofSize: 17))
    
    let nameField = SystemTextField(labelText: "signup_name".localized,
                                    helperLabelText: "",
                                    placeholder: "signup_firstname_placeholder".localized)
    
    let surnameField = SystemTextField(labelText: "signup_surname".localized,
                                       helperLabelText: "",
                                       placeholder: "signup_lastname_placeholder".localized)
    
    let birthDateField = SystemTextField(labelText: "signup_date_birth_text".localized,
                                         placeholder: "signup_dd_mm_yy".localized,
                                         rightImage: "signup_calendar".localized)
    
    let emailField = SystemTextField(labelText: "signup_email".localized,
                                     helperLabelText: "",
                                     placeholder: "signup_email_placeholder".localized)
    
    let phoneField = SystemTextField(labelText: "signup_phone".localized,
                                     helperLabelText: "",
                                     placeholder: "signup_phoneNumber_placeholder".localized)
    
    lazy var texfFieldStack = UIStackView(arrangedSubviews: [nameField,
                                                        surnameField,
                                                        birthDateField,
                                                        emailField,
                                                        phoneField
                                                       ],
                                     axis: .vertical, spacing: 20)
    
    public var saveButton = UIButton(backgroundColor: AppColor.primaryDisable.uiColor,
                                     title: "personal_info_button_text".localized)
    
    let textFieldButton = UIButton(backgroundColor: .black, title: "")
    
    var blurEffectView = UIVisualEffectView()
    let datePickerView = DatePickerView()
    
    var contentView = UIView()
    var scrollView = UIScrollView()
    
    func setupUI() {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        backButton.translatesAutoresizingMaskIntoConstraints = false
        personalInfoLabel.translatesAutoresizingMaskIntoConstraints = false
        texfFieldStack.translatesAutoresizingMaskIntoConstraints = false
        textFieldButton.translatesAutoresizingMaskIntoConstraints = false
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(backButton)
        contentView.addSubview(personalInfoLabel)
        contentView.addSubview(texfFieldStack)
        contentView.addSubview(textFieldButton)
        contentView.addSubview(saveButton)
        
        scrollView.backgroundColor = AppColor.cremeWhite.uiColor
        birthDateField.isUserInteractionEnabled = false
        textFieldButton.backgroundColor = .none
        saveButton.isEnabled = false
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
        
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: contentView.topAnchor),
            backButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
        ])
        
        NSLayoutConstraint.activate([
            personalInfoLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            personalInfoLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            texfFieldStack.topAnchor.constraint(equalTo: personalInfoLabel.bottomAnchor, constant: 45),
            texfFieldStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            texfFieldStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            texfFieldStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -228)
        ])
        
        NSLayoutConstraint.activate([
            textFieldButton.topAnchor.constraint(equalTo: birthDateField.topAnchor),
            textFieldButton.leadingAnchor.constraint(equalTo: birthDateField.leadingAnchor),
            textFieldButton.trailingAnchor.constraint(equalTo: birthDateField.trailingAnchor),
            textFieldButton.bottomAnchor.constraint(equalTo: birthDateField.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            saveButton.topAnchor.constraint(equalTo: texfFieldStack.bottomAnchor, constant: 105),
            saveButton.leadingAnchor.constraint(equalTo: texfFieldStack.leadingAnchor),
            saveButton.trailingAnchor.constraint(equalTo: texfFieldStack.trailingAnchor),
            saveButton.heightAnchor.constraint(equalToConstant: 48)
        ])
        
        setupTextFields()
    }
    
    func setupTextFields() {
        guard let userInfo = AppDelegate.shared?.userRegisterInformation?.user else { return }
        
        nameField.textField.text = userInfo.firstName
        surnameField.textField.text = userInfo.lastName
        birthDateField.textField.text = userInfo.dateOfBirth
        emailField.textField.text = userInfo.email
        phoneField.textField.text = userInfo.phone
    }
    
    func removeKeyBoard() {
        nameField.textField.resignFirstResponder()
        surnameField.textField.resignFirstResponder()
        emailField.textField.resignFirstResponder()
        phoneField.textField.resignFirstResponder()
    }
    
    func addBlurEffect(to view: UIView) {
        let blurEffect = UIBlurEffect(style: .dark)
        blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.backgroundColor = .clear
        blurEffectView.alpha = 0.9
        blurEffectView.frame = self.bounds
        self.addSubview(blurEffectView)
        
        setupDatePickerView()
        makeAnimaTion()
    }
    
    func makeAnimaTion() {
        let height = self.frame.height * CGFloat(0.45)
        let y = self.frame.height - height
        
        datePickerView.frame.size.width = self.frame.width
        datePickerView.frame.origin.y = self.frame.maxY
        
        UIView.animate(withDuration: 0.5) {
            self.datePickerView.frame.origin.y = y
            self.datePickerView.frame.size.height = height
        }
    }
    
    func setupDatePickerView() {
        datePickerView.setupUI()
        datePickerView.backgroundColor = AppColor.cremeWhite.uiColor
        self.addSubview(datePickerView)
        let calendar = Calendar.current
        var components = DateComponents()
        components.year = -15
        if let maximumDate = calendar.date(byAdding: components, to: Date()) {
            datePickerView.datePicker.maximumDate = maximumDate
        }
        datePickerView.layer.cornerRadius = 20
    }
}

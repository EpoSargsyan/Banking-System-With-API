//
//  SignupView.swift
//  GreenBank
//
//  Created by Anna Hakobyan on 31.01.24.
//

import UIKit
import GreenBank_CustomUIComponents

final public class SignupView: UIView {
    private let logo = UIImageView(image: UIImage(named: "signup_logo".localized))
    
    private let labelLogo = UILabel(text: "signup_button".localized,
                                    textColor: AppColor.accentDefault.uiColor, font: UIFont.systemFont(ofSize: 24))
    
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
    
    let passwordField = SystemTextField(labelText: "signup_password".localized,
                                        helperLabelText: "",
                                        placeholder: "signup_password_placeholder".localized,
                                        isSecureTextEntry: true)
    
    lazy var stackView = UIStackView(arrangedSubviews: [nameField,
                                                        surnameField,
                                                        birthDateField,
                                                        emailField,
                                                        phoneField,
                                                        passwordField
                                                       ], axis: .vertical, spacing: 20)
    
    let signupButton = UIButton(backgroundColor: AppColor.primaryDisable.uiColor,
                                title: "signup_button".localized)
    
    private let questionLabel = UILabel(text: "signup_questionButton".localized,
                                        textColor: AppColor.textDarkGrey.uiColor,
                                        font: UIFont.systemFont(ofSize: 15))
    
    let signInButton = UIButton(backgroundColor: AppColor.cremeWhite.uiColor,
                                        title: "signup_signin_button".localized,
                                        textColor: AppColor.primaryDefault.uiColor)
    
    private lazy var questionStack = UIStackView(arrangedSubviews: [questionLabel,
                                                                   signInButton],
                                                 axis: .horizontal,
                                                 spacing: 5)
    
    let textFieldButton = UIButton(backgroundColor: .black, title: "")
    
    var blurEffectView = UIVisualEffectView()
    let datePickerView = DatePickerView()
    
    private var contentView = UIView()
    var scrollView = UIScrollView()
    
    public func setupSignupPage() {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        logo.translatesAutoresizingMaskIntoConstraints = false
        labelLogo.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        textFieldButton.translatesAutoresizingMaskIntoConstraints = false
        signupButton.translatesAutoresizingMaskIntoConstraints = false
        questionStack.translatesAutoresizingMaskIntoConstraints = false
        
        questionStack.distribution = .fillProportionally
        signupButton.layer.cornerRadius = 8
        
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(logo)
        contentView.addSubview(labelLogo)
        contentView.addSubview(stackView)
        contentView.addSubview(textFieldButton)
        contentView.addSubview(signupButton)
        contentView.addSubview(questionStack)
        
        scrollView.backgroundColor = AppColor.cremeWhite.uiColor
        
        birthDateField.isUserInteractionEnabled = false
        textFieldButton.backgroundColor = .none
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
        
        NSLayoutConstraint.activate([
            logo.topAnchor.constraint(equalTo: contentView.topAnchor),
            logo.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
        ])
        
        NSLayoutConstraint.activate([
            labelLogo.topAnchor.constraint(equalTo: logo.bottomAnchor),
            labelLogo.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: labelLogo.bottomAnchor, constant: 47),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -171)
        ])
        
        NSLayoutConstraint.activate([
            textFieldButton.topAnchor.constraint(equalTo: birthDateField.topAnchor),
            textFieldButton.leadingAnchor.constraint(equalTo: birthDateField.leadingAnchor),
            textFieldButton.trailingAnchor.constraint(equalTo: birthDateField.trailingAnchor),
            textFieldButton.bottomAnchor.constraint(equalTo: birthDateField.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            signupButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 46),
            signupButton.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            signupButton.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            signupButton.heightAnchor.constraint(equalToConstant: 48)
        ])
        
        NSLayoutConstraint.activate([
            questionStack.topAnchor.constraint(equalTo: signupButton.bottomAnchor, constant: 12),
            questionStack.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            questionStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        ])
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

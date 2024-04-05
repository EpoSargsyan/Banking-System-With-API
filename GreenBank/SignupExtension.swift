//
//  SignUPExtension.swift
//  GreenBank
//
//  Created by Anna Hakobyan on 06.02.24.
//

import UIKit
import GreenBank_CustomUIComponents
import GreenBank_ViewModel

extension SignupViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard when return key is pressed
        textField.resignFirstResponder()
        return true
    }

    func textFieldDidChangeSelection(_ textField: UITextField) {
        let nameFilled = !(signupView.nameField.textField.text?.isEmpty ?? true)
        let surnameFilled = !(signupView.surnameField.textField.text?.isEmpty ?? true)
        let birthdayFilled = !(signupView.birthDateField.textField.text?.isEmpty ?? true)
        let emailFilled = !(signupView.emailField.textField.text?.isEmpty ?? true)
        let passwordFilled = !(signupView.passwordField.textField.text?.isEmpty ?? true)
        let phoneFilled = !(signupView.phoneField.textField.text?.isEmpty ?? true)
        
        let flag = isAllValid()
        
        signupView.signupButton.isEnabled = nameFilled && emailFilled && passwordFilled && birthdayFilled && surnameFilled && phoneFilled && flag
        signupView.signupButton.backgroundColor = signupView.signupButton.isEnabled ? AppColor.primaryDefault.uiColor : AppColor.primaryDisable.uiColor
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        switch textField {
        case signupView.nameField.textField:
            if let text = textField.text {
                if !(viewModel!.validator.isValidName(firstName: text)) {
                    textField.layer.borderColor = AppColor.errorDefault.uiColor.cgColor
                    
                    signupView.nameField.helperLabel?.text = "signup_validation_name".localized
                    
                    let imageView = UIImageView(image: UIImage(named: "signup_validation_error_logo".localized))
                    textField.rightView = imageView
                    signupView.nameField.textField.rightView = imageView
                } else {
                    textField.layer.borderColor = AppColor.textGrey.uiColor.cgColor
                    signupView.nameField.helperLabel?.text = ""
                    signupView.nameField.textField.rightView = .none
                }
            }
            
        case signupView.surnameField.textField:
            if let text = textField.text {
                if !(viewModel!.validator.isValidSurname(lastName: text)) {
                    textField.layer.borderColor = AppColor.errorDefault.uiColor.cgColor
                    
                    signupView.surnameField.helperLabel?.text = "signup_validation_surname".localized
                    
                    let imageView = UIImageView(image: UIImage(named: "signup_validation_error_logo".localized))
                    textField.rightView = imageView
                    signupView.surnameField.textField.rightView = imageView
                } else {
                    textField.layer.borderColor = AppColor.textGrey.uiColor.cgColor
                    signupView.surnameField.helperLabel?.text = ""
                    signupView.surnameField.textField.rightView = .none
                }
            }
            
        case signupView.emailField.textField:
            if let text = textField.text {
                if !(viewModel!.validator.emailValidation(email: text)) {
                    textField.layer.borderColor = AppColor.errorDefault.uiColor.cgColor
                    
                    signupView.emailField.helperLabel?.text = "signup_validation_email".localized
                    
                    let imageView = UIImageView(image: UIImage(named: "signup_validation_error_logo".localized))
                    textField.rightView = imageView
                    signupView.emailField.textField.rightView = imageView
                } else {
                    textField.layer.borderColor = AppColor.textGrey.uiColor.cgColor
                    signupView.emailField.helperLabel?.text = ""
                    signupView.emailField.textField.rightView = .none
                }
            }
            
        case signupView.phoneField.textField:
            if let text = textField.text {
                if !(viewModel!.validator.isValidPhoneNumber(phoneNumber: text)) {
                    textField.layer.borderColor = AppColor.errorDefault.uiColor.cgColor
                    
                    signupView.phoneField.helperLabel?.text = "signup_validation_phone".localized
                    
                    let imageView = UIImageView(image: UIImage(named: "signup_validation_error_logo".localized))
                    textField.rightView = imageView
                    signupView.phoneField.textField.rightView = imageView
                } else {
                    textField.layer.borderColor = AppColor.textGrey.uiColor.cgColor
                    signupView.phoneField.helperLabel?.text = ""
                    signupView.phoneField.textField.rightView = .none
                }
            }
            
        case signupView.passwordField.textField:
            if let text = textField.text {
                if !(viewModel!.validator.passwordValidation(password: text)) {
                    textField.layer.borderColor = AppColor.errorDefault.uiColor.cgColor
                    signupView.passwordField.helperLabel?.text = "signup_validation_password".localized
                } else {
                    textField.layer.borderColor = AppColor.textGrey.uiColor.cgColor
                    signupView.passwordField.helperLabel?.text = ""
                }
            }
            
        default:
            fatalError()
        }
    }
    
    func isAllValid() -> Bool {
        if !(viewModel!.validator.isValidName(firstName: signupView.nameField.textField.text!)) {
            return false
        } else if !(viewModel!.validator.isValidSurname(lastName: signupView.surnameField.textField.text!)) {
            return false
        } else if !(viewModel!.validator.emailValidation(email: signupView.emailField.textField.text!)) {
            return false
        } else if !(viewModel!.validator.isValidPhoneNumber(phoneNumber: signupView.phoneField.textField.text!)) {
            return false
        } else if !(viewModel!.validator.passwordValidation(password: signupView.passwordField.textField.text!)) {
            return false
        }
        
        return true
    }
}

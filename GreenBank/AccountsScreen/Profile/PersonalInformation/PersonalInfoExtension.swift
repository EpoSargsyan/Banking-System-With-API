//
//  PersonalInfoExtension.swift
//  GreenBank
//
//  Created by Eprem Sargsyan on 19.03.24.
//

import UIKit
import GreenBank_CustomUIComponents
import GreenBank_ViewModel

extension PersonalInformationViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    func textFieldDidChangeSelection(_ textField: UITextField) {
        let nameFilled = !(personalInfoView.nameField.textField.text?.isEmpty ?? true)
        let surnameFilled = !(personalInfoView.surnameField.textField.text?.isEmpty ?? true)
        let birthdayFilled = !(personalInfoView.birthDateField.textField.text?.isEmpty ?? true)
        let emailFilled = !(personalInfoView.emailField.textField.text?.isEmpty ?? true)
        let phoneFilled = !(personalInfoView.phoneField.textField.text?.isEmpty ?? true)
        
        let flag = isAllValid()
        
        personalInfoView.saveButton.isEnabled = nameFilled && emailFilled && birthdayFilled && surnameFilled && phoneFilled && flag
        personalInfoView.saveButton.backgroundColor = personalInfoView.saveButton.isEnabled ? AppColor.primaryDefault.uiColor : AppColor.primaryDisable.uiColor
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        switch textField {
        case personalInfoView.nameField.textField:
            if let text = textField.text {
                if !(viewModel!.validator.isValidName(firstName: text)) {
                    textField.layer.borderColor = AppColor.errorDefault.uiColor.cgColor
                    
                    personalInfoView.nameField.helperLabel?.text = "signup_validation_name".localized
                    
                    let imageView = UIImageView(image: UIImage(named: "signup_validation_error_logo".localized))
                    textField.rightView = imageView
                    personalInfoView.nameField.textField.rightView = imageView
                } else {
                    textField.layer.borderColor = AppColor.primaryFocus.uiColor.cgColor
                    personalInfoView.nameField.helperLabel?.text = ""
                    personalInfoView.nameField.textField.rightView = .none
                }
            }
            
        case personalInfoView.surnameField.textField:
            if let text = textField.text {
                if !(viewModel!.validator.isValidSurname(lastName: text)) {
                    textField.layer.borderColor = AppColor.errorDefault.uiColor.cgColor
                    
                    personalInfoView.surnameField.helperLabel?.text = "signup_validation_surname".localized
                    
                    let imageView = UIImageView(image: UIImage(named: "signup_validation_error_logo".localized))
                    textField.rightView = imageView
                    personalInfoView.surnameField.textField.rightView = imageView
                } else {
                    textField.layer.borderColor = AppColor.primaryFocus.uiColor.cgColor
                    personalInfoView.surnameField.helperLabel?.text = ""
                    personalInfoView.surnameField.textField.rightView = .none
                }
            }
            
        case personalInfoView.emailField.textField:
            if let text = textField.text {
                if !(viewModel!.validator.emailValidation(email: text)) {
                    textField.layer.borderColor = AppColor.errorDefault.uiColor.cgColor
                    
                    personalInfoView.emailField.helperLabel?.text = "signup_validation_email".localized
                    
                    let imageView = UIImageView(image: UIImage(named: "signup_validation_error_logo".localized))
                    textField.rightView = imageView
                    personalInfoView.emailField.textField.rightView = imageView
                } else {
                    textField.layer.borderColor = AppColor.primaryFocus.uiColor.cgColor
                    personalInfoView.emailField.helperLabel?.text = ""
                    personalInfoView.emailField.textField.rightView = .none
                }
            }
            
        case personalInfoView.phoneField.textField:
            if let text = textField.text {
                if !(viewModel!.validator.isValidPhoneNumber(phoneNumber: text)) {
                    textField.layer.borderColor = AppColor.errorDefault.uiColor.cgColor
                    
                    personalInfoView.phoneField.helperLabel?.text = "signup_validation_phone".localized
                    
                    let imageView = UIImageView(image: UIImage(named: "signup_validation_error_logo".localized))
                    textField.rightView = imageView
                    personalInfoView.phoneField.textField.rightView = imageView
                } else {
                    textField.layer.borderColor = AppColor.primaryFocus.uiColor.cgColor
                    personalInfoView.phoneField.helperLabel?.text = ""
                    personalInfoView.phoneField.textField.rightView = .none
                }
            }
            
        default:
            fatalError()
        }
    }
    
    func isAllValid() -> Bool {
        if !(viewModel!.validator.isValidName(firstName: personalInfoView.nameField.textField.text!)) {
            return false
        } else if !(viewModel!.validator.isValidSurname(lastName: personalInfoView.surnameField.textField.text!)) {
            return false
        } else if !(viewModel!.validator.emailValidation(email: personalInfoView.emailField.textField.text!)) {
            return false
        } else if !(viewModel!.validator.isValidPhoneNumber(phoneNumber: personalInfoView.phoneField.textField.text!)) {
            return false
        }
        
        return true
    }
}

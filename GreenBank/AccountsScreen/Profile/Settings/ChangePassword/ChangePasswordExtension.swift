//
//  ChangePasswordExtension.swift
//  GreenBank
//
//  Created by Eprem Sargsyan on 25.03.24.
//

import UIKit
import GreenBank_CustomUIComponents
import GreenBank_ViewModel

extension ChangePasswordViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        let newPasswordFilled = !(changePasswordView.newPasswordTextField.textField.text?.isEmpty ?? true)
        let confirmPasswordField = !(changePasswordView.confirmPasswordTextField.textField.text?.isEmpty ?? true)
        let flag = isAllValid()
        
        changePasswordView.saveButton.isEnabled = newPasswordFilled && confirmPasswordField && flag
        changePasswordView.saveButton.backgroundColor = changePasswordView.saveButton.isEnabled ? AppColor.primaryDefault.uiColor : AppColor.primaryDisable.uiColor
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        switch textField {
        case changePasswordView.newPasswordTextField.textField: 
            if let text = textField.text {
                if !(viewModel!.validator.passwordValidation(password: text)) {
                    textField.layer.borderColor = AppColor.errorDefault.uiColor.cgColor
                    changePasswordView.newPasswordTextField.helperLabel?.text = "signup_validation_password".localized
                } else {
                    textField.layer.borderColor = AppColor.textGrey.uiColor.cgColor
                    changePasswordView.newPasswordTextField.helperLabel?.text = ""
                }
            }
            
        case changePasswordView.confirmPasswordTextField.textField:
            if let text = textField.text {
                let password = changePasswordView.newPasswordTextField.textField.text ?? ""
                
                if !(viewModel!.validator.confirmPasswordValidation(password: password, confirmPassword: text)) {
                    textField.layer.borderColor = AppColor.errorDefault.uiColor.cgColor
                    changePasswordView.newPasswordTextField.helperLabel?.text = "signup_validation_password".localized
                } else {
                    textField.layer.borderColor = AppColor.textGrey.uiColor.cgColor
                    changePasswordView.confirmPasswordTextField.helperLabel?.text = ""
                }
            }
        default:
            fatalError()
        }
    }
    
    func isAllValid() -> Bool {
        if !(viewModel!.validator.passwordValidation(password: changePasswordView.newPasswordTextField.textField.text!)) {
            return false
        } else if !(viewModel!.validator.confirmPasswordValidation(password: changePasswordView.newPasswordTextField.textField.text!,
                                                                   confirmPassword: changePasswordView.confirmPasswordTextField.textField.text!)) {
            
            return false
        }
        
        return true
    }
}

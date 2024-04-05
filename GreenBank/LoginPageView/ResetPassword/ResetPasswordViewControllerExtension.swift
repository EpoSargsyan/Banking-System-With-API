//
//  ResetPasswordViewControllerExtension.swift
//  GreenBankaa
//
//  Created by Eprem Sargsyan on 16.02.24.
//

import UIKit
import GreenBank_CustomUIComponents
import GreenBank_ViewModel

extension ResetPasswordViewController: UITextFieldDelegate {
    public func textFieldDidChangeSelection(_ textField: UITextField) {
        let passwordField = !(resetPasswordView.passwordTextField.textField.text?.isEmpty ?? true)
        let confirmPasswordField = !(resetPasswordView.confirmPasswordTextField.textField.text?.isEmpty ?? true)
        let flag = isAllValid()

        resetPasswordView.continueButton.isEnabled = passwordField && confirmPasswordField && flag
        resetPasswordView.continueButton.backgroundColor = resetPasswordView.continueButton.isEnabled ? AppColor.primaryDefault.uiColor : AppColor.primaryDisable.uiColor
    }
    
    public func textFieldDidEndEditing(_ textField: UITextField) {
        
        switch textField {
        case resetPasswordView.passwordTextField.textField:
            if let text = textField.text {
                if !(viewModel!.validator.passwordValidation(password: text)) {
                    textField.layer.borderColor = AppColor.errorDefault.uiColor.cgColor
                    resetPasswordView.passwordTextField.helperLabel?.text = "signup_validation_password".localized
                } else {
                    textField.layer.borderColor = AppColor.textGrey.uiColor.cgColor
                    resetPasswordView.passwordTextField.helperLabel?.text = ""
                }
            }
            
        case resetPasswordView.confirmPasswordTextField.textField:
            if let text = textField.text {
                if !(viewModel!.validator.confirmPasswordValidation(password: resetPasswordView.passwordTextField.textField.text ?? "", confirmPassword: text)) {
                    
                    textField.layer.borderColor = AppColor.errorDefault.uiColor.cgColor
                    
                    resetPasswordView.confirmPasswordTextField.helperLabel?.text = "Wrong Password"
                } else {
                    textField.layer.borderColor = AppColor.textGrey.uiColor.cgColor
                    resetPasswordView.confirmPasswordTextField.helperLabel?.text = ""
                }
            }
            
        default:
            fatalError()
        }
    }
    
    func isAllValid() -> Bool {
        if !(viewModel!.validator.passwordValidation(password: resetPasswordView.passwordTextField.textField.text!)) {
            return false
        }
        else if !(viewModel!.validator.confirmPasswordValidation(password: resetPasswordView.passwordTextField.textField.text!, confirmPassword: resetPasswordView.confirmPasswordTextField.textField.text!)) {
            return false
        }
        
        return true
    }
}

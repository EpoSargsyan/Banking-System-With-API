//
//  SignInViewControllerExtension.swift
//  GreenBank
//
//  Created by Eprem Sargsyan on 12.02.24.
//

import UIKit
import GreenBank_CustomUIComponents
import GreenBank_ViewModel

extension SignInViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard when return key is pressed
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        let nameFilled = !(signInView.emailTextField.textField.text?.isEmpty ?? true)
        let emailFilled = !(signInView.passwordTextField.textField.text?.isEmpty ?? true)
        let flag = isAllValid()
        
        signInView.signInButon.isEnabled = nameFilled && emailFilled && flag
        
        signInView.signInButon.backgroundColor = signInView.signInButon.isEnabled ? AppColor.primaryDefault.uiColor : AppColor.primaryDisable.uiColor
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        switch textField {
        case signInView.emailTextField.textField:
            if let text = textField.text {
                if !(viewModel!.validator.emailValidation(email: text)) {
                    textField.layer.borderColor = AppColor.errorDefault.uiColor.cgColor
                    
                    signInView.emailTextField.helperLabel?.text = "login_email_error".localized
                    
                    let imageView = UIImageView(image: UIImage(named: "login_error_icon".localized))
                    textField.rightView = imageView
                    signInView.emailTextField.textField.rightView = imageView
                } else {
                    textField.layer.borderColor = AppColor.textGrey.uiColor.cgColor
                    signInView.emailTextField.helperLabel?.text = ""
                    signInView.emailTextField.textField.rightView = .none
                }
            }
            
        case signInView.passwordTextField.textField:
            if let text = textField.text {
                if !(viewModel!.validator.passwordValidation(password: text)) {
                    textField.layer.borderColor = AppColor.errorDefault.uiColor.cgColor
                    
                    signInView.passwordTextField.helperLabel?.text = "login_password_error".localized
                    
                    textField.resignFirstResponder()
                } else {
                    textField.layer.borderColor = AppColor.textGrey.uiColor.cgColor
                    signInView.passwordTextField.helperLabel?.text = ""
                }
            }
            
        default:
            fatalError()
        }
    }
    
    func isAllValid() -> Bool {
        if !(viewModel!.validator.emailValidation(email: signInView.emailTextField.textField.text!)) {
            return false
        } else if !(viewModel!.validator.passwordValidation(password: signInView.passwordTextField.textField.text!)) {
            return false
        }
        
        return true
    }
}

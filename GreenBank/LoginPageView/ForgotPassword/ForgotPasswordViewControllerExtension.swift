//
//  ForgotPasswordViewControllerExtension.swift
//  GreenBank
//
//  Created by Eprem Sargsyan on 16.02.24.
//

import UIKit
import GreenBank_ViewModel
import GreenBank_CustomUIComponents

extension ForgotPasswordViewController: UITextFieldDelegate {
    public func textFieldDidChangeSelection(_ textField: UITextField) {
        let emailField = !(forgotPasswordView.emailTextField.textField.text?.isEmpty ?? true)
        let isEmailValids = isEmailValid()
        
        forgotPasswordView.continueButton.isEnabled = emailField && isEmailValids
        
        forgotPasswordView.continueButton.backgroundColor = forgotPasswordView.continueButton.isEnabled ? AppColor.primaryDefault.uiColor : AppColor.primaryDisable.uiColor
    }
    
    func isEmailValid() -> Bool {
        if !(viewModel!.validator.emailValidation(email: forgotPasswordView.emailTextField.textField.text!)) {
            return false
        }
        
        return true
    }
}

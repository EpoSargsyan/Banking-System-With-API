//
//  VerificationViewControllerExtension.swift
//  GreenBank
//
//  Created by Eprem Sargsyan on 16.02.24.
//

import UIKit
import GreenBank_CustomUIComponents
import GreenBank_ViewModel

extension VerificationViewController: UITextFieldDelegate {
    public func textFieldDidChangeSelection(_ textField: UITextField) {
        let firstDigit = !(verificationView.digitsView.firstDigit.text?.isEmpty ?? true)
        let secondDigit = !(verificationView.digitsView.secondDigit.text?.isEmpty ?? true)
        let thirdDigit = !(verificationView.digitsView.thirdDigit.text?.isEmpty ?? true)
        let fourthDigit = !(verificationView.digitsView.fourthDigit.text?.isEmpty ?? true)
        
        verificationView.continueButton.isEnabled = firstDigit && secondDigit && thirdDigit && fourthDigit
        
        verificationView.continueButton.backgroundColor = verificationView.continueButton.isEnabled ? AppColor.primaryDefault.uiColor : AppColor.primaryDisable.uiColor
    }
    
    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        guard let character = string.first, character.isNumber else {
            return false
        }
        
        if textField == verificationView.digitsView.firstDigit && string.count == 1 {
            verificationView.digitsView.firstDigit.text = string
            if character.isNumber {
                self.verificationCode += string
            }
            verificationView.digitsView.secondDigit.becomeFirstResponder()
        }
        else if textField == verificationView.digitsView.secondDigit && string.count == 1 {
            verificationView.digitsView.secondDigit.text = string
            if character.isNumber {
                self.verificationCode += string
            }
            verificationView.digitsView.thirdDigit.becomeFirstResponder()
        }
        else if textField == verificationView.digitsView.thirdDigit && string.count == 1 {
            verificationView.digitsView.thirdDigit.text = string
            if character.isNumber {
                self.verificationCode += string
            }
            verificationView.digitsView.fourthDigit.becomeFirstResponder()
        }
        else if textField == verificationView.digitsView.fourthDigit && string.count == 1 {
            if character.isNumber {
                self.verificationCode += string
            }
            verificationView.digitsView.fourthDigit.text = string
            verificationView.digitsView.fourthDigit.resignFirstResponder()
        }
        
        return true
    }
}

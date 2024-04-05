//
//  SettingsExtension .swift
//  GreenBank
//
//  Created by Eprem Sargsyan on 19.03.24.
//

import UIKit
import GreenBank_CustomUIComponents
import GreenBank_ViewModel

extension SettingsViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        let passwordFilled = !(settingsView.popUpView.passwordTextField.textField.text?.isEmpty ?? true)
        
        let flag = settingsView.popUpView.passwordTextField.textField.text == AppDelegate.shared?.keyChain["password"]
        
        settingsView.popUpView.continueBtn.isEnabled = passwordFilled && flag
        settingsView.popUpView.continueBtn.backgroundColor = settingsView.popUpView.continueBtn.isEnabled ? AppColor.primaryDefault.uiColor : AppColor.primaryDisable.uiColor
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.text != AppDelegate.shared?.keyChain["password"] {
            
            textField.layer.borderColor = AppColor.errorDefault.uiColor.cgColor
            settingsView.popUpView.passwordTextField.helperLabel?.text = "Wrong Password!!!"
            settingsView.popUpView.passwordTextField.helperLabel?.textColor = AppColor.errorDefault.uiColor
            
            let imageView = UIImageView(image: UIImage(named: "signup_validation_error_logo".localized))
            textField.rightView = imageView
            settingsView.popUpView.passwordTextField.textField.rightView = imageView
            
        } else {
            
            textField.layer.borderColor = AppColor.textGrey.uiColor.cgColor
            settingsView.popUpView.passwordTextField.textField.rightView = .none
            settingsView.popUpView.passwordTextField.helperLabel?.text = ""
        }
    }
}

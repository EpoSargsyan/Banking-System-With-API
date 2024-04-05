//
//  NewAccountViewControllerExtension.swift
//  GreenBank
//
//  Created by Eprem Sargsyan on 26.02.24.
//

import UIKit
import GreenBank_CustomUIComponents

extension NewAccountViewController: UITextFieldDelegate {
    
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

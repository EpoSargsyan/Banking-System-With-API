//
//  IValidators.swift
//  GreenBank.ViewModel
//
//  Created by Anna Hakobyan on 06.02.24.
//

import Foundation

public protocol IValidators {
    func isFilled(name: String?, surname: String?, birth: String?, email: String?, password: String?, phone: String?) -> Bool
    func emailValidation(email: String) -> Bool
    func passwordValidation(password: String) -> Bool
    func validationForUserRegistrationData(email: String, password: String, confirmPassword: String) -> Bool
    func confirmPasswordValidation(password: String, confirmPassword: String) -> Bool
}

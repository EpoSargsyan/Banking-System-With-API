//
//  Validators.swift
//  GreenBank.ViewModel
//
//  Created by Anna Hakobyan on 06.02.24.
//

import Foundation

public class Validators: IValidators {
    static let shared = Validators()
    
    public func isFilled(name: String?, surname: String?, birth: String?, email: String?, password: String?, phone: String?) -> Bool {
        guard name != nil,
              surname != nil,
              birth != nil,
              email != nil,
              password != nil,
              phone != nil else { return false }
        
        if ((name?.isEmpty != nil)) || ((surname?.isEmpty) != nil) || ((birth?.isEmpty) != nil) || ((email?.isEmpty) != nil) || ((password?.isEmpty) != nil) || ((phone?.isEmpty) != nil) {
            return false
        }
        
        return true
    }
    
    public func emailValidation(email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        
        if emailPredicate.evaluate(with: email) {
            return true
        } else {
            return false
        }
    }
    
    public func passwordValidation(password: String) -> Bool {
        // Check if password length is at least 8 characters
        guard password.count >= 8 else { return false }
        
        // Check if password contains a lowercase letter
        let lowercaseLetterRegex = ".*[a-z]+.*"
        guard NSPredicate(format: "SELF MATCHES %@", lowercaseLetterRegex).evaluate(with: password) else { return false }
        
        // Check if password contains a capital letter
        let capitalLetterRegex = ".*[A-Z]+.*"
        guard NSPredicate(format: "SELF MATCHES %@", capitalLetterRegex).evaluate(with: password) else { return false }
        
        // Check if password contains a number
        let numberRegex = ".*[0-9]+.*"
        guard NSPredicate(format: "SELF MATCHES %@", numberRegex).evaluate(with: password) else { return false }
        return true
    }
    
    public func confirmPasswordValidation(password: String, confirmPassword: String) -> Bool {
        return password == confirmPassword
    }
    
    public func isValidName(firstName: String) -> Bool {
        let nameRegex = #"^[A-Z][a-z]{2,}$"#
        
        do {
            let regex = try NSRegularExpression(pattern: nameRegex, options: [])
            return regex.firstMatch(in: firstName, options: [], range: NSRange(location: 0, length: firstName.utf16.count)) != nil
        } catch {
            print("Invalid regular expression: \(error)")
            return false
        }
    }
    
    public func isValidSurname(lastName: String) -> Bool {
        let nameRegex = #"^[A-Z][a-z]{2,}$"#
        
        do {
            let regex = try NSRegularExpression(pattern: nameRegex, options: [])
            return regex.firstMatch(in: lastName, options: [], range: NSRange(location: 0, length: lastName.utf16.count)) != nil
        } catch {
            print("Invalid regular expression: \(error)")
            return false
        }
    }
    
    public func isValidPhoneNumber(phoneNumber: String) -> Bool {
        let phoneRegex = #"^\+\d{11}$"#

        let regex = try! NSRegularExpression(pattern: phoneRegex, options: [])

        let range = NSRange(location: 0, length: phoneNumber.utf16.count)
        let isValid = regex.firstMatch(in: phoneNumber, options: [], range: range) != nil

        return isValid
    }
    
    public func validationForUserRegistrationData(email: String, password: String, confirmPassword: String) -> Bool {
        if emailValidation(email: email) && passwordValidation(password: password) &&
            passwordValidation(password: password) {
            return true
        }
        
        return false
    }
}

//
//  userEmailInfo.swift
//  GreenBank.ViewModel
//
//  Created by Eprem Sargsyan on 12.03.24.
//

import Foundation

struct UserEmailInfo: Codable {
    let email: String
}

struct ForgotPasswordInfo: Codable {
    let value: Value
    let message: String
    let status: String
}

struct Value: Codable {
}

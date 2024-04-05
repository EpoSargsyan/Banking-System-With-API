//
//  ResetPasswordInfo.swift
//  GreenBank.ViewModel
//
//  Created by Eprem Sargsyan on 12.03.24.
//

import Foundation

public struct ResetPasswordInfo: Codable {
    let password: String
    let userId: String
}

public struct ResetGetInfo: Codable {
    let value: UserPayLoad
    let message: String
    let status: String
}

struct UserPayLoad: Codable {
    let email, id, firstName, lastName: String
    let role: String
}

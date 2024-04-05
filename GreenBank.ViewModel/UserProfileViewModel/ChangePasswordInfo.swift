//
//  ChangePasswordInfo.swift
//  GreenBank.ViewModel
//
//  Created by Eprem Sargsyan on 25.03.24.
//

import Foundation


public struct ChangePasswordInfo: Codable {
    public var userId: String?
    public var oldPassword: String?
    public var newPassword: String?
    public var newPasswordAgain: String?
    public var refreshToken: String?
    
    public init() {}
}

public struct ChangePasswordGetInfo: Codable {
    let value: ChangePasswordInformation
    let message: String
    let status: String
}

public struct ChangePasswordInformation: Codable {
    let email: String
    let id: String
    let firstName: String
    let lastName: String
    let role: String
}


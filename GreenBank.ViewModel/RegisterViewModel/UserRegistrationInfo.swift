//
//  UserRegistrationInfo.swift
//  GreenBank.ViewModel
//
//  Created by Eprem Sargsyan on 09.02.24.
//

import Foundation

public struct UserRegistrationInfo: Codable {
    public var firstName: String?
    public var lastName: String?
    public var email: String?
    public var birthDate: String?
    public var password: String?
    public var phone: String?
    
    public init() {}
}

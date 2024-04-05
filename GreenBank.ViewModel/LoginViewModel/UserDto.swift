//
//  UserDto.swift
//  GreenBank.ViewModel
//
//  Created by Hovo Ohanyan on 25.01.24.
//

import Foundation

public struct ServerResponse: Codable {
    var status: String?
    public var value: AccountData
    var message: String?
}

public struct AccountData: Codable {
    public let accessToken: String
    public let refreshToken: String
    public var user: UserDto
}

public struct UserDto: Codable {
    public let id: String
    public var firstName: String
    public var lastName: String
    public var email: String
    public var phone: String?
    public var img: URL?
    public var dateOfBirth: String?
    public let role: String
}

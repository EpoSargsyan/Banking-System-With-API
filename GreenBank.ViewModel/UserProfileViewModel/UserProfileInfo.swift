//
//  UserProfileInfo.swift
//  GreenBank.ViewModel
//
//  Created by Eprem Sargsyan on 14.03.24.
//

import Foundation

public struct UserProfileInfo: Codable {
    public let value: UserProfileGetInfo
    let message: String
    let status: String
}

public struct UserProfileGetInfo: Codable {
    let id: String
    public let firstName: String
    public let lastName: String
    let role: String?
    public let email: String
}

public struct ChangeUserInfo: Codable {
    var firstName: String?
    var lastName: String?
    var phome: String?
}

public struct CurrentEmailInfo: Codable {
    var email: String
}

public struct NewEmailInfo: Codable {
    var email: String
    var userId: String
}

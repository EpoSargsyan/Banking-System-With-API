//
//  UserVerificationInfo.swift
//  GreenBank.ViewModel
//
//  Created by Eprem Sargsyan on 09.02.24.
//

import Foundation

struct UserRegistationGetInfo: Codable {
    let statusCode: Int?
    let message: String?
    let value: RegisterInfo?
    let status: String?
}

// MARK: - Value
struct RegisterInfo: Codable {
    let id: String
}

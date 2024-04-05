//
//  NewAccountVerification.swift
//  GreenBank.ViewModel
//
//  Created by Eprem Sargsyan on 28.02.24.
//

import Foundation

public struct NewAccountGetInfo: Codable {
    let message: String
    let value: NewAccountInformation
    let status: String
}

public struct NewAccountInformation: Codable {
    public var accountName: String
    public var accountNumber: String
    public var balance: Double
    public var currency: String
    public var accountType: String
    public var isDefault: Bool?
    public var forCard: Bool?
    public var id: String?

    enum CodingKeys: String, CodingKey {
        case accountName, accountNumber, balance, currency, accountType, isDefault, forCard
        case id = "_id"
    }
}

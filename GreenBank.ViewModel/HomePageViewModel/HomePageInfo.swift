//
//  HomePageInfo.swift
//  GreenBank.ViewModel
//
//  Created by Anna Hakobyan on 15.03.24.
//

import Foundation

public struct GetCards: Codable {
    let message: String
    public let value: [CardsDetails]
    let status: String
}

public struct CardsDetails: Codable {
    let userID: String
    public let account: String
    public let cardNumber: String
    public let cardHolderName: String
    public let expirationDate: String
    let cvv: String
    let pin: String
    public let cardType: String
    public let cardName: String
    let design: Int
    public let balance: Int
    public let currency: String
    public let color: Color?
    let id: String

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case account, cardNumber, cardHolderName, expirationDate, cvv, pin, cardType, cardName, balance, currency, design, color
        case id = "_id"
    }
}

// MARK: - Color
public struct Color: Codable {
    public let start: String
    public let end: String
}

public struct GetAccounts: Codable {
    public let message: String
    public let value: [AccountsInformation]
    public let status: String
}

public struct AccountsInformation: Codable {
    let id: String
    public let accountName: String?
    public let accountNumber: String
    public let accountType: String?
    public let balance: Double
    public let currency: String
    public let isDefault: Bool
    let forCard: Bool

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case accountName, accountNumber, accountType, balance, currency, isDefault, forCard
    }
}

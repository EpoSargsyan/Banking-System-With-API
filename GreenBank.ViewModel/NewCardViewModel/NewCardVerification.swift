//
//  NewCardVerification.swift
//  GreenBank.ViewModel
//
//  Created by Anna Hakobyan on 13.03.24.
//

import Foundation

public struct NewCardGetInfo: Codable {
    let message: String
    let value: CardDetails
    let status: String
}

public struct CardDetails: Codable {
    let userID: String
    let account: String
    let cardNumber: String
    let cardHolderName: String
    let expirationDate, cvv, pin, cardType: String
    let cardName, id: String
    let balance: Int
    let color: Color
    let v: Int
    let design: Int

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case account, cardNumber, cardHolderName, expirationDate, cvv, pin, cardType, balance, color, cardName, design
        case id = "_id"
        case v = "__v"
    }
}

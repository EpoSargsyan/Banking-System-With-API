//
//  AccountTransferInformation.swift
//  GreenBank.ViewModel
//
//  Created by Eprem Sargsyan on 28.03.24.
//

import Foundation

public struct TransactionInfo: Codable {
    public var from: String?
    public var to: String?
    public var amount: Double?
    public var description: String?
    public var transactionType: String?
    public var refreshToken: String?
    
    public init() {}
}

public struct TransactionGetInfo: Codable {
    let value: TransferSuccessInfo
    let status: String
    let message: String
}

public struct TransferSuccessInfo: Codable {
    let from: String
    let amount: Int
    let id: String
    let v: Int
    let date: String
    let transactionType: String
    let description: String
    let to: String
    let done: Bool
    let currency: String
    
    enum CodingKeys: String, CodingKey {
        case from, amount
        case id = "_id"
        case v = "__v"
        case date, transactionType, description, to, done, currency
    }
}

//
//  NewCardInfo.swift
//  GreenBank.ViewModel
//
//  Created by Anna Hakobyan on 13.03.24.
//

import Foundation

public struct NewCardInfo: Codable {
    public var userId: String?
    public var currency: String?
    public var cardType: String?
    public var color: CardColor?
    public var design: Int = 0
    
    public init() {}
}

public struct CardColor: Codable {
    public var start: String?
    public var end: String?
    
    public init() {}
}
